import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgIcon extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;
  final Gradient? gradient;

  const AppSvgIcon({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.color,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      fit: BoxFit.contain,
      colorFilter: color != null && gradient == null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );

    if (gradient != null) {
      return ShaderMask(
        shaderCallback: (bounds) => gradient!.createShader(bounds),
        blendMode: BlendMode.srcIn,
        child: svg,
      );
    }

    return svg;
  }
}
