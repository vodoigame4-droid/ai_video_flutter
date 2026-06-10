import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_business/core_business.dart';
import 'package:wiwi_havin_base_ads/wiwi_havin_base_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/services/remote_config_service.dart';
import '../../../../core/utils/banner_preload_helper.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AutoLoginUseCase autoLoginUseCase;
  final GetOnboardingStatusUseCase getOnboardingStatusUseCase;
  final GetBannersUseCase getBannersUseCase;
  final GetProfileUseCase getProfileUseCase;

  bool _isOnboardingCompleted = false;
  bool _isVip = false;
  List<String>? _preloadedUrls;

  SplashBloc({
    required this.autoLoginUseCase,
    required this.getOnboardingStatusUseCase,
    required this.getBannersUseCase,
    required this.getProfileUseCase,
  }) : super(const SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      await event.when(
        init: () async {
          _isOnboardingCompleted = false;
          _isVip = false;
          _preloadedUrls = null;
          emit(const SplashState.loading());

          // 1. Request ATT on iOS first, ensuring it is shown and resolved before anything else
          if (Platform.isIOS) {
            final attStopwatch = Stopwatch()..start();
            try {
              LogUtils.d('SplashBloc: Requesting ATT before other initializations...');
              await Future.delayed(const Duration(milliseconds: 500));
              await HavinAdsManager.instance.requestATT();
              attStopwatch.stop();
              LogUtils.i('SplashBloc: requestATT completed in ${attStopwatch.elapsedMilliseconds}ms');
            } catch (e) {
              attStopwatch.stop();
              LogUtils.w('SplashBloc: Failed to request ATT: $e');
            }
          }

          // 2. Initialize Remote Config
          await _initRemoteConfig();

          // Minimum duration to display logo (1.0 second)
          final minDelay = Future.delayed(const Duration(milliseconds: 1000));

          // 3. Run other initializations concurrently
          final concurrentStopwatch = Stopwatch()..start();
          LogUtils.d('SplashBloc: Starting concurrent initialization tasks...');
          await Future.wait([
            _performBackgroundLogin(),
            _performOnboardingPreload(),
            _initHavinSdk(),
            minDelay,
          ]);
          concurrentStopwatch.stop();
          LogUtils.i('SplashBloc: Concurrent initialization tasks completed in ${concurrentStopwatch.elapsedMilliseconds}ms');

          emit(
            SplashState.success(
              isOnboardingCompleted: _isOnboardingCompleted,
              isVip: _isVip,
              preloadedUrls: _preloadedUrls,
            ),
          );
        },
      );
    });
  }

  Future<void> _performBackgroundLogin() async {
    final overallStopwatch = Stopwatch()..start();
    LogUtils.d('SplashBloc: Start background login tasks...');
    try {
      final loginStopwatch = Stopwatch()..start();
      await autoLoginUseCase(NoParams());
      loginStopwatch.stop();
      LogUtils.i('SplashBloc: autoLoginUseCase completed in ${loginStopwatch.elapsedMilliseconds}ms');

      // Pre-initialize daily check-in bloc in background to avoid delay on Home screen
      try {
        final checkinInitStopwatch = Stopwatch()..start();
        sl<DailyCheckInBloc>().add(const DailyCheckInEvent.init());
        checkinInitStopwatch.stop();
        LogUtils.i('SplashBloc: DailyCheckInBloc.init triggered in ${checkinInitStopwatch.elapsedMilliseconds}ms');
      } catch (e) {
        LogUtils.w('SplashBloc: Failed to trigger DailyCheckInBloc init: $e');
      }

      // Fetch the latest profile (getMe API call)
      final profileStopwatch = Stopwatch()..start();
      final profileResult = await getProfileUseCase(NoParams());
      _isVip = profileResult.maybeWhen(
        success: (user) => user.isVip,
        orElse: () => false,
      );
      profileStopwatch.stop();
      LogUtils.i('SplashBloc: getProfileUseCase completed in ${profileStopwatch.elapsedMilliseconds}ms. isVip: $_isVip');

      // Fetch and preload home banner
      final bannerStopwatch = Stopwatch()..start();
      final sharedPreferences = sl<SharedPreferences>();
      await BannerPreloadHelper.preloadBanner(
        getBannersUseCase: getBannersUseCase,
        sharedPreferences: sharedPreferences,
      );
      bannerStopwatch.stop();
      LogUtils.i('SplashBloc: BannerPreloadHelper.preloadBanner completed in ${bannerStopwatch.elapsedMilliseconds}ms');
    } catch (e, stack) {
      LogUtils.e(
        'SplashBloc: Background login failed',
        error: e,
        stackTrace: stack,
      );
    } finally {
      overallStopwatch.stop();
      LogUtils.i('SplashBloc: Total background login tasks duration: ${overallStopwatch.elapsedMilliseconds}ms');
    }
  }

  Future<void> _performOnboardingPreload() async {
    final overallStopwatch = Stopwatch()..start();
    LogUtils.d('SplashBloc: Start onboarding preloading...');
    try {
      final statusStopwatch = Stopwatch()..start();
      final onboardingResult = await getOnboardingStatusUseCase(NoParams());
      _isOnboardingCompleted = onboardingResult.maybeWhen(
        success: (data) => data,
        orElse: () => false,
      );
      statusStopwatch.stop();
      LogUtils.i('SplashBloc: getOnboardingStatusUseCase completed in ${statusStopwatch.elapsedMilliseconds}ms. isOnboardingCompleted: $_isOnboardingCompleted');

      if (!_isOnboardingCompleted) {
        final urls = sl<RemoteConfigService>().getOnboardingUrls();
        if (urls.isNotEmpty) {
          _preloadedUrls = urls;
          final isTest = Platform.environment.containsKey('FLUTTER_TEST');
          if (!isTest) {
            final List<Future<dynamic>> preloadFutures = [];
            for (final url in urls) {
              if (url.startsWith('http')) {
                if (_isVideoUrl(url)) {
                  preloadFutures.add(
                    () async {
                      final stopwatch = Stopwatch()..start();
                      LogUtils.d('SplashBloc: Start preloading onboarding video: $url');
                      final path = await VideoCacheManager().getCachedOrDownload(
                        url,
                        waitForDownload: true,
                      );
                      stopwatch.stop();
                      LogUtils.i('SplashBloc: Preloaded onboarding video in ${stopwatch.elapsedMilliseconds}ms: $url -> $path');
                      return path;
                    }(),
                  );
                } else {
                  preloadFutures.add(
                    () async {
                      final stopwatch = Stopwatch()..start();
                      LogUtils.d('SplashBloc: Start preloading onboarding image: $url');
                      await _preloadImage(url);
                      stopwatch.stop();
                      LogUtils.i('SplashBloc: Preloaded onboarding image in ${stopwatch.elapsedMilliseconds}ms: $url');
                    }(),
                  );
                }
              }
            }
            if (preloadFutures.isNotEmpty) {
              await Future.wait(
                preloadFutures,
              ).timeout(const Duration(seconds: 15), onTimeout: () {
                LogUtils.w('SplashBloc: Onboarding assets preloading timed out at 15s');
                return [];
              });
            }
          }
        }
      }
    } catch (e, stack) {
      LogUtils.e(
        'SplashBloc: Onboarding preload failed',
        error: e,
        stackTrace: stack,
      );
    } finally {
      overallStopwatch.stop();
      LogUtils.i('SplashBloc: Total onboarding preloading time: ${overallStopwatch.elapsedMilliseconds}ms');
    }
  }

  Future<void> _initHavinSdk() async {
    final overallStopwatch = Stopwatch()..start();
    LogUtils.d('SplashBloc: Start HavinSdk initialization...');

    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return;
    }
    try {
      final List<BillingProduct> products = Platform.isIOS
          ? const [
              BillingProduct.consumable('70credits'),
              BillingProduct.consumable('70creditsdis'),
              BillingProduct.consumable('150credits'),
              BillingProduct.consumable('150creditsdis'),
              BillingProduct.consumable('350credits'),
              BillingProduct.consumable('350creditsdis'),
              BillingProduct.consumable('500credits'),
              BillingProduct.consumable('500creditsdis'),
              BillingProduct.consumable('1000creditsdis'),
              BillingProduct.consumable('5000credits'),
              BillingProduct.consumable('5000creditsdis'),
              BillingProduct.subscription('buy_weakly'),
              BillingProduct.subscription('buy_annualy'),
              BillingProduct.subscription('buy_annualy_discount'),
            ]
          : const [
              BillingProduct.consumable('70credits.andr'),
              BillingProduct.consumable('70creditsdis.andr'),
              BillingProduct.consumable('150credits.andr'),
              BillingProduct.consumable('150creditsdis.andr'),
              BillingProduct.consumable('350credits.andr'),
              BillingProduct.consumable('350creditsdis.andr'),
              BillingProduct.consumable('500credits.andr'),
              BillingProduct.consumable('500creditsdis.andr'),
              BillingProduct.consumable('1000creditsdis.andr'),
              BillingProduct.consumable('5000credits.andr'),
              BillingProduct.consumable('5000creditsdis.andr'),
              BillingProduct.subscription('buy_weekly.andr'),
              BillingProduct.subscription('buy_annualy.andr'),
              BillingProduct.subscription('buy_annualy_discount.andr'),
            ];
      final billingConfig = BillingConfig(debugMode: false, products: products);

      await HavinSdk.instance.init(billingConfig: billingConfig);
      sl<IapBloc>().add(const IapEvent.init());
      overallStopwatch.stop();
      LogUtils.i(
        'SplashBloc: HavinSdk initialized in ${overallStopwatch.elapsedMilliseconds}ms. Triggered IapBloc initialization.',
      );
    } catch (e, stack) {
      overallStopwatch.stop();
      LogUtils.e(
        'SplashBloc: HavinSdk initialization failed after ${overallStopwatch.elapsedMilliseconds}ms',
        error: e,
        stackTrace: stack,
      );
    }
  }

  Future<void> _initRemoteConfig() async {
    final stopwatch = Stopwatch()..start();
    LogUtils.d('SplashBloc: Start initializing Remote Config...');
    try {
      final remoteConfigService = sl<RemoteConfigService>();
      await remoteConfigService.initialize();
      stopwatch.stop();
      LogUtils.i('SplashBloc: Remote Config initialized and activated in ${stopwatch.elapsedMilliseconds}ms');
      
      // Preload IAP & Discount videos in the background without awaiting them to avoid blocking splash
      remoteConfigService.preloadVideos().catchError((e) {
        LogUtils.w('SplashBloc: Failed to preload IAP/Discount videos: $e');
      });
    } catch (e, stack) {
      stopwatch.stop();
      LogUtils.e(
        'SplashBloc: Remote Config initialization failed after ${stopwatch.elapsedMilliseconds}ms',
        error: e,
        stackTrace: stack,
      );
    }
  }

  bool _isVideoUrl(String url) {
    final path = url.toLowerCase();
    return path.endsWith('.mp4') ||
        path.endsWith('.mkv') ||
        path.endsWith('.mov') ||
        path.endsWith('.avi') ||
        path.endsWith('.webm') ||
        path.endsWith('.3gp') ||
        path.endsWith('.flv');
  }

  Future<void> _preloadImage(String url) async {
    try {
      final provider = CachedNetworkImageProvider(url);
      final ImageStream stream = provider.resolve(ImageConfiguration.empty);
      final Completer<void> completer = Completer<void>();
      final ImageStreamListener listener = ImageStreamListener(
        (ImageInfo info, bool synchronousCall) {
          if (!completer.isCompleted) completer.complete();
        },
        onError: (exception, stackTrace) {
          if (!completer.isCompleted) completer.complete();
        },
      );
      stream.addListener(listener);
      await completer.future;
      stream.removeListener(listener);
    } catch (e) {
      LogUtils.e('SplashBloc: Failed to preload image $url', error: e);
    }
  }
}
