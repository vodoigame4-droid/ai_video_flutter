import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

abstract class AppTheme {
  const AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      
      // Page transitions: Use Cupertino by default for a highly premium, smooth slide transition
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        },
      ),

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        onPrimary: AppColors.white,
        onSurface: AppColors.white,
        error: AppColors.heart,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.white),
      ),

      // Text Theme mapping AppTextStyles
      textTheme: TextTheme(
        displayMedium: AppTextStyles.appName,
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.sectionTitle, // Also matches dialogTitle
        titleSmall: AppTextStyles.settingsHeader,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyNormal,
        bodySmall: AppTextStyles.bodySubText,
        labelLarge: AppTextStyles.buttonTextEnabled,
        labelMedium: AppTextStyles.characterCountText,
        labelSmall: AppTextStyles.proBadgeText,
      ),

      // Card / Container Theme
      cardTheme: const CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: AppColors.border, width: 1),
        ),
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(color: AppColors.border, width: 1),
        ),
        titleTextStyle: AppTextStyles.dialogTitle,
        contentTextStyle: AppTextStyles.dialogBody,
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.background,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),

      // SnackBar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        contentTextStyle: AppTextStyles.bodyNormal,
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: AppTextStyles.seeAllText,
          foregroundColor: AppColors.subText,
        ),
      ),

      // Icon Theme
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),

      // Extensions
      extensions: [
        AppThemeExtension(
          primaryGradient: AppColors.primaryGradient,
          categoryActiveStyle: AppTextStyles.categoryActiveText,
          categoryInactiveStyle: AppTextStyles.categoryInactiveText,
          categoryActiveStyleSelected: AppTextStyles.categoryActiveTextSelected,
          qualityLabelActiveStyle: AppTextStyles.qualityLabelActive,
          qualityLabelInactiveStyle: AppTextStyles.qualityLabelInactive,
          bodyNormalBold: AppTextStyles.bodyNormalBold,
          errorTextStyle: AppTextStyles.errorText,
          seeAllTextStyle: AppTextStyles.seeAllText,
          heartColor: AppColors.heart,
          borderColor: AppColors.border,
          lightBorderColor: AppColors.lightBorder,
        ),
      ],
    );
  }
}

/// Custom theme extension for visual assets/styles specific to our App design.
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final LinearGradient primaryGradient;
  final TextStyle categoryActiveStyle;
  final TextStyle categoryInactiveStyle;
  final TextStyle categoryActiveStyleSelected;
  final TextStyle qualityLabelActiveStyle;
  final TextStyle qualityLabelInactiveStyle;
  final TextStyle bodyNormalBold;
  final TextStyle errorTextStyle;
  final TextStyle seeAllTextStyle;
  final Color heartColor;
  final Color borderColor;
  final Color lightBorderColor;

  const AppThemeExtension({
    required this.primaryGradient,
    required this.categoryActiveStyle,
    required this.categoryInactiveStyle,
    required this.categoryActiveStyleSelected,
    required this.qualityLabelActiveStyle,
    required this.qualityLabelInactiveStyle,
    required this.bodyNormalBold,
    required this.errorTextStyle,
    required this.seeAllTextStyle,
    required this.heartColor,
    required this.borderColor,
    required this.lightBorderColor,
  });

  @override
  AppThemeExtension copyWith({
    LinearGradient? primaryGradient,
    TextStyle? categoryActiveStyle,
    TextStyle? categoryInactiveStyle,
    TextStyle? categoryActiveStyleSelected,
    TextStyle? qualityLabelActiveStyle,
    TextStyle? qualityLabelInactiveStyle,
    TextStyle? bodyNormalBold,
    TextStyle? errorTextStyle,
    TextStyle? seeAllTextStyle,
    Color? heartColor,
    Color? borderColor,
    Color? lightBorderColor,
  }) {
    return AppThemeExtension(
      primaryGradient: primaryGradient ?? this.primaryGradient,
      categoryActiveStyle: categoryActiveStyle ?? this.categoryActiveStyle,
      categoryInactiveStyle: categoryInactiveStyle ?? this.categoryInactiveStyle,
      categoryActiveStyleSelected: categoryActiveStyleSelected ?? this.categoryActiveStyleSelected,
      qualityLabelActiveStyle: qualityLabelActiveStyle ?? this.qualityLabelActiveStyle,
      qualityLabelInactiveStyle: qualityLabelInactiveStyle ?? this.qualityLabelInactiveStyle,
      bodyNormalBold: bodyNormalBold ?? this.bodyNormalBold,
      errorTextStyle: errorTextStyle ?? this.errorTextStyle,
      seeAllTextStyle: seeAllTextStyle ?? this.seeAllTextStyle,
      heartColor: heartColor ?? this.heartColor,
      borderColor: borderColor ?? this.borderColor,
      lightBorderColor: lightBorderColor ?? this.lightBorderColor,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      primaryGradient: LinearGradient.lerp(primaryGradient, other.primaryGradient, t)!,
      categoryActiveStyle: TextStyle.lerp(categoryActiveStyle, other.categoryActiveStyle, t)!,
      categoryInactiveStyle: TextStyle.lerp(categoryInactiveStyle, other.categoryInactiveStyle, t)!,
      categoryActiveStyleSelected: TextStyle.lerp(categoryActiveStyleSelected, other.categoryActiveStyleSelected, t)!,
      qualityLabelActiveStyle: TextStyle.lerp(qualityLabelActiveStyle, other.qualityLabelActiveStyle, t)!,
      qualityLabelInactiveStyle: TextStyle.lerp(qualityLabelInactiveStyle, other.qualityLabelInactiveStyle, t)!,
      bodyNormalBold: TextStyle.lerp(bodyNormalBold, other.bodyNormalBold, t)!,
      errorTextStyle: TextStyle.lerp(errorTextStyle, other.errorTextStyle, t)!,
      seeAllTextStyle: TextStyle.lerp(seeAllTextStyle, other.seeAllTextStyle, t)!,
      heartColor: Color.lerp(heartColor, other.heartColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      lightBorderColor: Color.lerp(lightBorderColor, other.lightBorderColor, t)!,
    );
  }
}

/// Helper extension on BuildContext to quickly access the detailed theme parameters.
extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  AppThemeExtension get appTheme => theme.extension<AppThemeExtension>()!;
}
