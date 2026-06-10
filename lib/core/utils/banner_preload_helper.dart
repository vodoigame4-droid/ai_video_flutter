import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_business/core_business.dart' hide VideoCacheManager;
import 'video_cache_manager.dart';
import 'log_utils.dart';

/// A utility to fetch, analyze, and preload/cache the home banner during splash.
/// This ensures the banner is shown instantly on home screen transition without loading delays or spinner loops.
class BannerPreloadHelper {
  static const String _tag = 'BannerPreloadHelper';

  /// In-memory cache of the preloaded local file path (for video/webp)
  static String? preloadedLocalPath;

  /// In-memory cache of the current banner URL (for quick access)
  static String? currentBannerUrl;

  /// Check if the given URL is a video or animated webp (which uses media_kit player)
  static bool isVideoOrWebp(String url) {
    final path = url.toLowerCase();
    
    // 1. If it's a standard video format
    if (path.endsWith('.mp4') ||
        path.endsWith('.mkv') ||
        path.endsWith('.mov') ||
        path.endsWith('.avi') ||
        path.endsWith('.webm') ||
        path.endsWith('.3gp') ||
        path.endsWith('.flv')) {
      return true;
    }
    
    // 2. If it's a webp, check if it's animated or does NOT belong to the static images folder
    if (path.endsWith('.webp')) {
      // If it contains "animated" or does not contain "/images/", treat as animated/video webp
      if (path.contains('animated') || !path.contains('/images/')) {
        return true;
      }
    }
    
    return false;
  }

  /// Initialize and preload the home banner.
  /// Should be called during splash screen initialization (after login is completed).
  static Future<void> preloadBanner({
    required GetBannersUseCase getBannersUseCase,
    required SharedPreferences sharedPreferences,
  }) async {
    final overallStopwatch = Stopwatch()..start();
    try {
      LogUtils.d('$_tag: Fetching banners from API...');
      final apiStopwatch = Stopwatch()..start();
      final result = await getBannersUseCase(NoParams());
      apiStopwatch.stop();
      LogUtils.i('$_tag: Banners API call completed in ${apiStopwatch.elapsedMilliseconds}ms');
      
      await result.maybeWhen(
        success: (urls) async {
          if (urls.isNotEmpty) {
            final bannerUrl = urls.first;
            currentBannerUrl = bannerUrl;
            
            // 1. Cache the banner URL in SharedPreferences
            await sharedPreferences.setString(StorageKeys.bannerHomeUrl, bannerUrl);
            LogUtils.d('$_tag: Saved banner URL to storage: $bannerUrl');

            // 2. Preload the content based on media type (skip file preloading in widget test environment)
            final isTest = Platform.environment.containsKey('FLUTTER_TEST');
            if (bannerUrl.startsWith('http') && !isTest) {
              final mediaPreloadStopwatch = Stopwatch()..start();
              if (isVideoOrWebp(bannerUrl)) {
                LogUtils.d('$_tag: Preloading video/webp banner: $bannerUrl');
                try {
                  final localPath = await VideoCacheManager()
                      .getCachedOrDownload(
                        bannerUrl,
                        waitForDownload: true,
                      )
                      .timeout(const Duration(seconds: 3));
                  mediaPreloadStopwatch.stop();
                  if (localPath != null && localPath.isNotEmpty) {
                    preloadedLocalPath = localPath;
                    LogUtils.i('$_tag: Video/webp banner cached in ${mediaPreloadStopwatch.elapsedMilliseconds}ms at: $localPath');
                  } else {
                    LogUtils.w('$_tag: Cached/Downloaded banner path is empty after ${mediaPreloadStopwatch.elapsedMilliseconds}ms');
                  }
                } on TimeoutException {
                  mediaPreloadStopwatch.stop();
                  LogUtils.w('$_tag: Video preloading timed out at 3s. Continuing download in background.');
                  // Trigger background download without blocking, so it keeps caching
                  VideoCacheManager().getCachedOrDownload(bannerUrl, waitForDownload: false);
                }
              } else {
                LogUtils.d('$_tag: Preloading image banner: $bannerUrl');
                await _preloadImage(bannerUrl);
                mediaPreloadStopwatch.stop();
                LogUtils.i('$_tag: Image banner preloaded in ${mediaPreloadStopwatch.elapsedMilliseconds}ms');
              }
            }
          } else {
            LogUtils.w('$_tag: Banners API returned empty list');
          }
        },
        error: (failure) {
          LogUtils.e('$_tag: Banners API failed: ${failure.toErrorCodeOrMessage()}');
        },
        orElse: () {},
      );
    } catch (e, stack) {
      LogUtils.e('$_tag: Error preloading banner', error: e, stackTrace: stack);
    } finally {
      overallStopwatch.stop();
      LogUtils.i('$_tag: Total banner preloading process completed in ${overallStopwatch.elapsedMilliseconds}ms');
    }
  }

  /// Preload image into CachedNetworkImage disk/memory cache
  static Future<void> _preloadImage(String url) async {
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
      LogUtils.d('$_tag: Image banner preloaded successfully');
    } catch (e) {
      LogUtils.e('$_tag: Failed to preload image $url', error: e);
    }
  }
}
