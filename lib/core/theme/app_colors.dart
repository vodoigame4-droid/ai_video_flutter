import 'package:flutter/painting.dart';

abstract class AppColors {
  const AppColors._();

  static const Color primary = Color(0xFF24C780);
  static const Color secondary = Color(0xFF2BC5C5);
  static const Color activeTab = Color(0xFF979797);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color onSurface = Color(0xFF171717);
  static const Color background = Color(0xFF000200);
  static const Color surface = Color(
    0xFF222222,
  ); // Darker gray for card/container surfaces
  static const Color heart = Color(0xFFFF4747);
  static const Color subText = Color(0xFFB1B1B1);
  static const Color darkGreenBorder = Color(0xFF1C362B);
  static const Color progressTrack = Color(0xFFE2FFF5);

  // Generic borders to support theme rules
  static const Color border = Color(0xFF1C362B);
  static const Color lightBorder = Color(0xFF2A2A2A);
  static const Color border2 = Color(0x80878787);
  static const Color sheetHandle = Color(0xFF3F3F3F);
  static const Color badgeYellow = Color(0xFFFAE123);
  static const Color badgeOrange = Color(0xFFFF6320);
  static const Color badgeBlue = Color(0xFF31B8F2);
  static const Color badgeGreen = Color(0xFF0FE28E);
  static const Color badgePeach = Color(0xFFFF5E3A);
  static const Color badgePink = Color(0xFFFF2A68);
  static const Color badgeTeal = Color(0xFF00F5D4);
  static const Color badgeCyan = Color(0xFF00BBF9);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyText = Color(0xFFB0B0B0);
  static const Color weeklyBadge1 = Color(0xFF2AC5C4);
  static const Color weeklyBadge2 = Color(0xFF28C4B3);
  static const Color darkGreenBg = Color(0xFF1A3A2A);
  static const Color emeraldGreen = Color(0xFF2ECC71);
  static const Color spotifyGreen1 = Color(0xFF1DB954);
  static const Color spotifyGreen2 = Color(0xFF1ED760);

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
