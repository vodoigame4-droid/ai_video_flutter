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
  Timer? _timer;
  bool _isLoginCompleted = false;
  bool _isOnboardingPreloadCompleted = false;
  bool _isRemoteConfigInitialized = false;
  bool _isHavinSdkInitialized = false;
  bool _isOnboardingCompleted = false;
  List<String>? _preloadedUrls;
  int _progress = 0;

  SplashBloc({
    required this.autoLoginUseCase,
    required this.getOnboardingStatusUseCase,
    required this.getBannersUseCase,
  }) : super(const SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      await event.when(
        init: () async {
          _progress = 0;
          _isLoginCompleted = false;
          _isOnboardingPreloadCompleted = false;
          _isHavinSdkInitialized = false;
          _isRemoteConfigInitialized = false;
          _isOnboardingCompleted = false;
          _preloadedUrls = null;
          emit(const SplashState.loading(0));

          // 1. Start background login process
          _performBackgroundLogin();

          // 2. Start preloading onboarding images/videos if not completed
          _performOnboardingPreload();

          // 3. Initialize Havin SDK with iOS store configurations
          _initHavinSdk();

          // 4. Initialize Firebase Remote Config
          _initRemoteConfig();

          // 5. Start progress animation timer
          _timer?.cancel();
          _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
            _progress += 2;

            if (_progress >= 100) {
              if (_isLoginCompleted &&
                  _isOnboardingPreloadCompleted &&
                  _isHavinSdkInitialized &&
                  _isRemoteConfigInitialized) {
                _progress = 100;
                timer.cancel();
                add(const SplashEvent.progressUpdated(100));
              } else {
                // Hold at 99% until background initialization completes
                _progress = 99;
                add(const SplashEvent.progressUpdated(99));
              }
            } else {
              add(SplashEvent.progressUpdated(_progress));
            }
          });
        },
        progressUpdated: (percent) async {
          if (percent >= 100) {
            emit(
              SplashState.success(
                isOnboardingCompleted: _isOnboardingCompleted,
                preloadedUrls: _preloadedUrls,
              ),
            );
          } else {
            emit(SplashState.loading(percent));
          }
        },
      );
    });
  }

  Future<void> _performBackgroundLogin() async {
    try {
      await autoLoginUseCase(NoParams());
      
      // Fetch and preload home banner (download/cache video/webp or preload image)
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
    } finally {
      _isLoginCompleted = true;
      _checkAllInitializationCompleted();
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
              ).timeout(const Duration(seconds: 5), onTimeout: () => []);
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
      _isOnboardingPreloadCompleted = true;
      _checkAllInitializationCompleted();
    }
  }

  Future<void> _initHavinSdk() async {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      _isHavinSdkInitialized = true;
      _checkAllInitializationCompleted();
      return;
    }
    try {
      final List<BillingProduct> products = Platform.isIOS
          ? const [
              // iOS App Store Connect Consumables
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

              // iOS App Store Connect Subscriptions
              BillingProduct.subscription('buy_weekly'),
              BillingProduct.subscription('buy_annualy'),
              BillingProduct.subscription('buy_annualy_discount'),
            ]
          : const [
              // Android Google Play Consumables
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

              // Android Google Play Subscriptions
              BillingProduct.subscription('buy_weekly.andr'),
              BillingProduct.subscription('buy_annualy.andr'),
              BillingProduct.subscription('buy_annualy_discount.andr'),
            ];

      final billingConfig = BillingConfig(
        debugMode: false,
        products: products,
      );

      await HavinSdk.instance.init(billingConfig: billingConfig);
    } catch (e, stack) {
      LogUtils.e(
        'SplashBloc: HavinSdk initialization failed',
        error: e,
        stackTrace: stack,
      );
    } finally {
      _isHavinSdkInitialized = true;
      _checkAllInitializationCompleted();
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
    } finally {
      _isRemoteConfigInitialized = true;
      _checkAllInitializationCompleted();
    }
  }

  void _checkAllInitializationCompleted() {
    LogUtils.d('SplashBloc: _checkAllInitializationCompleted: login=$_isLoginCompleted, preload=$_isOnboardingPreloadCompleted, havin=$_isHavinSdkInitialized, progress=$_progress');
    if (_isLoginCompleted &&
        _isOnboardingPreloadCompleted &&
        _isHavinSdkInitialized &&
        _isRemoteConfigInitialized) {
      if (_progress >= 99) {
        _timer?.cancel();
        _timer = null;
        add(const SplashEvent.progressUpdated(100));
      }
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

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
