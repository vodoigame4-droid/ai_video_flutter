import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  const AppTextStyles._();

  // Yotin Font Styles (Fallback to custom font Yotin, otherwise System Serif Italic)
  static final TextStyle appName = const TextStyle(
    fontFamily: 'Yotin',
    fontSize: 30.0,
    fontWeight: FontWeight.w900, // Heavy
    fontStyle: FontStyle.italic,
    color: AppColors.white,
  );

  static final TextStyle brandingHeader = appName;

  // Plus Jakarta Sans Styles
  static final TextStyle titleLarge = GoogleFonts.plusJakartaSans(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static final TextStyle sectionTitle = GoogleFonts.plusJakartaSans(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static final TextStyle dialogTitle = GoogleFonts.plusJakartaSans(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static final TextStyle buttonTextEnabled = GoogleFonts.plusJakartaSans(
    fontSize: 18.0,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.white,
  );

  static final TextStyle buttonTextDisabled = GoogleFonts.plusJakartaSans(
    fontSize: 18.0,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.subText,
  );

  // Inter Styles
  static final TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );

  static final TextStyle bodyNormal = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );

  static final TextStyle bodySubText = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.subText,
  );

  static final TextStyle proBadgeText = GoogleFonts.inter(
    fontSize: 10.0,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static final TextStyle categoryActiveText = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static final TextStyle categoryInactiveText = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.subText,
  );

  static final TextStyle dialogBody = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.subText,
  );

  static final TextStyle seeAllText = GoogleFonts.inter(
    fontSize: 11.0,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.subText,
  );

  static final TextStyle settingsHeader = GoogleFonts.inter(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static final TextStyle customPromptText = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );

  static final TextStyle promptPlaceholderText = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.subText,
  );

  static final TextStyle characterCountText = GoogleFonts.inter(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: AppColors.subText,
  );

  // App quality labels (avoid copyWith)
  static final TextStyle qualityLabelActive = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static final TextStyle qualityLabelInactive = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.subText,
  );

  // App duration labels (avoid copyWith)
  static final TextStyle durationLabelActive = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static final TextStyle durationLabelInactive = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.subText,
  );

  static final TextStyle bodyNormalBold = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static final TextStyle errorText = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.heart,
  );

  static final TextStyle categoryActiveTextSelected = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
}
