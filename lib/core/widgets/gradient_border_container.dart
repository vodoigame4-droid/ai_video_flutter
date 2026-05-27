import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A premium, reusable container widget that draws a gradient border.
/// 
/// Uses a custom foreground painter to draw the gradient border inset, allowing the inside
/// child layout to stay clean and supporting both solid and transparent backgrounds.
/// By default, it uses the border gradient defined in the theme context.
class GradientBorderContainer extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  final double borderWidth;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Clip clipBehavior;
  final Color? backgroundColor;

  const GradientBorderContainer({
    super.key,
    required this.child,
    this.gradient,
    this.borderWidth = 1.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.padding,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveGradient = gradient ?? context.appTheme.borderGradient;

    return CustomPaint(
      foregroundPainter: GradientBorderPainter(
        gradient: effectiveGradient,
        strokeWidth: borderWidth,
        borderRadius: borderRadius,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          clipBehavior: clipBehavior,
          child: Padding(
            padding: padding ?? EdgeInsets.all(borderWidth),
            child: child,
          ),
        ),
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final Gradient gradient;
  final double strokeWidth;
  final BorderRadius borderRadius;

  GradientBorderPainter({
    required this.gradient,
    required this.strokeWidth,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Inset the rect by half of the stroke width to ensure the border is fully inside the container boundary
    final rect = Offset(strokeWidth / 2, strokeWidth / 2) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    final RRect rrect = borderRadius.toRRect(rect);

    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..shader = gradient.createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant GradientBorderPainter oldDelegate) {
    return oldDelegate.gradient != gradient ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.borderRadius != borderRadius;
  }
}
