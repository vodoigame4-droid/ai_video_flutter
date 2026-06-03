import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../../i18n/strings.g.dart';
import '../utils/app_toast.dart';

void showReportDialog(BuildContext context) {
  final t = context.t;
  showDialog(
    context: context,
    barrierColor: AppColors.black.withValues(alpha: 0.5),
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Dialog(
          backgroundColor: AppColors.onSurface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(color: AppColors.secondary, width: 1.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  t.report_dialog.title,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  t.report_dialog.desc,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.subText,
                    fontSize: 15,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        child: Container(
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.white.withValues(alpha: 0.1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: Text(
                            t.report_dialog.cancel,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          AppToast.showSuccess(t.report_dialog.success);
                        },
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        child: Ink(
                          height: 48,
                          decoration: const BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              t.report_dialog.submit,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
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
        ),
      );
    },
  );
}
