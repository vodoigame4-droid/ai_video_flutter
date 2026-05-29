import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// A premium, reusable image loader widget for the entire app.
/// Uses CachedNetworkImage to handle caching, shows a shimmer effect while loading,
/// and handles fallback UI when errors occur.
class AppImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final Widget? errorWidget;

  const AppImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 0.0,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    final bool isNetworkImage = imageUrl.startsWith('http');

    Widget imageWidget;
    if (isNetworkImage) {
      imageWidget = CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => AppImageShimmer(
          width: width,
          height: height,
          borderRadius: borderRadius,
        ),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Container(
              width: width,
              height: height,
              color: const Color(0xFF222222),
              child: const Icon(
                Icons.image_not_supported_outlined,
                color: Colors.grey,
                size: 24,
              ),
            ),
      );
    } else {
      imageWidget = Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ??
            Container(
              width: width,
              height: height,
              color: const Color(0xFF222222),
              child: const Icon(
                Icons.image_not_supported_outlined,
                color: Colors.grey,
                size: 24,
              ),
            ),
      );
    }

    if (borderRadius > 0.0) {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}

/// A self-contained Shimmer Loading effect widget using standard Flutter animation and gradients.
class AppImageShimmer extends StatefulWidget {
  final double? width;
  final double? height;
  final double borderRadius;

  const AppImageShimmer({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 0.0,
  });

  @override
  State<AppImageShimmer> createState() => _AppImageShimmerState();
}

class _AppImageShimmerState extends State<AppImageShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
            gradient: LinearGradient(
              colors: const [
                Color(0xFF1E1E1E),
                Color(0xFF2E2E2E),
                Color(0xFF1E1E1E),
              ],
              stops: const [0.1, 0.5, 0.9],
              begin: const Alignment(-1.0, -0.3),
              end: const Alignment(1.0, 0.3),
              transform: _SlidingGradientTransform(slidePercent: _controller.value),
            ),
          ),
        );
      },
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  final double slidePercent;

  const _SlidingGradientTransform({required this.slidePercent});

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * (slidePercent - 0.5) * 2, 0.0, 0.0);
  }
}
