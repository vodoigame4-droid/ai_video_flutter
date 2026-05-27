import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../i18n/strings.g.dart';

class LeaveAlertDialog extends StatelessWidget {
  const LeaveAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Dialog(
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide(color: AppColors.border, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.leave_dialog.title,
              style: AppTextStyles.dialogTitle,
            ),
            const SizedBox(height: 12),
            Text(
              t.leave_dialog.desc,
              style: AppTextStyles.dialogBody,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.pop(context, false),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Center(
                        child: Text(
                          t.common.stay,
                          style: AppTextStyles.bodyNormal,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.pop(context, true),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const BoxDecoration(
                        color: AppColors.heart,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Center(
                        child: Text(
                          t.common.leave,
                          style: AppTextStyles.bodyNormal.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
