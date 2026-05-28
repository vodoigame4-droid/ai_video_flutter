import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../gen/assets.gen.dart';
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

    // Define tabs data: icon asset path and label translation keys
    final tabs = [
      _TabData(
        Assets.icons.icImageToVideo,
        t.home_new.imageToVideo.replaceAll('\n', ' '),
      ),
      _TabData(
        Assets.icons.icTranslateVideo,
        t.home_new.transitionVideo.replaceAll('\n', ' '),
      ),
      _TabData(
        Assets.icons.icImageToDance,
        t.home_new.imageToDance.replaceAll('\n', ' '),
      ),
      _TabData(
        Assets.icons.icUnifiledVideo,
        t.home_new.unifiedVideo.replaceAll('\n', ' '),
      ),
    ];

    return Row(
      children: [
        // Tab selectors
        Expanded(
          child: Container(
            height: 62,
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              border: Border.all(color: AppColors.border2, width: 1),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: List.generate(tabs.length, (index) {
                final isSelected = selectedIndex == index;
                final tab = tabs[index];

                return Expanded(
                  flex: isSelected ? 25 : 10,
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
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                            )
                          : null,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            tab.iconAsset,
                            colorFilter: ColorFilter.mode(
                              isSelected
                                  ? AppColors.white
                                  : AppColors.white.withValues(alpha: 0.6),
                              BlendMode.srcIn,
                            ),
                            width: 18,
                            height: 18,
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
        const SizedBox(width: 12),
        // History Button
        InkWell(
          onTap: onHistoryPressed,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.08),
                width: 1,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                Assets.icons.icQuestion,
                colorFilter: ColorFilter.mode(
                  AppColors.white.withValues(alpha: 0.6),
                  BlendMode.srcIn,
                ),
                width: 16,
                height: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TabData {
  final String iconAsset;
  final String label;

  _TabData(this.iconAsset, this.label);
}
