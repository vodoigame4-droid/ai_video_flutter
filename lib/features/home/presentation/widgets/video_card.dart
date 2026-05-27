import 'package:flutter/material.dart';
import '../../../../../core/theme/app_theme.dart';

class VideoCard extends StatelessWidget {
  final String title;

  const VideoCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // Generate deterministic properties based on title hash code
    final int hash = title.hashCode;
    final bool isEven = hash % 2 == 0;
    final String imageAsset = isEven ? 'assets/images/card_1.png' : 'assets/images/card_2.png';
    final bool isHot = hash % 3 == 0;
    final String viewsStr = '${((hash % 90) + 10) / 10}k';

    return Container(
      width: 158,
      height: 236,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: context.appTheme.borderColor, width: 1),
        image: DecorationImage(
          image: AssetImage(imageAsset),
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
      child: Stack(
        children: [
          // Dark overlay to read texts easily
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
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

          // Hot/New Badge Tag
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                gradient: isHot
                    ? const LinearGradient(
                        colors: [Color(0xFFFF5E3A), Color(0xFFFF2A68)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : const LinearGradient(
                        colors: [Color(0xFF00F5D4), Color(0xFF00BBF9)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Text(
                isHot ? 'Hot' : 'New',
                style: context.textTheme.labelSmall,
              ),
            ),
          ),

          // Play indicator in the center
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
                    style: context.appTheme.bodyNormalBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Color(0xFFB0B0B0),
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            viewsStr,
                            style: context.appTheme.seeAllTextStyle,
                          ),
                        ],
                      ),
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
        ],
      ),
    );
  }
}
