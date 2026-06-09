import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'gradient_border_container.dart';
import 'gradient_button.dart';

class AppConfirmDialog extends StatelessWidget {
  final String title;
  final String description;
  final String cancelLabel;
  final String confirmLabel;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final Color? cancelBgColor;
  final Color? cancelTextColor;
  final LinearGradient? confirmGradient;
  final Color? confirmTextColor;

  const AppConfirmDialog({
    super.key,
    required this.title,
    required this.description,
    required this.cancelLabel,
    required this.confirmLabel,
    required this.onCancel,
    required this.onConfirm,
    this.cancelBgColor,
    this.cancelTextColor,
    this.confirmGradient,
    this.confirmTextColor,
  });

  /// Displays the confirmation dialog wrapped in a blur filter and custom style.
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String description,
    required String cancelLabel,
    required String confirmLabel,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    Color? cancelBgColor,
    Color? cancelTextColor,
    LinearGradient? confirmGradient,
    Color? confirmTextColor,
  }) {
    return showDialog<T>(
      context: context,
      barrierColor: AppColors.black.withValues(alpha: 0.5),
      builder: (dialogContext) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: GradientBorderContainer(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderWidth: 2.5,
              backgroundColor: AppColors.onSurface,
              child: AppConfirmDialog(
                title: title,
                description: description,
                cancelLabel: cancelLabel,
                confirmLabel: confirmLabel,
                onCancel: onCancel ?? () => Navigator.pop(dialogContext),
                onConfirm: onConfirm,
                cancelBgColor: cancelBgColor,
                cancelTextColor: cancelTextColor,
                confirmGradient: confirmGradient,
                confirmTextColor: confirmTextColor,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeConfirmGradient =
        confirmGradient ?? context.appTheme.primaryGradient;
    final activeCancelBgColor = cancelBgColor ?? AppColors.activeTab;
    final activeCancelTextColor = cancelTextColor ?? AppColors.white;
    final activeConfirmTextColor = confirmTextColor ?? AppColors.white;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            title,
            style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // Description
          Text(
            description,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.subText,
              fontSize: 15,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          // Buttons Row
          Row(
            children: [
              // Cancel Button
              Expanded(
                child: InkWell(
                  onTap: onCancel,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Container(
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: activeCancelBgColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Text(
                      cancelLabel,
                      style: TextStyle(
                        color: activeCancelTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Confirm Button
              Expanded(
                child: GradientButton(
                  label: confirmLabel,
                  onPressed: onConfirm,
                  height: 48,
                  width: double.infinity,
                  gradient: activeConfirmGradient,
                  horizontalPadding: 8.0,
                  textStyle: TextStyle(
                    color: activeConfirmTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
