import 'package:flutter/material.dart';
import '../../../../i18n/strings.g.dart';
import 'ob_page_template.dart';

class ObPage3 extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const ObPage3({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return ObPageTemplate(
      backgroundImage: 'assets/images/ob_3.png',
      title: t.onboarding.page3.title,
      subtitle: t.onboarding.page3.subtitle,
      buttonText: t.onboarding.page3.button,
      onButtonPressed: onButtonPressed,
    );
  }
}
