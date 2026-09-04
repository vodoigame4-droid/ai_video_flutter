import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_business/core_business.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Thumbnail for animated WebPs: renders a static 1st-frame PNG when visibility < 90%,
/// and only plays animated WebP when visibility >= 90%.
class AnimatedThumbnail extends StatefulWidget {
  final Object visibilityKey;
  final String imageUrl;
  final BoxFit fit;
  final double visibleThreshold;
  final int? memCacheWidth;
  final Widget Function(BuildContext context) placeholderBuilder;
  final Widget Function(BuildContext context, Object error) errorBuilder;

  const AnimatedThumbnail({
    super.key,
    required this.visibilityKey,
    required this.imageUrl,
    required this.placeholderBuilder,
    required this.errorBuilder,
    this.fit = BoxFit.cover,
    this.visibleThreshold = 0.9,
    this.memCacheWidth,
  });

  @override
  State<AnimatedThumbnail> createState() => _AnimatedThumbnailState();
}

class _AnimatedThumbnailState extends State<AnimatedThumbnail> {
  static final Map<String, Uint8List> _staticFrameCache = {};
  static final Set<String> _extractingUrls = {};

  bool _isExpanded = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _ensureStaticFrameCached();
  }

  @override
  void didUpdateWidget(covariant AnimatedThumbnail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      _ensureStaticFrameCached();
    }
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    final expanded = info.visibleFraction >= widget.visibleThreshold;
    if (expanded != _isExpanded && mounted) {
      setState(() => _isExpanded = expanded);
    }
  }

  Future<void> _ensureStaticFrameCached() async {
    final url = widget.imageUrl;
    if (_staticFrameCache.containsKey(url) || _extractingUrls.contains(url)) {
      return;
    }
    _extractingUrls.add(url);
    try {
      final Uint8List bytes;
      if (url.startsWith('http')) {
        final file = await DefaultCacheManager().getSingleFile(url);
        bytes = await file.readAsBytes();
      } else {
        final file = File(url);
        if (await file.exists()) {
          bytes = await file.readAsBytes();
        } else {
          return;
        }
      }
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();
      final byteData = await frame.image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      codec.dispose();
      if (byteData != null) {
        _staticFrameCache[url] = byteData.buffer.asUint8List();
        if (mounted) setState(() {});
      }
    } catch (e) {
      LogUtils.w('AnimatedThumbnail: Failed to extract static frame for $url: $e');
      if (mounted) setState(() => _hasError = true);
    } finally {
      _extractingUrls.remove(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget.visibilityKey),
      onVisibilityChanged: _onVisibilityChanged,
      child: _isExpanded ? _buildAnimated() : _buildStatic(),
    );
  }

  Widget _buildAnimated() {
    if (widget.imageUrl.startsWith('http')) {
      return CachedNetworkImage(
        key: ValueKey('cached_anim_${widget.imageUrl}'),
        imageUrl: widget.imageUrl,
        fit: widget.fit,
        fadeInDuration: const Duration(milliseconds: 150),
        memCacheWidth: widget.memCacheWidth,
        errorListener: (error) {
          LogUtils.w(
            'AnimatedThumbnail: Error loading image ${widget.imageUrl}: $error',
          );
        },
        placeholder: (context, url) => _buildStatic(),
        errorWidget: (context, url, error) =>
            widget.errorBuilder(context, error),
      );
    } else {
      final file = File(widget.imageUrl);
      if (file.existsSync()) {
        return Image.file(
          file,
          fit: widget.fit,
          gaplessPlayback: true,
          errorBuilder: (context, error, stackTrace) =>
              widget.errorBuilder(context, error),
        );
      }
      return _buildStatic();
    }
  }

  Widget _buildStatic() {
    if (_hasError) return widget.errorBuilder(context, 'decode_failed');
    final cachedBytes = _staticFrameCache[widget.imageUrl];
    if (cachedBytes == null) return widget.placeholderBuilder(context);
    return Image.memory(cachedBytes, fit: widget.fit, gaplessPlayback: true);
  }
}
