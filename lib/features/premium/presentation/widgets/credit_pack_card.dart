import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../gen/assets.gen.dart';

class CreditPackCard extends StatelessWidget {
  final String title;
  final String videoEstimate;
  final String priceText;
  final String? tagText;
  final List<Color>? tagColors;
  final VoidCallback onTap;

  const CreditPackCard({
    super.key,
    required this.title,
    required this.videoEstimate,
    required this.priceText,
    this.tagText,
    this.tagColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Outer Card Container with Border and Background
        Container(
          decoration: BoxDecoration(
            color: AppColors.onSurface.withValues(alpha: 0.5), // rgba(23, 23, 23, 0.5)
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color: const Color(0xFF778877).withValues(alpha: 0.53),
              width: 1,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 22, 12, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // 1. Credit Icon
                    Image.asset(
                      Assets.icons.icCreditIcon.path,
                      width: 33,
                      height: 33,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8),

                    // 2. Credits Count & Videos Estimate
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      videoEstimate,
                      style: const TextStyle(
                        color: AppColors.subText,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),

                    // 3. Price Button (Gradient Pill)
                    Container(
                      height: 36,
                      decoration: const BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            priceText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Corner Badge (e.g. Most Popular, Best Value)
        if (tagText != null)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 86,
                minHeight: 21,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: tagColors ?? [const Color(0xFFff6320), const Color(0xFFfae123)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Text(
                tagText!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
