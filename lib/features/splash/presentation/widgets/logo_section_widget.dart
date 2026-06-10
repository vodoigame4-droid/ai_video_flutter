import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/animation_extensions.dart';
import '../../../../i18n/strings.g.dart';

class LogoSectionWidget extends StatelessWidget {
  const LogoSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Premium glassmorphic, glowing logo frame
        Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(28)),
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondary.withValues(alpha: 0.4),
                    AppColors.primary.withValues(alpha: 0.4),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.35),
                    blurRadius: 24,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                  BoxShadow(
                    color: AppColors.secondary.withValues(alpha: 0.2),
                    blurRadius: 12,
                    spreadRadius: -2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.8),
                  borderRadius: const BorderRadius.all(Radius.circular(22)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(22)),
                  child: Image.asset(
                    'assets/images/app_icon.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
            .bounceIn(delay: const Duration(milliseconds: 100))
            .shimmer(duration: const Duration(seconds: 3))
            .float(distance: 8.0, duration: const Duration(seconds: 3)),
        const SizedBox(height: 50),
        // Premium animated app title
        Text(t.splash.appName, style: context.textTheme.displayMedium)
            .animate()
            .fade(
              begin: 0.0,
              end: 1.0,
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 700),
            )
            .scale(
              begin: const Offset(0.7, 0.7),
              end: const Offset(1.0, 1.0),
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutBack,
            )
            .blur(
              begin: const Offset(12, 12),
              end: Offset.zero,
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutCubic,
            )
            .shimmer(
              delay: const Duration(milliseconds: 1000),
              duration: const Duration(seconds: 3),
            ),
      ],
    );
  }
}
