import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../../i18n/strings.g.dart';
import 'gradient_button.dart';

enum ReportOption { offensive, quality, copyright, bug, other }

class ReportTriggerWidget extends StatelessWidget {
  final Widget child;

  const ReportTriggerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const ReportBottomSheet(),
        );
      },
      child: child,
    );
  }
}

class ReportBottomSheet extends StatefulWidget {
  const ReportBottomSheet({super.key});

  @override
  State<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  ReportOption? _selectedOption;
  late final TextEditingController _otherController;
  late final ScrollController _scrollController;
  bool _isOtherEmpty = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _otherController = TextEditingController();
    _otherController.addListener(_onOtherTextChanged);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _otherController.removeListener(_onOtherTextChanged);
    _otherController.dispose();
    super.dispose();
  }

  void _onOtherTextChanged() {
    setState(() {
      _isOtherEmpty = _otherController.text.trim().isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final isSubmitEnabled =
        _selectedOption != null &&
        (_selectedOption != ReportOption.other || !_isOtherEmpty);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.onSurface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24.0,
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3F3F3F),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Title & Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    t.report_dialog.bottom_sheet_title,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: AppColors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Report Options
              _buildOptionTile(
                context,
                ReportOption.offensive,
                t.report_dialog.option_offensive,
              ),
              _buildOptionTile(
                context,
                ReportOption.quality,
                t.report_dialog.option_quality,
              ),
              _buildOptionTile(
                context,
                ReportOption.copyright,
                t.report_dialog.option_copyright,
              ),
              _buildOptionTile(
                context,
                ReportOption.bug,
                t.report_dialog.option_bug,
              ),
              _buildOptionTile(
                context,
                ReportOption.other,
                t.report_dialog.option_other,
              ),

              // Conditional textbox for other issues
              if (_selectedOption == ReportOption.other) ...[
                const SizedBox(height: 4),
                TextField(
                  controller: _otherController,
                  maxLines: 3,
                  maxLength: 200,
                  style: const TextStyle(color: AppColors.white, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: t.report_dialog.hint_other,
                    hintStyle: const TextStyle(
                      color: AppColors.subText,
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: AppColors.surface,
                    counterStyle: const TextStyle(
                      color: AppColors.subText,
                      fontSize: 11,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.border,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.border,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 1.2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 12),
              ] else ...[
                const SizedBox(height: 24),
              ],

              // Submit Button
              GradientButton(
                label: t.report_dialog.submit,
                width: double.infinity,
                isEnabled: isSubmitEnabled,
                onPressed: () => _showConfirmDialog(
                  context,
                  _getOptionText(t, _selectedOption!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile(
    BuildContext context,
    ReportOption option,
    String titleText,
  ) {
    final isSelected = _selectedOption == option;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          _selectedOption = option;
          if (option != ReportOption.other) {
            _otherController.clear();
          }
        });
        if (option == ReportOption.other) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                titleText,
                style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.subText,
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.subText,
                  width: 2,
                ),
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 14, color: AppColors.black)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  String _getOptionText(Translations t, ReportOption option) {
    switch (option) {
      case ReportOption.offensive:
        return t.report_dialog.option_offensive;
      case ReportOption.quality:
        return t.report_dialog.option_quality;
      case ReportOption.copyright:
        return t.report_dialog.option_copyright;
      case ReportOption.bug:
        return t.report_dialog.option_bug;
      case ReportOption.other:
        return t.report_dialog.option_other;
    }
  }

  void _showConfirmDialog(BuildContext context, String optionText) {
    final t = context.t;
    showDialog(
      context: context,
      barrierColor: AppColors.black.withValues(alpha: 0.6),
      builder: (dialogContext) {
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
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    t.report_dialog.desc,
                    style: const TextStyle(
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
                          onTap: () => Navigator.pop(dialogContext),
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
                            Navigator.pop(dialogContext); // Close dialog
                            Navigator.pop(context); // Close bottom sheet
                            _showThanksMessage(context);
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

  void _showThanksMessage(BuildContext context) {
    final t = context.t;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(t.report_dialog.thanks_msg),
        duration: const Duration(seconds: 3),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
