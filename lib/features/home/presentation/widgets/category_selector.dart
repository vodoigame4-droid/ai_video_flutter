import 'package:ai_video_flutter/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theme/app_theme.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      color: AppColors.background,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;

          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onSelected(category),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Ink(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? context.appTheme.primaryGradient
                      : null,
                  color: isSelected ? null : context.colorScheme.surface,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : context.appTheme.borderColor,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    category,
                    style: isSelected
                        ? context.appTheme.categoryActiveStyleSelected
                        : context.appTheme.categoryInactiveStyle,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
