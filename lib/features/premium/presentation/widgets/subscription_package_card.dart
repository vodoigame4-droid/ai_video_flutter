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
    final Widget cardContent = Container(
      constraints: const BoxConstraints(minHeight: 80),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.subText,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    height: 1.2,
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
                style: TextStyle(
                  color: isSelected ? AppColors.primary : Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                suffix,
                style: TextStyle(
                  color: isSelected
                      ? AppColors.primary.withValues(alpha: 0.8)
                      : AppColors.subText,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.1,
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
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        backgroundColor: Colors.transparent,
        gradient: const LinearGradient(
          colors: [AppColors.secondary, AppColors.primary],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.secondary.withValues(alpha: 0.15),
                AppColors.primary.withValues(alpha: 0.15),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: cardContent,
            ),
          ),
        ),
      );
    } else {
      decoratedCard = Container(
        decoration: BoxDecoration(
          color: AppColors.onSurface.withValues(
            alpha: 0.5,
          ), // Match rgba(23,23,23,0.5)
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: AppColors.activeTab.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
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
            right: 0,
            child: Container(
              constraints: const BoxConstraints(minWidth: 88, minHeight: 21),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: tagColors ?? [AppColors.primary, AppColors.secondary],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Text(
                tagText!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
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
