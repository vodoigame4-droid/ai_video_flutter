import 'package:flutter/material.dart';

/// A custom [Decoration] that paints a gradient underline tab indicator.
class GradientTabIndicator extends Decoration {
  /// The gradient to use for the underline indicator.
  final Gradient gradient;

  /// The height of the underline indicator.
  final double height;

  /// The stroke cap style for the underline indicator.
  final StrokeCap strokeCap;

  /// Insets to apply to the indicator width and position.
  final EdgeInsetsGeometry insets;

  const GradientTabIndicator({
    required this.gradient,
    this.height = 3.0,
    this.strokeCap = StrokeCap.round,
    this.insets = EdgeInsets.zero,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _GradientUnderlinePainter(this, onChanged);
  }
}

class _GradientUnderlinePainter extends BoxPainter {
  final GradientTabIndicator decoration;

  _GradientUnderlinePainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Rect rect = offset & (configuration.size ?? Size.zero);
    final TextDirection? textDirection = configuration.textDirection;
    final Rect indicator = decoration.insets.resolve(textDirection).deflateRect(rect);

    // Calculate y position for the underline (at the bottom of the indicator area)
    final double y = indicator.bottom - decoration.height / 2;

    final Offset start = Offset(indicator.left, y);
    final Offset end = Offset(indicator.right, y);

    final Paint paint = Paint()
      ..strokeWidth = decoration.height
      ..strokeCap = decoration.strokeCap
      ..style = PaintingStyle.stroke
      ..shader = decoration.gradient.createShader(
        Rect.fromPoints(start, end),
      );

    canvas.drawLine(start, end, paint);
  }
}
