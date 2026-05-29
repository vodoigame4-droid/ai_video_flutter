import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// A reusable premium gradient pill button that supports trailing icons and
/// beautiful ripple animations clipped to its border radius.
class GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final LinearGradient? gradient;
  final Widget? trailingIcon;
  final TextStyle? textStyle;
  final bool isEnabled;

  const GradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = 300.0,
    this.height = 56.0,
    this.gradient,
    this.trailingIcon,
    this.textStyle,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final activeGradient = gradient ?? context.appTheme.primaryGradient;
    final activeTextStyle = textStyle ?? context.appTheme.onboardingButtonStyle;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: isEnabled ? activeGradient : null,
        color: isEnabled ? null : AppColors.activeTab.withValues(alpha: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: (activeGradient.colors.first).withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: InkWell(
          onTap: isEnabled ? onPressed : null,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              // Button label (centered text)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Text(
                    label,
                    style: activeTextStyle.copyWith(
                      color: isEnabled
                          ? AppColors.white
                          : AppColors.white.withValues(alpha: 0.4),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              // Optional trailing icon (placed on the right and centered vertically)
              if (trailingIcon != null)
                Positioned(
                  right: 24,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: trailingIcon!,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
