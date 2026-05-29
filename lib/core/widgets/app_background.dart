import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';

/// A reusable widget to wrap screens or Scaffold bodies that need a custom background image.
/// By default, it uses the app's global background image (`Assets.images.bgApp`).
class AppBackground extends StatelessWidget {
  final Widget child;
  final Widget? backgroundImage;

  const AppBackground({
    super.key,
    required this.child,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: backgroundImage ?? Assets.images.bgApp.image(
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    );
  }
}
