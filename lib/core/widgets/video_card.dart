import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../theme/app_theme.dart';
import '../theme/app_colors.dart';
import 'app_image.dart';

class VideoCard extends StatefulWidget {
  final String title;
  final String? imageUrl;
  final String? viewsCount;
  final String? badgeType;
  final bool showPlayButton;
  final bool showVolumeIcon;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final String? heroTag;

  const VideoCard({
    super.key,
    required this.title,
    this.imageUrl,
    this.viewsCount,
    this.badgeType,
    this.showPlayButton = true,
    this.showVolumeIcon = true,
    this.width,
    this.height,
    this.onTap,
    this.heroTag,
  });

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  bool _isPlayable = false;

  @override
  Widget build(BuildContext context) {
    final int hash = widget.title.hashCode;

    final double? pixelRatio = MediaQuery.maybeOf(context)?.devicePixelRatio;
    final int? cacheWidth = (widget.width != null && pixelRatio != null)
        ? (widget.width! * pixelRatio).round()
        : null;
    final int? cacheHeight = (widget.height != null && pixelRatio != null)
        ? (widget.height! * pixelRatio).round()
        : null;

    // Fallback deterministic logic for Home page if parameters are omitted
    final bool isEven = hash % 2 == 0;
    final String defaultImageAsset = isEven
        ? 'assets/images/card_1.png'
        : 'assets/images/card_2.png';

    final bool isTest = Platform.environment.containsKey('FLUTTER_TEST');
    final bool isNetworkImage =
        widget.imageUrl != null &&
        widget.imageUrl!.startsWith('http') &&
        !isTest;

    final String resolvedImageUrl =
        (isTest &&
            widget.imageUrl != null &&
            widget.imageUrl!.startsWith('http'))
        ? defaultImageAsset
        : (widget.imageUrl ?? defaultImageAsset);

    final bool resolvedIsHot = widget.badgeType != null
        ? widget.badgeType == 'hot'
        : hash % 3 == 0;

    final bool hasBadge = widget.badgeType != null
        ? widget.badgeType!.isNotEmpty
        : true; // Default to true if badgeType is null (for Home page fallback)

    final String resolvedBadgeText = resolvedIsHot ? 'Hot' : 'New';

    final String resolvedViews =
        widget.viewsCount ?? '${((hash % 90) + 10) / 10}k';

    // Styling configuration based on style type (Home vs Templates)
    final double cardRadius = isNetworkImage ? 10.0 : 16.0;

    final BorderRadius badgeBorderRadius = isNetworkImage
        ? const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
        : const BorderRadius.all(Radius.circular(8));

    // Gradients for badges
    final LinearGradient badgeGradient;
    if (isNetworkImage) {
      // Figma Category List screen gradients
      badgeGradient = resolvedIsHot
          ? const LinearGradient(
              colors: [AppColors.badgeYellow, AppColors.badgeOrange],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              )
          : const LinearGradient(
              colors: [AppColors.badgeBlue, AppColors.badgeGreen],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            );
    } else {
      // Home screen gradients
      badgeGradient = resolvedIsHot
          ? const LinearGradient(
              colors: [AppColors.badgePeach, AppColors.badgePink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          : const LinearGradient(
              colors: [AppColors.badgeTeal, AppColors.badgeCyan],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            );
    }

    final Widget cardWidget = Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.all(Radius.circular(cardRadius)),
        border: Border.all(color: context.appTheme.borderColor, width: 1),
        image: isNetworkImage
            ? null
            : DecorationImage(
                image: AssetImage(resolvedImageUrl),
                fit: BoxFit.cover,
              ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(cardRadius)),
        child: Stack(
          children: [
            // Network Image if available
            if (isNetworkImage)
              Positioned.fill(
                child: _AnimatedImagePlayer(
                  imageProvider: CachedNetworkImageProvider(
                    widget.imageUrl!,
                    maxWidth: cacheWidth,
                    maxHeight: cacheHeight,
                  ),
                  isPlayable: _isPlayable,
                  fit: BoxFit.cover,
                  placeholder: AppImageShimmer(
                    width: widget.width,
                    height: widget.height,
                    borderRadius: cardRadius,
                  ),
                  errorWidget: Container(
                    color: Colors.white.withValues(alpha: 0.05),
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),

            // Dark gradient overlay to read texts easily
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.1),
                      Colors.black.withValues(alpha: 0.8),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            // Badge Tag (Top right)
            if (hasBadge)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    gradient: badgeGradient,
                    borderRadius: badgeBorderRadius,
                  ),
                  child: Text(
                    resolvedBadgeText,
                    style:
                        context.textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ) ??
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),

            // Play indicator in the center
            if (widget.showPlayButton)
              Center(
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2),
                      width: 1.5,
                    ),
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),

            // Title and Views count at the bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: context.appTheme.bodyNormalBold.copyWith(
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              isNetworkImage
                                  ? Icons.auto_awesome
                                  : Icons.remove_red_eye_outlined,
                              color: isNetworkImage
                                  ? AppColors.secondary
                                  : AppColors.greyText,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              resolvedViews,
                              style: context.appTheme.viewsCountTextStyle,
                            ),
                          ],
                        ),
                        if (widget.showVolumeIcon)
                          const Icon(
                            Icons.volume_up_rounded,
                            color: Colors.white,
                            size: 14,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Interactive Inkwell Overlay
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  onTap: widget.onTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    final Widget content = widget.heroTag != null
        ? Hero(
            tag: widget.heroTag!,
            child: Material(
              color: Colors.transparent,
              child: cardWidget,
            ),
          )
        : cardWidget;

    return VisibilityDetector(
      key: ValueKey('videocard_${widget.title}_${widget.imageUrl}'),
      onVisibilityChanged: (visibilityInfo) {
        final double visiblePercentage = visibilityInfo.visibleFraction * 100;
        final bool shouldPlay = visiblePercentage >= 20;
        if (_isPlayable != shouldPlay) {
          if (mounted) {
            setState(() {
              _isPlayable = shouldPlay;
            });
          }
        }
      },
      child: RepaintBoundary(
        child: content,
      ),
    );
  }
}

class _AnimatedImagePlayer extends StatefulWidget {
  final ImageProvider imageProvider;
  final bool isPlayable;
  final BoxFit fit;
  final Widget placeholder;
  final Widget? errorWidget;

  const _AnimatedImagePlayer({
    required this.imageProvider,
    required this.isPlayable,
    required this.placeholder,
    this.fit = BoxFit.cover,
    this.errorWidget,
  });

  @override
  State<_AnimatedImagePlayer> createState() => _AnimatedImagePlayerState();
}

class _AnimatedImagePlayerState extends State<_AnimatedImagePlayer> {
  ImageStream? _imageStream;
  ImageInfo? _imageInfo;
  bool _isListening = false;
  late final ImageStreamListener _listener;
  Object? _exception;

  @override
  void initState() {
    super.initState();
    _listener = ImageStreamListener(
      _handleImageFrame,
      onError: _handleImageError,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _resolveImage();
  }

  @override
  void didUpdateWidget(_AnimatedImagePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageProvider != oldWidget.imageProvider) {
      _resolveImage();
    } else if (widget.isPlayable != oldWidget.isPlayable) {
      _updateListener();
    }
  }

  void _resolveImage() {
    _stopListening();
    _imageInfo = null;
    _exception = null;
    final ImageStream newStream = widget.imageProvider.resolve(
      createLocalImageConfiguration(context),
    );
    _imageStream = newStream;
    _updateListener();
  }

  void _updateListener() {
    if (_imageStream == null) return;

    if (widget.isPlayable) {
      if (!_isListening) {
        _imageStream!.addListener(_listener);
        _isListening = true;
      }
    } else {
      if (_imageInfo != null) {
        _stopListening();
      } else {
        if (!_isListening) {
          _imageStream!.addListener(_listener);
          _isListening = true;
        }
      }
    }
  }

  void _handleImageFrame(ImageInfo info, bool synchronousCall) {
    if (mounted) {
      setState(() {
        _imageInfo = info;
        _exception = null;
      });
      if (!widget.isPlayable) {
        _stopListening();
      }
    }
  }

  void _handleImageError(dynamic exception, StackTrace? stackTrace) {
    if (mounted) {
      setState(() {
        _exception = exception;
      });
    }
  }

  void _stopListening() {
    if (_isListening && _imageStream != null) {
      _imageStream!.removeListener(_listener);
      _isListening = false;
    }
  }

  @override
  void dispose() {
    _stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_exception != null) {
      return widget.errorWidget ??
          Container(
            color: Colors.white.withValues(alpha: 0.05),
            child: const Icon(
              Icons.image_not_supported_outlined,
              color: AppColors.grey,
            ),
          );
    }
    if (_imageInfo == null) {
      return widget.placeholder;
    }
    return RawImage(
      image: _imageInfo!.image,
      scale: _imageInfo!.scale,
      fit: widget.fit,
    );
  }
}
