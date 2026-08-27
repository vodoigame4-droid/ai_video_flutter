import 'dart:io';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/app_colors.dart';
import 'app_image.dart';
import 'animated_thumbnail.dart';

class VideoCard extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final String? thumbnailUrl;
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
    this.thumbnailUrl,
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
  Widget build(BuildContext context) {
    final int hash = title.hashCode;

    final double? pixelRatio = MediaQuery.maybeOf(context)?.devicePixelRatio;
    final int cacheWidth = (width != null && pixelRatio != null)
        ? (width! * pixelRatio).round()
        : 350;

    final bool isEven = hash % 2 == 0;
    final String defaultImageAsset = isEven
        ? 'assets/images/card_1.png'
        : 'assets/images/card_2.png';

    final bool isTest = Platform.environment.containsKey('FLUTTER_TEST');
    final bool isNetworkImage =
        imageUrl != null &&
        imageUrl!.startsWith('http') &&
        !isTest;

    final String resolvedImageUrl =
        (isTest &&
            imageUrl != null &&
            imageUrl!.startsWith('http'))
        ? defaultImageAsset
        : (imageUrl ?? defaultImageAsset);

    final bool resolvedIsHot = badgeType != null
        ? badgeType == 'hot'
        : hash % 3 == 0;

    final bool hasBadge = badgeType != null
        ? badgeType!.isNotEmpty
        : true;

    final String resolvedBadgeText = resolvedIsHot ? 'Hot' : 'New';

    final String resolvedViews =
        viewsCount ?? '${((hash % 90) + 10) / 10}k';

    final double cardRadius = isNetworkImage ? 10.0 : 16.0;

    final BorderRadius badgeBorderRadius = isNetworkImage
        ? const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
        : const BorderRadius.all(Radius.circular(8));

    final LinearGradient badgeGradient;
    if (isNetworkImage) {
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

    final String cardKey = key?.toString() ?? 'videocard_${title}_$imageUrl';

    final Widget cardWidget = Container(
      width: width,
      height: height,
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
            // Layer 1 & 2: Animated Thumbnail (Static frame 0 PNG when < 90%, animated WebP when >= 90%)
            if (isNetworkImage)
              Positioned.fill(
                child: AnimatedThumbnail(
                  visibilityKey: cardKey,
                  imageUrl: resolvedImageUrl,
                  memCacheWidth: cacheWidth,
                  visibleThreshold: 0.9,
                  fit: BoxFit.cover,
                  placeholderBuilder: (context) => AppImageShimmer(
                    width: width,
                    height: height,
                    borderRadius: cardRadius,
                  ),
                  errorBuilder: (context, error) => Container(
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
            if (showPlayButton)
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
                      title,
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
                        if (showVolumeIcon)
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
                  onTap: onTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    final Widget content = heroTag != null
        ? Hero(
            tag: heroTag!,
            child: Material(color: Colors.transparent, child: cardWidget),
          )
        : cardWidget;

    return RepaintBoundary(child: content);
  }
}
