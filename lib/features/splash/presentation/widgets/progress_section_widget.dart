import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/animation_extensions.dart';
import '../../../../i18n/strings.g.dart';

class ProgressSectionWidget extends StatelessWidget {
  const ProgressSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Custom progress bar with indeterminate animation (running indefinitely)
        SizedBox(
          width: 200,
          height: 6,
          child: Stack(
            children: [
              // Background track matching original Figma styling
              Container(
                width: 200,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFFE2FFF5),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
              // Sliding gradient progress indicator
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) =>
                      AppColors.primaryGradient.createShader(bounds),
                  child: const LinearProgressIndicator(
                    backgroundColor: Colors.transparent,
                    color: Colors.white,
                    minHeight: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Localized loading text
        Text(
          t.splash.loading,
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.subText,
          ),
        ),
      ],
    ).slideAndFade(
      begin: const Offset(0.0, 0.3),
      delay: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 500),
    );
  }
}
