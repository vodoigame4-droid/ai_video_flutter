import 'package:flutter/material.dart';

/// A widget that displays a single digit (0-9) and animates its value changes
/// with a slot-machine-style vertical rolling effect.
class RollingDigit extends StatelessWidget {
  final int digit;
  final TextStyle textStyle;
  final Duration duration;

  const RollingDigit({
    super.key,
    required this.digit,
    required this.textStyle,
    this.duration = const Duration(milliseconds: 450),
  });

  @override
  Widget build(BuildContext context) {
    // Measure the size of a single digit to size our clip box precisely
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: '0', style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout();
    
    final double digitHeight = textPainter.height;
    final double digitWidth = textPainter.width;

    return SizedBox(
      width: digitWidth,
      height: digitHeight,
      child: ShaderMask(
        shaderCallback: (bounds) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.white,
              Colors.white,
              Colors.transparent,
            ],
            stops: [0.0, 0.1, 0.9, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: ClipRect(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(end: digit.toDouble()),
            duration: duration,
            curve: Curves.easeOutBack, // overshoot curve for physical spring bounce
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, -value * digitHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(10, (index) {
                    return SizedBox(
                      width: digitWidth,
                      height: digitHeight,
                      child: Center(
                        child: Text(
                          index.toString(),
                          style: textStyle,
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// A widget that displays a string of characters, animating the digits
/// with a rolling slot-machine transition when the value changes.
class RollingCounter extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Duration duration;

  const RollingCounter({
    super.key,
    required this.text,
    required this.textStyle,
    this.duration = const Duration(milliseconds: 450),
  });

  @override
  Widget build(BuildContext context) {
    // Split the text into individual characters
    final List<String> chars = text.split('');
    
    // Reverse the characters to key them starting from the least significant digit (ones place).
    // This maintains animation state correctly when the number of digits changes (e.g. from 99 to 100).
    final List<String> reversedChars = chars.reversed.toList();
    final List<Widget> digitWidgets = [];

    for (int i = 0; i < reversedChars.length; i++) {
      final String char = reversedChars[i];
      final int? digit = int.tryParse(char);

      if (digit != null) {
        digitWidgets.add(
          RollingDigit(
            key: ValueKey('rolling-digit-$i'),
            digit: digit,
            textStyle: textStyle,
            duration: duration,
          ),
        );
      } else {
        // Render non-digit characters statically (e.g. '.' or commas)
        digitWidgets.add(
          Text(
            char,
            key: ValueKey('rolling-char-$char-$i'),
            style: textStyle,
          ),
        );
      }
    }

    // Restore the correct left-to-right digit order
    final List<Widget> orderedWidgets = digitWidgets.reversed.toList();

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: orderedWidgets,
    );
  }
}
