import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';

class VideoSettingsCardWidget extends StatelessWidget {
  final String selectedQuality;
  final String selectedDuration;
  final ValueChanged<String> onQualityChanged;
  final ValueChanged<String> onDurationChanged;

  const VideoSettingsCardWidget({
    super.key,
    required this.selectedQuality,
    required this.selectedDuration,
    required this.onQualityChanged,
    required this.onDurationChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Quality row
          SettingsRowWidget(
            icon: Icons.hd_rounded,
            title: t.create.quality,
            description: t.create.quality_desc,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ToggleOptionWidget(
                  label: t.create.hd,
                  isSelected: selectedQuality == 'HD',
                  onTap: () => onQualityChanged('HD'),
                ),
                const SizedBox(width: 8),
                ToggleOptionWidget(
                  label: t.create.full_hd,
                  isSelected: selectedQuality == 'Full HD',
                  onTap: () => onQualityChanged('Full HD'),
                ),
              ],
            ),
          ),
          
          const Divider(height: 1),
          
          // Duration row
          SettingsRowWidget(
            icon: Icons.access_time_filled_rounded,
            title: t.create.duration,
            description: t.create.duration_desc,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ToggleOptionWidget(
                  label: t.create.sec_5s,
                  isSelected: selectedDuration == '5s',
                  onTap: () => onDurationChanged('5s'),
                ),
                const SizedBox(width: 8),
                ToggleOptionWidget(
                  label: t.create.sec_10s,
                  isSelected: selectedDuration == '10s',
                  onTap: () => onDurationChanged('10s'),
                ),
                const SizedBox(width: 8),
                ToggleOptionWidget(
                  label: t.create.sec_15s,
                  isSelected: selectedDuration == '15s',
                  onTap: () => onDurationChanged('15s'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreateVideoButtonWidget extends StatelessWidget {
  final bool isEnabled;
  final bool isLoading;
  final VoidCallback onPressed;
  final String? label;
  final IconData? icon;

  const CreateVideoButtonWidget({
    super.key,
    required this.isEnabled,
    required this.isLoading,
    required this.onPressed,
    this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final buttonIcon = icon ?? Icons.star_rounded;
    final buttonLabel = label ?? t.common.generate;

    return InkWell(
      onTap: isEnabled ? onPressed : null,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Ink(
        height: 56,
        decoration: BoxDecoration(
          gradient: isEnabled ? context.appTheme.primaryGradient : null,
          color: isEnabled ? null : context.colorScheme.onSurface,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
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
                    Icon(
                      buttonIcon,
                      color: isEnabled ? AppColors.white : AppColors.white.withValues(alpha: 0.4),
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      buttonLabel,
                      style: context.textTheme.labelLarge,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class SettingsRowWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Widget trailing;

  const SettingsRowWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.white,
                  size: 24,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: context.textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          trailing,
        ],
      ),
    );
  }
}

class ToggleOptionWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ToggleOptionWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          gradient: isSelected ? context.appTheme.primaryGradient : null,
          color: isSelected ? null : context.colorScheme.surface,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: isSelected
              ? null
              : Border.all(
                  color: context.appTheme.lightBorderColor,
                  width: 1,
                ),
        ),
        child: Center(
          child: Text(
            label,
            style: isSelected
                ? context.appTheme.categoryActiveStyleSelected
                : context.appTheme.qualityLabelInactiveStyle,
          ),
        ),
      ),
    );
  }
}
