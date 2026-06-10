import 'package:ai_video_flutter/core/extensions/animation_extensions.dart';
import 'package:ai_video_flutter/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/glassmorphic_container.dart';
import '../../../../core/widgets/gradient_button.dart';

import '../../../../core/widgets/smooth_video_player_widget.dart';

class ObPageTemplate extends StatefulWidget {
  final String backgroundImage;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const ObPageTemplate({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  State<ObPageTemplate> createState() => _ObPageTemplateState();
}

class _ObPageTemplateState extends State<ObPageTemplate> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool _isVideo(String path) {
    final p = path.toLowerCase();
    return p.endsWith('.mp4') ||
        p.endsWith('.mkv') ||
        p.endsWith('.mov') ||
        p.endsWith('.avi') ||
        p.endsWith('.webm') ||
        p.endsWith('.3gp') ||
        p.endsWith('.flv');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        // Background image or video (loaded dynamically)
        Positioned.fill(
          child: _isVideo(widget.backgroundImage)
              ? SmoothVideoPlayerWidget(
                  videoUrl: widget.backgroundImage,
                  fit: BoxFit.cover,
                  autoPlay: true,
                  loop: true,
                  showMuteButton: false,
                  showPlayPauseButton: false,
                  playMuted: true,
                )
              : AppImage(
                  imageUrl: widget.backgroundImage,
                  fit: BoxFit.cover,
                ),
        ),
        // Top shadow overlay
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 60,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withValues(alpha: 0.8),
                  Colors.black.withValues(alpha: 0.6),
                  Colors.black.withValues(alpha: 0.4),
                  Colors.black.withValues(alpha: 0.2),
                  Colors.black.withValues(alpha: 0.1),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        // Bottom shadow overlay
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.3),
                    Colors.black.withValues(alpha: 0.6),
                  ],
                  stops: const [0.0, 0.4, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
        // Onboarding Card
        Positioned(
          bottom: 60,
          left: 24,
          right: 24,
          child: GlassmorphicContainer(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            blurSigmaX: 5.0,
            blurSigmaY: 5.0,
            borderRadius: 15.0,
            backgroundColor: Colors.black.withValues(alpha: 0.1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text section
                Text(
                  widget.title,
                  style: context.appTheme.onboardingTitleStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.subtitle,
                  style: context.appTheme.onboardingSubtitleStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                // Gradient action button
                GradientButton(
                  gradient: AppColors.primaryGradient,
                  width: double.infinity,
                  label: widget.buttonText,
                  onPressed: widget.onButtonPressed,
                  trailingIcon: SvgPicture.asset(
                    'assets/icons/ic_arrow_right.svg',
                    width: 20,
                    height: 20,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ).shake().shimmer(),
              ],
            ),
          ).blurFadeIn(
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 100),
          ),
        ),
      ],
    );
  }
}
