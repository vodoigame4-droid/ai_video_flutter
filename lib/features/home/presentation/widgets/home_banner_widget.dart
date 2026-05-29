import 'package:ai_video_flutter/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/app_image.dart';

/// The top banner background section of the HomePage.
/// Renders the background image (animated WebP) and dark gradient overlay.
class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 320,
      child: Stack(
        children: [
          // Banner background image (Animated WebP loaded with cache and shimmer, falls back to asset on error)
          Positioned.fill(
            child: AppImage(
              imageUrl:
                  'https://mathiasbynens.be/demo/animated-webp-supported.webp',
              fit: BoxFit.cover,
              errorWidget: Image.asset(
                'assets/images/home_banner.png',
                fit: BoxFit.cover,
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
                      Colors
                          .transparent, // Top: semi-transparent app backgrounddle: transparent to show image clearly
                      // Bottom: solid app background to blend seamlessly
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.5, 1],
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
