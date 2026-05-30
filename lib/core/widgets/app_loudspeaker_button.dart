import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppLoudspeakerButton extends StatelessWidget {
  final bool isMuted;
  final VoidCallback onTap;
  final double size;
  final double iconSize;

  const AppLoudspeakerButton({
    super.key,
    required this.isMuted,
    required this.onTap,
    this.size = 42.0,
    this.iconSize = 22.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Material(
          color: AppColors.black.withValues(alpha: 0.1),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.all(Radius.circular(size)),
            child: SizedBox(
              width: size,
              height: size,
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Icon(
                    isMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
                    key: ValueKey<bool>(isMuted),
                    color: AppColors.white,
                    size: iconSize,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
