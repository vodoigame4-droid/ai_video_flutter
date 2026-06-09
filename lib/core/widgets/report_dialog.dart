import 'package:flutter/material.dart';
import '../../i18n/strings.g.dart';
import '../utils/app_toast.dart';
import 'app_confirm_dialog.dart';

void showReportDialog(BuildContext context) {
  final t = context.t;
  AppConfirmDialog.show(
    context: context,
    title: t.report_dialog.title,
    description: t.report_dialog.desc,
    cancelLabel: t.report_dialog.cancel,
    confirmLabel: t.report_dialog.submit,
    onConfirm: () {
      AppToast.showSuccess(t.report_dialog.success);
    },
  );
}
