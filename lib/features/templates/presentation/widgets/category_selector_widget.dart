import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../../i18n/strings.g.dart';

class CategorySelectorWidget extends StatefulWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  const CategorySelectorWidget({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  State<CategorySelectorWidget> createState() => _CategorySelectorWidgetState();
}

class _CategorySelectorWidgetState extends State<CategorySelectorWidget> {
  late final ScrollController _scrollController;
  final Map<int, GlobalKey> _itemKeys = {};

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Scroll to the selected category on first render
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelected();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSelected() {
    if (!mounted) return;
    final index = widget.categories.indexWhere(
      (c) => c.toLowerCase() == widget.selectedCategory.toLowerCase(),
    );
    if (index != -1) {
      final key = _itemKeys[index];
      if (key != null) {
        final context = key.currentContext;
        if (context != null) {
          Scrollable.ensureVisible(
            context,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: 0.5,
          );
        }
      }
    }
  }

  GlobalKey _getKey(int index) {
    return _itemKeys.putIfAbsent(index, () => GlobalKey());
  }

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
    if (widget.categories.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 40,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: List.generate(
            widget.categories.length * 2 - 1,
            (index) {
              if (index.isOdd) {
                return const SizedBox(width: 8);
              }
              final categoryIndex = index ~/ 2;
              final category = widget.categories[categoryIndex];
              final isSelected =
                  category.toLowerCase() == widget.selectedCategory.toLowerCase();

              return Material(
                key: _getKey(categoryIndex),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => widget.onSelected(category),
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? const LinearGradient(
                              colors: [Color(0xFF2BC5C5), Color(0xFF24C780)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            )
                          : null,
                      color: isSelected ? null : AppColors.categoryUnselected,
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                    ),
                    child: Center(
                      child: Text(
                        _getTranslatedCategory(context, category),
                        style:
                            context.textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 14,
                            ) ??
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
