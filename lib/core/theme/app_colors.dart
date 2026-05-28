import 'package:flutter/painting.dart';

abstract class AppColors {
  const AppColors._();

  static const Color primary = Color(0xFF24C780);
  static const Color secondary = Color(0xFF2BC5C5);
  static const Color activeTab = Color(0xFF979797);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color onSurface = Color(0xFF171717);
  static const Color background = Color(0xFF171717);
  static const Color surface = Color(
    0xFF222222,
  ); // Darker gray for card/container surfaces
  static const Color heart = Color(0xFFFF4747);
  static const Color subText = Color(0xFFB1B1B1);
  static const Color darkGreenBorder = Color(0xFF1C362B);

  // Generic borders to support theme rules
  static const Color border = Color(0xFF1C362B);
  static const Color lightBorder = Color(0xFF2A2A2A);
  static const Color border2 = Color(0x80878787);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient borderGradient = LinearGradient(
    colors: [secondary, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
