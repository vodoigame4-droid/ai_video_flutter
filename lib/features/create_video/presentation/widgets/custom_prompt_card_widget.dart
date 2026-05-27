import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';

class CustomPromptCardWidget extends StatefulWidget {
  final String promptText;
  final int inspireMeCount;
  final ValueChanged<String> onPromptChanged;
  final VoidCallback onInspireMePressed;
  final VoidCallback onClearPressed;

  const CustomPromptCardWidget({
    super.key,
    required this.promptText,
    required this.inspireMeCount,
    required this.onPromptChanged,
    required this.onInspireMePressed,
    required this.onClearPressed,
  });

  @override
  State<CustomPromptCardWidget> createState() => _CustomPromptCardWidgetState();
}

class _CustomPromptCardWidgetState extends State<CustomPromptCardWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.promptText);
  }

  @override
  void didUpdateWidget(covariant CustomPromptCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only update controller if the external prompt value changes (e.g. from Inspire Me or Clear)
    if (widget.promptText != _controller.text) {
      _controller.text = widget.promptText;
      // Move cursor to the end
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Container(
      height: 173,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(
          color: context.appTheme.lightBorderColor,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          // Prompt Input Text Field
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              style: context.textTheme.bodyMedium,
              onChanged: widget.onPromptChanged,
              decoration: InputDecoration(
                hintText: t.create.prompt_placeholder,
                hintStyle: context.textTheme.bodySmall,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            ),
          ),
          
          // Action row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Inspire Me Button
              _buildInspireMeButton(context),
              
              // Count & Trash bin
              Row(
                children: [
                  Text(
                    t.create.character_count(
                      current: _controller.text.length.toString(),
                    ),
                    style: context.textTheme.labelMedium,
                  ),
                  const SizedBox(width: 6),
                  IconButton(
                    onPressed: widget.onClearPressed,
                    icon: const Icon(
                      Icons.delete_outline_rounded,
                      color: AppColors.white,
                      size: 20,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    style: const ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInspireMeButton(BuildContext context) {
    final t = context.t;
    final hasUsesLeft = widget.inspireMeCount > 0;

    return InkWell(
      onTap: hasUsesLeft ? widget.onInspireMePressed : null,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.black.withValues(alpha: 0.2),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          border: Border.all(
            color: hasUsesLeft ? context.colorScheme.secondary : context.appTheme.borderColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.auto_awesome_rounded,
              color: hasUsesLeft ? context.colorScheme.secondary : AppColors.white.withValues(alpha: 0.4),
              size: 14,
            ),
            const SizedBox(width: 8),
            Text(
              t.create.inspire_me_count(count: widget.inspireMeCount),
              style: hasUsesLeft ? context.appTheme.navLabelActiveStyle : context.appTheme.navLabelInactiveStyle,
            ),
          ],
        ),
      ),
    );
  }
}
