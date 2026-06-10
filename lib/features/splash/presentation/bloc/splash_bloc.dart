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

          // 1. Initialize Remote Config first so that it is ready for other preloading tasks
          await _initRemoteConfig();

          // Minimum duration to display logo (1.5 seconds)
          final minDelay = Future.delayed(const Duration(milliseconds: 1500));

          // 2. Run other initializations concurrently
          await Future.wait([
            _performBackgroundLogin(),
            _performOnboardingPreload(),
            _initHavinSdk(),
            minDelay,
          ]);

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
    try {
      await autoLoginUseCase(NoParams());

      // Fetch the latest profile (getMe API call)
      final profileResult = await getProfileUseCase(NoParams());
      _isVip = profileResult.maybeWhen(
        success: (user) => user.isVip,
        orElse: () => false,
      );

      // Fetch and preload home banner
      final sharedPreferences = sl<SharedPreferences>();
      await BannerPreloadHelper.preloadBanner(
        getBannersUseCase: getBannersUseCase,
        sharedPreferences: sharedPreferences,
      );
    } catch (e, stack) {
      LogUtils.e(
        'SplashBloc: Background login failed',
        error: e,
        stackTrace: stack,
      );
    }
  }

  Future<void> _performOnboardingPreload() async {
    try {
      final onboardingResult = await getOnboardingStatusUseCase(NoParams());
      _isOnboardingCompleted = onboardingResult.maybeWhen(
        success: (data) => data,
        orElse: () => false,
      );

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
                    VideoCacheManager().getCachedOrDownload(
                      url,
                      waitForDownload: true,
                    ),
                  );
                } else {
                  preloadFutures.add(_preloadImage(url));
                }
              }
            }
            if (preloadFutures.isNotEmpty) {
              await Future.wait(
                preloadFutures,
              ).timeout(const Duration(seconds: 30), onTimeout: () => []);
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
    }
  }

  Future<void> _initHavinSdk() async {
    if (Platform.isIOS) {
      await HavinAdsManager.instance.requestATT();
    }

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
      LogUtils.d(
        'SplashBloc: HavinSdk initialized. Triggered IapBloc initialization.',
      );
    } catch (e, stack) {
      LogUtils.e(
        'SplashBloc: HavinSdk initialization failed',
        error: e,
        stackTrace: stack,
      );
    }
  }

  Future<void> _initRemoteConfig() async {
    try {
      final remoteConfigService = sl<RemoteConfigService>();
      await remoteConfigService.initialize();
      await remoteConfigService.preloadVideos();
    } catch (e, stack) {
      LogUtils.e(
        'SplashBloc: Remote Config initialization failed',
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
