import 'package:ai_video_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import 'package:core_business/core_business.dart';

class MyVideoItemWidget extends StatelessWidget {
  final UserVideoEntity video;
  final VoidCallback onDeleteTap;
  final VoidCallback onPlayTap;

  const MyVideoItemWidget({
    super.key,
    required this.video,
    required this.onDeleteTap,
    required this.onPlayTap,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final isGenerating = video.status == 'generating';

    return GestureDetector(
      onTap: isGenerating ? null : onPlayTap,
      child: Container(
        width: 173,
        height: 248,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.network(
                video.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/images/home_banner.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
  
            // Generating State overlay
            if (isGenerating) ...[
              Positioned.fill(
                child: Container(color: Colors.black.withValues(alpha: 0.65)),
              ),
  
              // Badge Generating... on top center
              Positioned(
                top: 10,
                left: 10,
                right: 10,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.3),
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Color(0xFF24C780),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          t.profile.generating,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
  
              // Rotating spinner in center
              Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF24C780),
                    ),
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    strokeWidth: 3,
                  ),
                ),
              ),
            ],
  
            // Play button for Done state
            if (!isGenerating)
              Center(
                child: Material(
                  color: Colors.black.withValues(alpha: 0.25),
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: onPlayTap,
                    child: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
  
            // Delete button for Done state on top right
            if (!isGenerating)
              Positioned(
                top: 10,
                right: 10,
                child: Material(
                  color: Colors.black.withValues(alpha: 0.4),
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: onDeleteTap,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Center(
                        child: SvgPicture.asset(
                          Assets.icons.icTrash,
                          width: 16,
                          height: 16,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
  
            // Bottom text & progress details
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.9),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      t.profile.imageGeneration,
                      style:
                          context.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ) ??
                          const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    if (isGenerating) ...[
                      // Custom Animating Progress Slider matching Figma
                      Container(
                        width: double.infinity,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FractionallySizedBox(
                            widthFactor: video.progress,
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFF24C780), Color(0xFF2BC5C5)],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ] else ...[
                      // Timestamp text
                      Text(
                        video.createdAt,
                        style:
                            context.textTheme.bodySmall?.copyWith(
                              color: const Color(0xFFB1B1B1),
                              fontSize: 11,
                            ) ??
                            const TextStyle(
                              color: Color(0xFFB1B1B1),
                              fontSize: 11,
                            ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
