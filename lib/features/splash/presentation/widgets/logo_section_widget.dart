import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/animation_extensions.dart';
import '../../../../i18n/strings.g.dart';

class LogoSectionWidget extends StatelessWidget {
  const LogoSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // App logo container with rounded corners
        Container(
          width: 120,
          height: 120,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              'assets/images/app_icon.png',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ).bounceIn(delay: const Duration(milliseconds: 200)),
        const SizedBox(height: 50),
        // App title
        Text(
          t.splash.appName,
          style: context.textTheme.displayMedium,
        ).slideAndFade(
          begin: const Offset(0.0, 0.5),
          delay: const Duration(milliseconds: 600),
          duration: const Duration(milliseconds: 500),
        ),
      ],
    );
  }
}
