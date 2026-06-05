import 'package:ai_video_flutter/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:core_business/core_business.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/services/remote_config_service.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/smooth_video_player_widget.dart';
import '../../../../core/utils/banner_preload_helper.dart';

/// The top banner background section of the HomePage.
/// Renders the background image or video (MP4, animated WebP, etc.).
/// Preloaded during splash for an instant, smooth user experience.
class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Get the banner URL from helper or cached SharedPreferences, falling back to Remote Config
    final prefs = sl<SharedPreferences>();
    final bannerUrl = BannerPreloadHelper.currentBannerUrl ??
        prefs.getString(StorageKeys.bannerHomeUrl) ??
        sl<RemoteConfigService>().getBannerHomeUrl();

    final isVideoOrWebp = BannerPreloadHelper.isVideoOrWebp(bannerUrl);
    
    // 2. Use preloaded local path if available to bypass network loading completely
    final localPath = BannerPreloadHelper.preloadedLocalPath;
    final mediaSource = (isVideoOrWebp && localPath != null) ? localPath : bannerUrl;

    return SizedBox(
      width: double.infinity,
      height: 320,
      child: Stack(
        children: [
          // Banner background media
          Positioned.fill(
            child: RepaintBoundary(
              child: isVideoOrWebp
                  ? SmoothVideoPlayerWidget(
                      videoUrl: mediaSource,
                      fit: BoxFit.cover,
                      autoPlay: true,
                      loop: true,
                      showMuteButton: false,
                      showPlayPauseButton: false,
                      playMuted: true,
                    )
                  : AppImage(
                      imageUrl: mediaSource,
                      fit: BoxFit.cover,
                      errorWidget: Image.asset(
                        'assets/images/home_banner.png',
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          // Dark gradient overlay to blend into the app's background color (0xFF171717)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.background,
                      Colors.transparent, // Top: transparent, Bottom: solid app background
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.5, 1],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
