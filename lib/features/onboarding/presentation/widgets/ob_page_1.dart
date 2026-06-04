import 'package:flutter/material.dart';
import '../../../../i18n/strings.g.dart';
import 'ob_page_template.dart';

class ObPage1 extends StatelessWidget {
  final String backgroundImage;
  final VoidCallback onButtonPressed;

  const ObPage1({
    super.key,
    required this.backgroundImage,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return ObPageTemplate(
      backgroundImage: backgroundImage,
      title: t.onboarding.page1.title,
      subtitle: t.onboarding.page1.subtitle,
      buttonText: t.onboarding.page1.button,
      onButtonPressed: onButtonPressed,
    );
  }
}
