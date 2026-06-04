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

  /// Default fallback values
  static const String defaultBannerUrl =
      'https://mathiasbynens.be/demo/animated-webp-supported.webp';
  static const String defaultBgIAPUrl =
      'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/videos/786913993694.mp4';
  static const String defaultBgDiscountUrl =
      'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/videos/709be36f7bdb.mp4';

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
      });

      // Configure settings: fetch interval 1 hour for release, 0 for debug
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ));

      // Fetch and activate
      await _remoteConfig.fetchAndActivate();

      LogUtils.d('$_tag: Remote Config initialized and activated successfully');
      LogUtils.d('$_tag: $rcBannerHome = ${getBannerHomeUrl()}');
      LogUtils.d('$_tag: $rcBgIAP = ${getBgIAPUrl()}');
      LogUtils.d('$_tag: $rcBgDiscount = ${getBgDiscountUrl()}');
    } catch (e, stack) {
      LogUtils.e('$_tag: Failed to initialize Remote Config',
          error: e, stackTrace: stack);
    }
  }

  /// Preload all video URLs from Remote Config into VideoCacheManager.
  /// Should be called during splash so videos are ready when screens open.
  Future<void> preloadVideos() async {
    final videoCacheManager = VideoCacheManager();
    final urls = [getBgIAPUrl(), getBgDiscountUrl()];

    LogUtils.d('$_tag: Preloading ${urls.length} videos into cache...');

    final futures = urls.map((url) {
      if (url.startsWith('http')) {
        return videoCacheManager
            .getCachedOrDownload(url, waitForDownload: true)
            .then((path) {
          LogUtils.d('$_tag: Preloaded video $url -> $path');
        }).catchError((e) {
          LogUtils.e('$_tag: Failed to preload video $url', error: e);
        });
      }
      return Future<void>.value();
    }).toList();

    await Future.wait(futures).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        LogUtils.w('$_tag: Video preload timed out after 15s');
        return [];
      },
    );

    LogUtils.d('$_tag: Video preloading completed');
  }

  // ── Getters ──

  /// Get the banner home image URL from Remote Config.
  String getBannerHomeUrl() {
    final value = _remoteConfig.getString(rcBannerHome);
    if (value.isEmpty) return defaultBannerUrl;
    return value;
  }

  /// Get the IAP background video URL from Remote Config.
  String getBgIAPUrl() {
    final value = _remoteConfig.getString(rcBgIAP);
    if (value.isEmpty) return defaultBgIAPUrl;
    return value;
  }

  /// Get the Discount background video URL from Remote Config.
  String getBgDiscountUrl() {
    final value = _remoteConfig.getString(rcBgDiscount);
    if (value.isEmpty) return defaultBgDiscountUrl;
    return value;
  }
}
