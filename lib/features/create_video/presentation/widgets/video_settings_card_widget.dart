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
        children: [
          // Quality row
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.hd_rounded,
                      color: AppColors.white,
                      size: 24,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.create.quality,
                          style: context.textTheme.titleSmall,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          t.create.quality_desc,
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    _buildToggleOption(
                      context,
                      label: t.create.hd,
                      isSelected: selectedQuality == 'HD',
                      onTap: () => onQualityChanged('HD'),
                    ),
                    const SizedBox(width: 8),
                    _buildToggleOption(
                      context,
                      label: t.create.full_hd,
                      isSelected: selectedQuality == 'Full HD',
                      onTap: () => onQualityChanged('Full HD'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const Divider(height: 1),
          
          // Duration row
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_filled_rounded,
                      color: AppColors.white,
                      size: 24,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.create.duration,
                          style: context.textTheme.titleSmall,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          t.create.duration_desc,
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    _buildToggleOption(
                      context,
                      label: t.create.sec_5s,
                      isSelected: selectedDuration == '5s',
                      onTap: () => onDurationChanged('5s'),
                    ),
                    const SizedBox(width: 8),
                    _buildToggleOption(
                      context,
                      label: t.create.sec_10s,
                      isSelected: selectedDuration == '10s',
                      onTap: () => onDurationChanged('10s'),
                    ),
                    const SizedBox(width: 8),
                    _buildToggleOption(
                      context,
                      label: t.create.sec_15s,
                      isSelected: selectedDuration == '15s',
                      onTap: () => onDurationChanged('15s'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleOption(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
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
