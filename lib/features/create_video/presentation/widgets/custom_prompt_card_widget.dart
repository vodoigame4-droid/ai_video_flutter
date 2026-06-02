import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../i18n/strings.g.dart';
import 'premium_suggestion_bottom_sheet.dart';

class CustomPromptCardWidget extends StatefulWidget {
  final String promptText;
  final int inspireMeCount;
  final ValueChanged<String> onPromptChanged;
  final VoidCallback onInspireMePressed;
  final VoidCallback onClearPressed;
  final bool isInspiring;
  final bool hasImage;

  const CustomPromptCardWidget({
    super.key,
    required this.promptText,
    required this.inspireMeCount,
    required this.onPromptChanged,
    required this.onInspireMePressed,
    required this.onClearPressed,
    this.isInspiring = false,
    this.hasImage = true,
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
        border: Border.all(color: AppColors.subText, width: 1),
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
                contentPadding: const EdgeInsets.symmetric(vertical: 4),
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
                    icon: AppSvgIcon(
                      assetName: Assets.icons.icTrash,
                      color: AppColors.subText,
                      width: 20,
                      height: 20,
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
    final isPremiumState = widget.inspireMeCount <= 0;
    
    // Nút có thể bấm được khi có ảnh và không ở trạng thái đang gợi ý
    final canTap = !widget.isInspiring && widget.hasImage;

    // Định nghĩa Gold Gradient dùng riêng cho style PRO
    const goldGradient = LinearGradient(
      colors: [
        Color(0xFFFFD700), // Gold
        Color(0xFFFFA500), // Orange
      ],
    );

    return Container(
      decoration: BoxDecoration(
        color: AppColors.black.withValues(alpha: 0.2),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        border: canTap
            ? GradientBoxBorder(
                gradient: isPremiumState ? goldGradient : context.appTheme.primaryGradient,
                width: 1,
              )
            : Border.all(color: context.appTheme.borderColor, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: canTap
              ? (isPremiumState
                  ? () => PremiumSuggestionBottomSheet.show(context)
                  : widget.onInspireMePressed)
              : null,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.isInspiring)
                  const SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.white,
                      ),
                    ),
                  )
                else if (isPremiumState)
                  ShaderMask(
                    shaderCallback: (bounds) => goldGradient.createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: const Icon(
                      Icons.workspace_premium_rounded,
                      color: Colors.white,
                      size: 14,
                    ),
                  )
                else
                  AppSvgIcon(
                    assetName: Assets.icons.icInspireMe,
                    gradient: canTap
                        ? context.appTheme.primaryGradient
                        : null,
                    color: canTap
                        ? null
                        : AppColors.white.withValues(alpha: 0.4),
                    width: 14,
                    height: 14,
                  ),
                const SizedBox(width: 8),
                Text(
                  widget.isInspiring
                      ? t.create.inspiring
                      : (isPremiumState
                          ? t.create.inspire_me_pro
                          : t.create.inspire_me_count(count: widget.inspireMeCount)),
                  style: canTap
                      ? (isPremiumState
                          ? context.appTheme.navLabelActiveStyle.copyWith(
                              color: const Color(0xFFFFD700),
                              fontWeight: FontWeight.bold,
                            )
                          : context.appTheme.navLabelActiveStyle)
                      : context.appTheme.navLabelInactiveStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
