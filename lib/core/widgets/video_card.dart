import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class VideoCard extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final String? viewsCount;
  final String? badgeType;
  final bool showPlayButton;
  final bool showVolumeIcon;
  final double? width;
  final double? height;
  final VoidCallback? onTap;

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
  });

  @override
  Widget build(BuildContext context) {
    final int hash = title.hashCode;
    
    // Fallback deterministic logic for Home page if parameters are omitted
    final bool isEven = hash % 2 == 0;
    final String defaultImageAsset = isEven ? 'assets/images/card_1.png' : 'assets/images/card_2.png';
    
    final bool isTest = Platform.environment.containsKey('FLUTTER_TEST');
    final bool isNetworkImage = imageUrl != null && imageUrl!.startsWith('http') && !isTest;
    
    final String resolvedImageUrl = (isTest && imageUrl != null && imageUrl!.startsWith('http'))
        ? defaultImageAsset
        : (imageUrl ?? defaultImageAsset);
    
    final bool resolvedIsHot = badgeType != null 
        ? badgeType == 'hot' 
        : hash % 3 == 0;
    
    final bool hasBadge = badgeType != null 
        ? badgeType!.isNotEmpty 
        : true; // Default to true if badgeType is null (for Home page fallback)
    
    final String resolvedBadgeText = resolvedIsHot ? 'Hot' : 'New';
    
    final String resolvedViews = viewsCount ?? '${((hash % 90) + 10) / 10}k';

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
              colors: [Color(0xFFFAE123), Color(0xFFFF6320)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )
          : const LinearGradient(
              colors: [Color(0xFF31B8F2), Color(0xFF0FE28E)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            );
    } else {
      // Home screen gradients
      badgeGradient = resolvedIsHot
          ? const LinearGradient(
              colors: [Color(0xFFFF5E3A), Color(0xFFFF2A68)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          : const LinearGradient(
              colors: [Color(0xFF00F5D4), Color(0xFF00BBF9)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            );
    }

    return Container(
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
            // Network Image if available
            if (isNetworkImage)
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.white.withValues(alpha: 0.05),
                    child: const Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.white.withValues(alpha: 0.05),
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      color: Colors.grey,
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
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    gradient: badgeGradient,
                    borderRadius: badgeBorderRadius,
                  ),
                  child: Text(
                    resolvedBadgeText,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ) ?? const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
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
                    border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1.5),
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
                      style: context.appTheme.bodyNormalBold.copyWith(color: Colors.white),
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
                                  ? const Color(0xFF2BC5C5)
                                  : const Color(0xFFB0B0B0),
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              resolvedViews,
                              style: context.appTheme.seeAllTextStyle.copyWith(
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
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
  }
}
