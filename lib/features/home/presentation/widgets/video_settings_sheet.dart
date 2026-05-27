import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../i18n/strings.g.dart';

class VideoSettingsSheet extends StatefulWidget {
  const VideoSettingsSheet({super.key});

  @override
  State<VideoSettingsSheet> createState() => _VideoSettingsSheetState();
}

class _VideoSettingsSheetState extends State<VideoSettingsSheet> {
  String _selectedQuality = 'HD';
  String _selectedDuration = '10s';

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: const BoxDecoration(
                color: AppColors.subText,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          
          // Header
          Text(
            t.create.video_settings,
            style: AppTextStyles.sectionTitle,
          ),
          const SizedBox(height: 24),

          // Quality settings row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.create.quality,
                    style: AppTextStyles.settingsHeader,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    t.create.quality_desc,
                    style: AppTextStyles.bodySubText,
                  ),
                ],
              ),
              Row(
                children: [
                  _buildToggleOption(t.create.hd, _selectedQuality == 'HD', () {
                    setState(() => _selectedQuality = 'HD');
                  }),
                  const SizedBox(width: 8),
                  _buildToggleOption(t.create.full_hd, _selectedQuality == 'Full HD', () {
                    setState(() => _selectedQuality = 'Full HD');
                  }),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),

          // Duration settings row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.create.duration,
                    style: AppTextStyles.settingsHeader,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    t.create.duration_desc,
                    style: AppTextStyles.bodySubText,
                  ),
                ],
              ),
              Row(
                children: [
                  _buildToggleOption(t.create.sec_5s, _selectedDuration == '5s', () {
                    setState(() => _selectedDuration = '5s');
                  }),
                  const SizedBox(width: 8),
                  _buildToggleOption(t.create.sec_10s, _selectedDuration == '10s', () {
                    setState(() => _selectedDuration = '10s');
                  }),
                  const SizedBox(width: 8),
                  _buildToggleOption(t.create.sec_15s, _selectedDuration == '15s', () {
                    setState(() => _selectedDuration = '15s');
                  }),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Generate button
          InkWell(
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${t.common.generate}...'),
                  backgroundColor: AppColors.primary,
                ),
              );
            },
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Ink(
              height: 56,
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: AppColors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      t.common.generate,
                      style: AppTextStyles.buttonTextEnabled,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleOption(String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : AppColors.surface,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: isSelected ? AppTextStyles.qualityLabelActive : AppTextStyles.qualityLabelInactive,
        ),
      ),
    );
  }
}
