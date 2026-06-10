import 'package:ai_video_flutter/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';

class CreditPackRow extends StatelessWidget {
  final String title;
  final String videoEstimate;
  final String priceText;
  final String? tagText;
  final List<Color>? tagColors;
  final bool isSelected;
  final VoidCallback onTap;

  const CreditPackRow({
    super.key,
    required this.title,
    required this.videoEstimate,
    required this.priceText,
    this.tagText,
    this.tagColors,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Selection styles
    final Color borderColor = isSelected
        ? const Color(0xFF00D492)
        : Colors.white.withValues(alpha: 0.12);
    final Color backgroundColor = isSelected
        ? const Color(0xFF00D492).withValues(alpha: 0.08)
        : Colors.white.withValues(alpha: 0.05);
    final double borderWidth = isSelected ? 1.5 : 1.0;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main Row Container
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            border: Border.all(color: borderColor, width: borderWidth),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 14.0,
                ),
                child: Row(
                  children: [
                    // Gem/Coin Icon
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00D492).withValues(alpha: 0.0),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          Assets.images.icCredit.path,
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Title & Description Stack
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTextStyles.paywallCardPrice.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            videoEstimate,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.5),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Price text
                    Text(
                      priceText,
                      style: AppTextStyles.paywallCardPrice.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Corner Tag Badge on top-right
        if (tagText != null)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 100,
              height: 20,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:
                      tagColors ??
                      [const Color(0xFFff6320), const Color(0xFFfae123)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topRight: Radius.circular(14),
                ),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
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
          ),
      ],
    );
  }
}
