import 'package:ai_video_flutter/core/widgets/app_svg_icon.dart';
import 'package:ai_video_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/gradient_border_container.dart';
import '../../../../i18n/strings.g.dart';
import '../../../create_video/presentation/pages/create_video_page.dart';

/// A widget containing the grid of 4 glassmorphic feature actions
/// (Image to Video, Transition Video, Image to Dance, Unified Video) with proper ripple feedback.
class HomeFeaturesGridWidget extends StatelessWidget {
  const HomeFeaturesGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.background, // solid background at bottom
            Colors.transparent, // transparent at top
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          _buildFeatureItem(
            context,
            icon: Assets.icons.icImageHome,
            label: t.home_new.imageToVideo,
            onTap: () => context.pushNamed(
              CreateVideoPage.name,
              queryParameters: {'tab': '0'},
            ),
          ),
          const SizedBox(width: 8),
          _buildFeatureItem(
            context,
            icon: Assets.icons.icTransitionHome,
            label: t.home_new.transitionVideo,
            onTap: () => context.pushNamed(
              CreateVideoPage.name,
              queryParameters: {'tab': '1'},
            ),
          ),
          const SizedBox(width: 8),
          _buildFeatureItem(
            context,
            icon: Assets.icons.icDanceHome,
            label: t.home_new.imageToDance,
            onTap: () => context.pushNamed(
              CreateVideoPage.name,
              queryParameters: {'tab': '2'},
            ),
          ),
          const SizedBox(width: 8),
          _buildFeatureItem(
            context,
            icon: Assets.icons.icUnifiedHome,
            label: t.home_new.unifiedVideo,
            onTap: () => context.pushNamed(
              CreateVideoPage.name,
              queryParameters: {'tab': '3'},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context, {
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GradientBorderContainer(
        height: 90,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        backgroundColor: Colors.white.withValues(alpha: 0.08),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 26,
                  height: 26,
                  child: Center(
                    child: AppSvgIcon(
                      assetName: icon,
                      color: AppColors.white,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    label,
                    style: context.appTheme.navLabelCreateStyle,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
