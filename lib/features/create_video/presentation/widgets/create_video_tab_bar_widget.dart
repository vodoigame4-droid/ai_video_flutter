import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';

class CreateVideoTabBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onHistoryPressed;

  const CreateVideoTabBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onHistoryPressed,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    // Define tabs data: icon and label translation keys
    final tabs = [
      _TabData(Icons.movie_creation_outlined, t.home_new.imageToVideo.replaceAll('\n', ' ')),
      _TabData(Icons.auto_awesome_motion_outlined, t.home_new.transitionVideo.replaceAll('\n', ' ')),
      _TabData(Icons.directions_run_outlined, t.home_new.imageToDance.replaceAll('\n', ' ')),
      _TabData(Icons.grid_view_outlined, t.home_new.unifiedVideo.replaceAll('\n', ' ')),
    ];

    return Row(
      children: [
        // Tab selectors
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.05),
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.12),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: List.generate(tabs.length, (index) {
                    final isSelected = selectedIndex == index;
                    final tab = tabs[index];

                    return Expanded(
                      flex: isSelected ? 2 : 1,
                      child: InkWell(
                        onTap: () => onTabSelected(index),
                        borderRadius: const BorderRadius.all(Radius.circular(100)),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          alignment: Alignment.center,
                          decoration: isSelected
                              ? BoxDecoration(
                                  gradient: context.appTheme.primaryGradient,
                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                )
                              : null,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                tab.icon,
                                color: isSelected ? AppColors.white : AppColors.white.withValues(alpha: 0.6),
                                size: 18,
                              ),
                              if (isSelected) ...[
                                const SizedBox(width: 6),
                                Flexible(
                                  child: Text(
                                    tab.label,
                                    style: context.appTheme.navLabelActiveStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // History Button
        InkWell(
          onTap: onHistoryPressed,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.05),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.12),
                width: 1,
              ),
            ),
            child: const Icon(
              Icons.history_rounded,
              color: AppColors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class _TabData {
  final IconData icon;
  final String label;

  _TabData(this.icon, this.label);
}
