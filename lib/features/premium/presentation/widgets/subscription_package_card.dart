import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/gradient_border_container.dart';

class SubscriptionPackageCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String suffix;
  final String? tagText;
  final List<Color>? tagColors;
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionPackageCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.suffix,
    this.tagText,
    this.tagColors,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Widget cardContent = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Left Content: Title and description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.subText,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Right Content: Price and Suffix
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                suffix,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // Decorator shell representing card selection state
    Widget decoratedCard;
    if (isSelected) {
      decoratedCard = GradientBorderContainer(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        backgroundColor: Colors.white.withValues(alpha: 0.05), // Subtle glass effect
        gradient: const LinearGradient(
          colors: [AppColors.secondary, AppColors.primary],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: cardContent,
          ),
        ),
      );
    } else {
      decoratedCard = Container(
        decoration: BoxDecoration(
          color: AppColors.onSurface.withValues(alpha: 0.5), // Match rgba(23,23,23,0.5)
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: AppColors.activeTab.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: cardContent,
          ),
        ),
      );
    }

    // Wrap in stack to overlay top-right tag
    return Stack(
      clipBehavior: Clip.none,
      children: [
        decoratedCard,
        if (tagText != null)
          Positioned(
            top: 0,
            right: 24,
            child: FractionalTranslation(
              translation: const Offset(0.0, -0.5),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: tagColors ?? [const Color(0xFFfae123), const Color(0xFFff6320)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                ),
                child: Text(
                  tagText!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
