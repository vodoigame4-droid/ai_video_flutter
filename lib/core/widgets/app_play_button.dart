import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppPlayButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onTap;
  final double size;
  final double iconSize;

  const AppPlayButton({
    super.key,
    required this.isPlaying,
    required this.onTap,
    this.size = 80.0,
    this.iconSize = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.black.withValues(alpha: 0.25),
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Icon(
              isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              key: ValueKey<bool>(isPlaying),
              color: AppColors.white,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
