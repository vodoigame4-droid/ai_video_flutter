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
    return Container(
      width: 158,
      height: 236,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: context.appTheme.borderColor, width: 1),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF1E1E1E),
            Color(0xFF121212),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Play indicator in the center
          Center(
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow_rounded,
                color: context.colorScheme.primary,
                size: 28,
              ),
            ),
          ),
          // Title and Actions at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black87],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: context.textTheme.bodyMedium,
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
                            Icons.favorite_rounded,
                            color: context.appTheme.heartColor,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '12.4k',
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
