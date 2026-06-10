import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:core_business/core_business.dart';

/// Service wrapper for Firebase Remote Config.
/// Initializes, fetches, and provides remote config values.
/// Also preloads video assets into cache during splash.
class RemoteConfigService {
  static const String _tag = 'RemoteConfigService';

  /// Remote Config keys
  static const String rcBannerHome = 'rcBannerHome';
  static const String rcBgIAP = 'rcBgIAP';
  static const String rcBgDiscount = 'rcBgDiscount';
  static const String rcBgVideosJson = 'background_videos';
  static const String rcVideoGenCost = 'video_gen_cost';
  static const String rcVideoGenFullHdCost = 'video_gen_full_hd_cost';
  static const int defaultVideoGenCost = 35;
  static const int defaultVideoGenFullHdCost = 70;

  /// Default fallback values
  static const String defaultBannerUrl =
      'https://mathiasbynens.be/demo/animated-webp-supported.webp';
  static const String defaultBgIAPUrl =
      'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/videos/786913993694.mp4';
  static const String defaultBgDiscountUrl =
      'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/videos/709be36f7bdb.mp4';

  static const String defaultBgVideosJson = '''
{
  "banner_home": "https://mathiasbynens.be/demo/animated-webp-supported.webp",
  "iap": "https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/videos/786913993694.mp4",
  "discount": "https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/videos/709be36f7bdb.mp4",
  "guides": [
    "https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/5c43a471fa58.webp",
    "https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/8c0c37e84228.webp",
    "https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/d0ae5af99672.webp",
    "https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/cb6beb974833.webp"
  ],
  "onboarding": [
    "https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/5c43a471fa58.webp",
    "https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/8c0c37e84228.webp",
    "https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/d0ae5af99672.webp",
    "https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/cb6beb974833.webp",
    "https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/e80755ca295c.webp"
  ],
  "video_gen_cost": 35,
  "video_gen_full_hd_cost": 70
}
''';

  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService._(this._remoteConfig);

  /// Singleton instance
  static RemoteConfigService? _instance;

  /// Get or create the singleton instance.
  static RemoteConfigService get instance {
    _instance ??= RemoteConfigService._(FirebaseRemoteConfig.instance);
    return _instance!;
  }

  /// Initialize Remote Config with defaults, then fetch & activate.
  /// Should be called once during splash/app startup.
  Future<void> initialize() async {
    try {
      // Set default values
      await _remoteConfig.setDefaults({
        rcBannerHome: defaultBannerUrl,
        rcBgIAP: defaultBgIAPUrl,
        rcBgDiscount: defaultBgDiscountUrl,
        rcBgVideosJson: defaultBgVideosJson,
        rcVideoGenCost: defaultVideoGenCost,
        rcVideoGenFullHdCost: defaultVideoGenFullHdCost,
      });

      // Configure settings: fetch interval 1 hour for release, 0 for debug
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: kDebugMode
              ? Duration.zero
              : const Duration(hours: 1),
        ),
      );

      // Fetch and activate
      await _remoteConfig.fetchAndActivate();

      LogUtils.d('$_tag: Remote Config initialized and activated successfully');
      LogUtils.d('$_tag: $rcBannerHome = ${getBannerHomeUrl()}');
      LogUtils.d('$_tag: $rcBgIAP = ${getBgIAPUrl()}');
      LogUtils.d('$_tag: $rcBgDiscount = ${getBgDiscountUrl()}');
    } catch (e, stack) {
      LogUtils.e(
        '$_tag: Failed to initialize Remote Config',
        error: e,
        stackTrace: stack,
      );
    }
  }

  /// Preload all video URLs from Remote Config into VideoCacheManager.
  /// Should be called during splash so videos are ready when screens open.
  Future<void> preloadVideos() async {
    final videoCacheManager = VideoCacheManager();
    final urls = [getBgIAPUrl(), getBgDiscountUrl()];

    LogUtils.d('$_tag: Preloading ${urls.length} videos into cache...');
    final overallStopwatch = Stopwatch()..start();

    final futures = urls.map((url) {
      if (url.startsWith('http')) {
        final stopwatch = Stopwatch()..start();
        LogUtils.d('$_tag: Start preloading background video: $url');
        return videoCacheManager
            .getCachedOrDownload(url, waitForDownload: true)
            .then((path) {
              stopwatch.stop();
              LogUtils.i('$_tag: Preloaded video in ${stopwatch.elapsedMilliseconds}ms: $url -> $path');
            })
            .catchError((e) {
              stopwatch.stop();
              LogUtils.e('$_tag: Failed to preload video after ${stopwatch.elapsedMilliseconds}ms: $url', error: e);
            });
      }
      return Future<void>.value();
    }).toList();

    await Future.wait(futures).timeout(
      const Duration(seconds: 8),
      onTimeout: () {
        LogUtils.w('$_tag: Video preload timed out after 8s');
        return [];
      },
    );

    overallStopwatch.stop();
    LogUtils.i('$_tag: Video preloading completed in ${overallStopwatch.elapsedMilliseconds}ms');
  }

  // ── Getters ──

  Map<String, dynamic>? _getParsedBgVideosJson() {
    try {
      final value = _remoteConfig.getString(rcBgVideosJson);
      if (value.isNotEmpty) {
        final decoded = jsonDecode(value);
        if (decoded is Map<String, dynamic>) {
          return decoded;
        }
      }
    } catch (e, stack) {
      LogUtils.e(
        '$_tag: Failed to parse $rcBgVideosJson',
        error: e,
        stackTrace: stack,
      );
    }
    return null;
  }

  /// Get the banner home image URL from Remote Config.
  String getBannerHomeUrl() {
    final jsonMap = _getParsedBgVideosJson();
    if (jsonMap != null && jsonMap['banner_home'] != null) {
      final url = jsonMap['banner_home'].toString();
      if (url.isNotEmpty) return url;
    }
    final value = _remoteConfig.getString(rcBannerHome);
    if (value.isEmpty) return defaultBannerUrl;
    return value;
  }

  /// Get the IAP background video URL from Remote Config.
  String getBgIAPUrl() {
    final jsonMap = _getParsedBgVideosJson();
    if (jsonMap != null && jsonMap['iap'] != null) {
      final url = jsonMap['iap'].toString();
      if (url.isNotEmpty) return url;
    }
    final value = _remoteConfig.getString(rcBgIAP);
    if (value.isEmpty) return defaultBgIAPUrl;
    return value;
  }

  /// Get the Discount background video URL from Remote Config.
  String getBgDiscountUrl() {
    final jsonMap = _getParsedBgVideosJson();
    if (jsonMap != null && jsonMap['discount'] != null) {
      final url = jsonMap['discount'].toString();
      if (url.isNotEmpty) return url;
    }
    final value = _remoteConfig.getString(rcBgDiscount);
    if (value.isEmpty) return defaultBgDiscountUrl;
    return value;
  }

  /// Get the guide image URLs list from Remote Config.
  List<String> getGuideImageUrls() {
    final jsonMap = _getParsedBgVideosJson();
    if (jsonMap != null && jsonMap['guides'] != null) {
      final guides = jsonMap['guides'];
      if (guides is List && guides.isNotEmpty) {
        return guides.map((e) => e.toString()).toList();
      }
    }
    return const [
      'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/f274548b10c1.webp',
      'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/f1e7f3744849.webp',
      'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/c3781fec7331.webp',
      'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/71b69fc44403.webp',
    ];
  }

  /// Get the cost to generate a video (default 10 credits) from Remote Config.
  int get videoGenCost {
    final jsonMap = _getParsedBgVideosJson();
    if (jsonMap != null && jsonMap['video_gen_cost'] != null) {
      final cost = int.tryParse(jsonMap['video_gen_cost'].toString());
      if (cost != null) return cost;
    }
    final value = _remoteConfig.getInt(rcVideoGenCost);
    if (value == 0) return defaultVideoGenCost;
    return value;
  }

  /// Get the cost to generate a Full HD video (default 70 credits) from Remote Config.
  int get videoGenFullHdCost {
    final jsonMap = _getParsedBgVideosJson();
    if (jsonMap != null && jsonMap['video_gen_full_hd_cost'] != null) {
      final cost = int.tryParse(jsonMap['video_gen_full_hd_cost'].toString());
      if (cost != null) return cost;
    }
    final value = _remoteConfig.getInt(rcVideoGenFullHdCost);
    if (value == 0) return defaultVideoGenFullHdCost;
    return value;
  }

  /// Get the onboarding image URLs list from Remote Config.
  List<String> getOnboardingUrls() {
    final jsonMap = _getParsedBgVideosJson();
    if (jsonMap != null && jsonMap['onboarding'] != null) {
      final onboarding = jsonMap['onboarding'];
      if (onboarding is List && onboarding.isNotEmpty) {
        return onboarding.map((e) => e.toString()).toList();
      }
    }
    return const [
      'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/f274548b10c1.webp',
      'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/f1e7f3744849.webp',
      'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/c3781fec7331.webp',
      'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/71b69fc44403.webp',
      'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/images/f274548b10c1.webp',
    ];
  }
}
