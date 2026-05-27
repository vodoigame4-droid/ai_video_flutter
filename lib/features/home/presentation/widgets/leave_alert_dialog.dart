import 'package:flutter/material.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../i18n/strings.g.dart';

class LeaveAlertDialog extends StatelessWidget {
  const LeaveAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.leave_dialog.title,
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Text(
              t.leave_dialog.desc,
              style: context.textTheme.bodyMedium,
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
                        color: context.colorScheme.surface,
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        border: Border.all(color: context.appTheme.borderColor, width: 1),
                      ),
                      child: Center(
                        child: Text(
                          t.common.stay,
                          style: context.textTheme.bodyMedium,
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
                      decoration: BoxDecoration(
                        color: context.appTheme.heartColor,
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Center(
                        child: Text(
                          t.common.leave,
                          style: context.appTheme.bodyNormalBold,
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
