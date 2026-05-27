import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
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

    return Center(
      child: Container(
        width: 330,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        decoration: BoxDecoration(
          color: const Color(0xFF171717),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: const Color(0xFF2BC5C5),
            width: 1,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Text(
                t.profile.deleteTitle,
                style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ) ??
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              
              // Description
              Text(
                t.profile.deleteDesc,
                style: context.textTheme.bodySmall?.copyWith(
                      color: const Color(0xFFB1B1B1),
                      fontSize: 14,
                    ) ??
                    const TextStyle(
                      color: Color(0xFFB1B1B1),
                      fontSize: 14,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              
              // Action Buttons Row
              Row(
                children: [
                  // Cancel Button
                  Expanded(
                    child: InkWell(
                      onTap: onCancel,
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      child: Ink(
                        height: 48,
                        decoration: const BoxDecoration(
                          color: Color(0xFF979797),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Center(
                          child: Text(
                            t.profile.cancel,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  
                  // Delete Button
                  Expanded(
                    child: InkWell(
                      onTap: onDelete,
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      child: Ink(
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: context.appTheme.primaryGradient,
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Center(
                          child: Text(
                            t.profile.delete,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
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
  }
}
