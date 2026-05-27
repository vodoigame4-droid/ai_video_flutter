import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../../i18n/strings.g.dart';

class CategorySelectorWidget extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  const CategorySelectorWidget({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  String _getTranslatedCategory(BuildContext context, String category) {
    final t = Translations.of(context);
    switch (category.toLowerCase()) {
      case 'all':
        return t.templates.all;
      case 'trending':
        return t.home.trending;
      case 'new':
        return t.home.new_section;
      case 'toy box':
      case 'toy figure box':
        return t.home.toy_box;
      case 'epic morph':
        return t.home.epic_morph;
      case 'anime':
        return t.home.anime;
      default:
        return category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category.toLowerCase() == selectedCategory.toLowerCase();

          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onSelected(category),
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Ink(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? const LinearGradient(
                          colors: [Color(0xFF2BC5C5), Color(0xFF24C780)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )
                      : null,
                  color: isSelected ? null : Colors.black.withValues(alpha: 0.6),
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                ),
                child: Center(
                  child: Text(
                    _getTranslatedCategory(context, category),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 14,
                    ) ??
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
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
