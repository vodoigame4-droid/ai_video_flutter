import 'package:ai_video_flutter/core/extensions/animation_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glassmorphic_container.dart';
import '../../../../core/widgets/gradient_button.dart';

class ObPageTemplate extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Positioned.fill(child: Image.asset(backgroundImage, fit: BoxFit.cover)),
        // Top shadow overlay
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 80,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withValues(alpha: 0.8),
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
                    Colors.black.withValues(alpha: 0.5),
                    Colors.black,
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text section
                Text(
                  title,
                  style: context.appTheme.onboardingTitleStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  subtitle,
                  style: context.appTheme.onboardingSubtitleStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                // Gradient action button
                GradientButton(
                  width: double.infinity,
                  label: buttonText,
                  onPressed: onButtonPressed,
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
          ),
        ),
      ],
    );
  }
}
