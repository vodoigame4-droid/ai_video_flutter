import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Convenient extension methods on [Widget] to quickly apply common premium animations
/// from the `flutter_animate` library, keeping UI layouts clean and readable.
extension WidgetAnimationX on Widget {
  /// Animates the opacity of this widget from [begin] to [end] (Fade In by default).
  Widget fadeIn({
    Duration duration = const Duration(milliseconds: 300),
    Duration delay = Duration.zero,
    double begin = 0.0,
    double end = 1.0,
    Curve curve = Curves.easeInOut,
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return this;

    return animate().fade(
      begin: begin,
      end: end,
      duration: duration,
      delay: delay,
      curve: curve,
    );
  }

  /// Animates the opacity of this widget from [begin] to [end] (Fade Out by default).
  Widget fadeOut({
    Duration duration = const Duration(milliseconds: 300),
    Duration delay = Duration.zero,
    double begin = 1.0,
    double end = 0.0,
    Curve curve = Curves.easeInOut,
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return this;

    return animate().fade(
      begin: begin,
      end: end,
      duration: duration,
      delay: delay,
      curve: curve,
    );
  }

  /// Slides this widget vertically or horizontally.
  /// By default, slides in from the bottom slightly ([begin] offset (0.0, 0.2)).
  Widget slideIn({
    Offset begin = const Offset(0.0, 0.2),
    Offset end = Offset.zero,
    Duration duration = const Duration(milliseconds: 400),
    Duration delay = Duration.zero,
    Curve curve = Curves.easeOutQuad,
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return this;

    return animate().slide(
      begin: begin,
      end: end,
      duration: duration,
      delay: delay,
      curve: curve,
    );
  }

  /// Scales this widget up (or down). By default, scales in from 80% to 100% scale.
  Widget scaleIn({
    double begin = 0.8,
    double end = 1.0,
    Duration duration = const Duration(milliseconds: 300),
    Duration delay = Duration.zero,
    Curve curve = Curves.easeOutBack,
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return this;

    return animate().scale(
      begin: Offset(begin, begin),
      end: Offset(end, end),
      duration: duration,
      delay: delay,
      curve: curve,
    );
  }

  /// Combines a fade-in and scale-in animation (very common for dialogs, cards, popups).
  Widget fadeAndScale({
    double beginScale = 0.8,
    double endScale = 1.0,
    double beginOpacity = 0.0,
    double endOpacity = 1.0,
    Duration duration = const Duration(milliseconds: 350),
    Duration delay = Duration.zero,
    Curve curve = Curves.easeOutBack,
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return this;

    return animate()
        .fade(
          begin: beginOpacity,
          end: endOpacity,
          duration: duration,
          delay: delay,
          curve: curve,
        )
        .scale(
          begin: Offset(beginScale, beginScale),
          end: Offset(endScale, endScale),
          duration: duration,
          delay: delay,
          curve: curve,
        );
  }

  /// Plays a continuous heartbeat/glowing pulse scale animation (repeats infinitely).
  Widget pulse({
    double scale = 1.05,
    Duration duration = const Duration(milliseconds: 800),
    Curve curve = Curves.easeInOut,
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return this;

    return animate(
      onPlay: (controller) => controller.repeat(reverse: true),
    ).scale(
      begin: const Offset(1.0, 1.0),
      end: Offset(scale, scale),
      duration: duration,
      curve: curve,
    );
  }

  /// Plays a continuous shimmer sweep overlay (repeats infinitely, great for loading skeleton states).
  Widget shimmer({
    Duration duration = const Duration(seconds: 2),
    Color color = const Color(0x80FFFFFF), // Even brighter white overlay for better visibility
    Curve curve = Curves.easeInOut,
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return this;

    return animate(
      onPlay: (controller) => controller.repeat(),
    ).shimmer(duration: duration, color: color, curve: curve);
  }

  /// Shakes this widget horizontally (by default) with a clean rhythmic beat.
  /// Uses [hz] to control vibration speed/cycles, [offset] for displacement direction,
  /// and [loop] to specify if it should repeat infinitely.
  /// [pauseDuration] controls the rest interval between shakes when [loop] is true.
  Widget shake({
    Duration duration = const Duration(milliseconds: 400),
    double hz = 4.0, // Rhythmic frequency (4 cycles per second)
    Offset offset = const Offset(6.0, 0.0), // Default purely horizontal shake
    double rotation = 0.0,
    Curve curve = Curves.easeInOut,
    bool loop = true, // Default to looping continuously
    Duration pauseDuration = const Duration(milliseconds: 1000), // Default 1s pause between loops
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return this;

    final animation = loop
        ? animate(onPlay: (controller) => controller.repeat())
        : animate();

    final shakeAnimation = animation.shake(
      duration: duration,
      hz: hz,
      offset: offset,
      rotation: rotation,
      curve: curve,
    );

    if (loop) {
      return shakeAnimation.then(delay: pauseDuration).scale(
            duration: Duration.zero,
            begin: const Offset(1, 1),
            end: const Offset(1, 1),
          );
    }
    return shakeAnimation;
  }

  /// Rotates this widget continuously or by a specific angle.
  /// Loops indefinitely if [loop] is true.
  Widget rotate({
    double begin = 0.0,
    double end = 1.0,
    Duration duration = const Duration(seconds: 15),
    bool loop = true,
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return this;

    final animation = loop
        ? animate(onPlay: (controller) => controller.repeat())
        : animate();
    return animation.rotate(begin: begin, end: end, duration: duration);
  }

  /// Trôi nổi lên xuống chậm rãi liên tục (loop). Rất hợp với các Badge, Icon trang trí.
  Widget float({
    double distance = 6.0,
    Duration duration = const Duration(seconds: 2),
    Curve curve = Curves.easeInOut,
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return this;

    return animate(
      onPlay: (controller) => controller.repeat(reverse: true),
    ).moveY(
      begin: -distance,
      end: distance,
      duration: duration,
      curve: curve,
    );
  }

  /// Kết hợp Fade và Blur (làm mờ nhòe thành sắc nét). Tạo cảm giác Glassmorphism sang trọng.
  Widget blurFadeIn({
    double beginBlur = 15.0,
    double endBlur = 0.0,
    double beginOpacity = 0.0,
    double endOpacity = 1.0,
    Duration duration = const Duration(milliseconds: 400),
    Duration delay = Duration.zero,
    Curve curve = Curves.easeOutQuad,
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return this;

    return animate()
        .fade(
          begin: beginOpacity,
          end: endOpacity,
          duration: duration,
          delay: delay,
          curve: curve,
        )
        .blur(
          begin: Offset(beginBlur, beginBlur),
          end: Offset(endBlur, endBlur),
          duration: duration,
          delay: delay,
          curve: curve,
        );
  }

  /// Lắc nghiêng nhẹ trái phải liên tục để gây sự chú ý (chất lượng cao cho nút CTA).
  Widget wobble({
    double angle = 0.04,
    Duration duration = const Duration(milliseconds: 1200),
    Curve curve = Curves.easeInOut,
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return this;

    return animate(
      onPlay: (controller) => controller.repeat(reverse: true),
    ).rotate(
      begin: -angle,
      end: angle,
      duration: duration,
      curve: curve,
    );
  }

  /// Hiệu ứng bật nảy (bouncy) đàn hồi khi xuất hiện.
  Widget bounceIn({
    double beginScale = 0.4,
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return this;

    return animate()
        .fade(begin: 0.0, end: 1.0, duration: duration, delay: delay)
        .scale(
          begin: Offset(beginScale, beginScale),
          end: const Offset(1.0, 1.0),
          duration: duration,
          delay: delay,
          curve: Curves.elasticOut,
        );
  }

  /// Kết hợp trượt và mờ dần vào, hỗ trợ hướng tùy biến linh hoạt.
  Widget slideAndFade({
    Offset begin = const Offset(0.0, 0.15),
    Duration duration = const Duration(milliseconds: 350),
    Duration delay = Duration.zero,
    Curve curve = Curves.easeOutQuad,
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return this;

    return animate()
        .fade(
          begin: 0.0,
          end: 1.0,
          duration: duration,
          delay: delay,
          curve: curve,
        )
        .slide(
          begin: begin,
          end: Offset.zero,
          duration: duration,
          delay: delay,
          curve: curve,
        );
  }
}

