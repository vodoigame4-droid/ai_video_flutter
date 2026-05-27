import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';

class ProgressSectionWidget extends StatelessWidget {
  final int percent;

  const ProgressSectionWidget({
    super.key,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Custom progress bar matching Figma styling
        SizedBox(
          width: 174,
          height: 10,
          child: Stack(
            children: [
              // Background track
              Container(
                width: 174,
                height: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFFE2FFF5),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
              // Progress fill
              FractionallySizedBox(
                widthFactor: percent / 100.0,
                child: Container(
                  height: 10,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Progress percentage text
        Text(
          '$percent%',
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.subText,
          ),
        ),
      ],
    );
  }
}
