import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildFeatureItem(
            context,
            icon: Icons.movie_creation_outlined,
            label: t.home_new.imageToVideo,
            onTap: () => context.pushNamed(
              CreateVideoPage.name,
              queryParameters: {'tab': '0'},
            ),
          ),
          const SizedBox(width: 8),
          _buildFeatureItem(
            context,
            icon: Icons.auto_awesome_motion_outlined,
            label: t.home_new.transitionVideo,
            onTap: () => context.pushNamed(
              CreateVideoPage.name,
              queryParameters: {'tab': '1'},
            ),
          ),
          const SizedBox(width: 8),
          _buildFeatureItem(
            context,
            icon: Icons.directions_run_outlined,
            label: t.home_new.imageToDance,
            onTap: () => context.pushNamed(
              CreateVideoPage.name,
              queryParameters: {'tab': '2'},
            ),
          ),
          const SizedBox(width: 8),
          _buildFeatureItem(
            context,
            icon: Icons.grid_view_outlined,
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
    required IconData icon,
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
                Icon(icon, color: Colors.white, size: 24),
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
