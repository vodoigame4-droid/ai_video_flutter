import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_business/core_business.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AutoLoginUseCase autoLoginUseCase;
  final GetOnboardingStatusUseCase getOnboardingStatusUseCase;
  final GetOnboardingImagesUseCase getOnboardingImagesUseCase;
  Timer? _timer;
  bool _isLoginCompleted = false;
  bool _isOnboardingPreloadCompleted = false;
  bool _isOnboardingCompleted = false;
  List<String>? _preloadedUrls;
  int _progress = 0;

  SplashBloc({
    required this.autoLoginUseCase,
    required this.getOnboardingStatusUseCase,
    required this.getOnboardingImagesUseCase,
  }) : super(const SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      await event.when(
        init: () async {
          _progress = 0;
          _isLoginCompleted = false;
          _isOnboardingPreloadCompleted = false;
          _isOnboardingCompleted = false;
          _preloadedUrls = null;
          emit(const SplashState.loading(0));

          // 1. Start background login process
          _performBackgroundLogin();

          // 2. Start preloading onboarding images/videos if not completed
          _performOnboardingPreload();

          // 3. Start progress animation timer
          _timer?.cancel();
          _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
            _progress += 2;
            
            if (_progress >= 100) {
              if (_isLoginCompleted && _isOnboardingPreloadCompleted) {
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
            emit(SplashState.success(
              isOnboardingCompleted: _isOnboardingCompleted,
              preloadedUrls: _preloadedUrls,
            ));
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
    } catch (e, stack) {
      LogUtils.e('SplashBloc: Background login failed', error: e, stackTrace: stack);
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
        final imagesResult = await getOnboardingImagesUseCase(NoParams());
        await imagesResult.maybeWhen(
          success: (urls) async {
            if (urls.isNotEmpty) {
              _preloadedUrls = urls;
              final List<Future<dynamic>> preloadFutures = [];
              for (final url in urls) {
                if (url.startsWith('http')) {
                  if (_isVideoUrl(url)) {
                    preloadFutures.add(
                      VideoCacheManager().getCachedOrDownload(url, waitForDownload: true),
                    );
                  } else {
                    preloadFutures.add(_preloadImage(url));
                  }
                }
              }
              if (preloadFutures.isNotEmpty) {
                await Future.wait(preloadFutures).timeout(
                  const Duration(seconds: 5),
                  onTimeout: () => [],
                );
              }
            }
          },
          orElse: () {},
        );
      }
    } catch (e, stack) {
      LogUtils.e('SplashBloc: Onboarding preload failed', error: e, stackTrace: stack);
    } finally {
      _isOnboardingPreloadCompleted = true;
      _checkAllInitializationCompleted();
    }
  }

  void _checkAllInitializationCompleted() {
    if (_isLoginCompleted && _isOnboardingPreloadCompleted) {
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
