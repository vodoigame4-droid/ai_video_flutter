---
name: flutter-theme
description: Define and enforce theme, color, and typography usage for the APP Flutter project based on the Figma design system. Use when Codex needs to build UI, apply styles, use colors, or add text to ensure consistency with the defined design system.
---

# Flutter Theme Skill

Enforce the use of the project's central theme definitions for all colors and typography to maintain consistency across the app.

## Rules for Styling

1. **Never Hardcode Colors**: Do not use hex strings, `Colors.red`, or raw ARGB values directly in UI code.
2. **Never Hardcode Typography**: Do not manually define `TextStyle` directly in widgets.
3. **Use `AppColors`**: Always retrieve colors from `lib/core/theme/app_colors.dart`.
4. **Use `AppTextStyles`**: Always retrieve text styles from `lib/core/theme/app_text_styles.dart`.
5. **NEVER USE `copyWith`**: Do not use `.copyWith()` on any `TextStyle` in the UI code. All text styles, including their specific font sizes, weights, and colors (even contextual ones like `tabTextSelected`), must be strictly defined in `AppTextStyles`. If a style variant is missing, add it to `app_text_styles.dart` instead of using `copyWith`.
6. **NEVER USE `withOpacity`**: The `.withOpacity(x)` method is deprecated in Flutter 3.22+. You **MUST** use `.withValues(alpha: x)` instead when you need to adjust the alpha channel of a color.

## Colors (`AppColors`)

When building UI, use the colors defined in `AppColors`:
- `AppColors.primary` / `AppColors.secondary`: For buttons, highlights, and primary actions.
- `AppColors.background` / `AppColors.surface`: For scaffold backgrounds and card/container surfaces.
- `AppColors.white`: For primary text and light icons.
- `AppColors.subText`: For secondary text, hints, or inactive icons.
- `AppColors.border` / `AppColors.lightBorder`: For borders, dividers, or outlines.

Example usage:
```dart
Container(
  color: AppColors.surface,
  child: Icon(Icons.star, color: AppColors.primary),
)
```

## Typography (`AppTextStyles`)

When adding text to the UI, strictly use styles from `AppTextStyles` WITHOUT using `copyWith`. Define all variants inside `AppTextStyles` if they do not already exist.

Example usage:
```dart
Text(
  'Recommend',
  style: AppTextStyles.titleLarge,
)

Text(
  'Search...',
  style: AppTextStyles.searchPlaceholder, // Add this to AppTextStyles instead of using copyWith
)
```
