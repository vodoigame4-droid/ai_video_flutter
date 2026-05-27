---
name: flutter-theme
description: Define and enforce theme, color, and typography usage for the APP Flutter project based on the Figma design system. Use when Codex needs to build UI, apply styles, use colors, or add text to ensure consistency with the defined design system.
---

# Flutter Theme Skill

Enforce the use of the project's central theme definitions for all colors and typography to maintain consistency across the app.

## Rules for Styling

1. **Never Hardcode Colors**: Do not use hex strings, `Colors.red`, or raw ARGB values directly in UI code.
2. **Never Hardcode Typography**: Do not manually define `TextStyle` directly in widgets.
3. **Use Theme Context for Colors**: Always retrieve colors from `BuildContext` extensions (e.g., `context.colorScheme.primary`, `context.colorScheme.surface`, `context.appTheme.borderColor`) instead of importing `AppColors` directly in UI code.
4. **Use Theme Context for Typography**: Always retrieve text styles from `BuildContext` extensions (e.g., `context.textTheme.bodyMedium`, `context.textTheme.titleLarge`, `context.appTheme.bodyNormalBold`) instead of importing `AppTextStyles` directly in UI code.
5. **NEVER USE `copyWith`**: Do not use `.copyWith()` on any `TextStyle` in the UI code. All text styles, including their specific font sizes, weights, and colors (even contextual ones like `categoryActiveTextSelected`), must be strictly defined in `AppTextStyles` and registered via `TextTheme` or `AppThemeExtension`. If a style variant is missing, add it to `app_text_styles.dart` and register it in `app_theme.dart` instead of using `copyWith`.
6. **NEVER USE `withOpacity`**: The `.withOpacity(x)` method is deprecated in Flutter 3.22+. You **MUST** use `.withValues(alpha: x)` instead when you need to adjust the alpha channel of a color.

## Colors & Themes (via `BuildContext`)

When building UI, use the helper extension on `BuildContext` to retrieve theme colors:
- `context.colorScheme.primary` / `context.colorScheme.secondary`: For highlights, active tabs, buttons, and primary actions.
- `context.colorScheme.surface` / `context.theme.scaffoldBackgroundColor`: For surfaces, containers, card backgrounds, and scaffold backgrounds.
- `context.appTheme.primaryGradient`: For gradient highlights, active category chips, and call-to-actions.
- `context.appTheme.borderColor` / `context.appTheme.lightBorderColor`: For outlines, borders, and dividers.
- `context.appTheme.heartColor`: For favorite buttons or like badges.

Example usage:
```dart
Container(
  decoration: BoxDecoration(
    color: context.colorScheme.surface,
    border: Border.all(color: context.appTheme.borderColor, width: 1),
  ),
  child: Icon(Icons.star, color: context.colorScheme.primary),
)
```

## Typography (via `BuildContext`)

When adding text to the UI, strictly use styles from `context.textTheme` or `context.appTheme` WITHOUT using `copyWith`.

Example usage:
```dart
Text(
  'Recommend',
  style: context.textTheme.titleLarge,
)

Text(
  'Search...',
  style: context.appTheme.bodyNormalBold, // Custom app text style via theme extension
)
```
