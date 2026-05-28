import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../i18n/strings.g.dart';

class CreateVideoButtonWidget extends StatelessWidget {
  final bool isEnabled;
  final bool isLoading;
  final bool isSecondary;
  final VoidCallback onPressed;
  final String? label;
  final String? iconAsset;

  const CreateVideoButtonWidget({
    super.key,
    this.isEnabled = true,
    this.isLoading = false,
    this.isSecondary = false,
    required this.onPressed,
    this.label,
    this.iconAsset,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final resolvedLabel = label ?? t.common.generate;
    final resolvedIconAsset = iconAsset ?? Assets.icons.icGenerate;

    // Define colors & decorations based on state
    BoxDecoration decoration;
    Color contentColor;

    if (isLoading) {
      decoration = BoxDecoration(
        gradient: context.appTheme.primaryGradient,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      );
      contentColor = AppColors.white;
    } else if (!isEnabled) {
      decoration = BoxDecoration(
        color: AppColors.activeTab.withValues(alpha: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      );
      contentColor = AppColors.white.withValues(alpha: 0.4);
    } else if (isSecondary) {
      decoration = BoxDecoration(
        color: AppColors.onSurface,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        border: Border.all(color: context.colorScheme.secondary, width: 1),
      );
      contentColor = AppColors.white;
    } else {
      decoration = BoxDecoration(
        gradient: context.appTheme.primaryGradient,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      );
      contentColor = AppColors.white;
    }

    return InkWell(
      onTap: (isEnabled && !isLoading) ? onPressed : null,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Ink(
        height: 56,
        decoration: decoration,
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSvgIcon(
                      assetName: resolvedIconAsset,
                      color: contentColor,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      resolvedLabel,
                      style: (context.textTheme.labelLarge ?? const TextStyle())
                          .copyWith(
                            color: contentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
