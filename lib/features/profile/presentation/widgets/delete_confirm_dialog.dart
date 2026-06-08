import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_confirm_dialog.dart';
import '../../../../i18n/strings.g.dart';

class DeleteConfirmDialog extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onDelete;

  const DeleteConfirmDialog({
    super.key,
    required this.onCancel,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Dialog(
      backgroundColor: AppColors.onSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide(color: AppColors.secondary, width: 1.2),
      ),
      child: AppConfirmDialog(
        title: t.profile.deleteTitle,
        description: t.profile.deleteDesc,
        cancelLabel: t.profile.cancel,
        confirmLabel: t.profile.delete,
        onCancel: onCancel,
        onConfirm: onDelete,
      ),
    );
  }
}
