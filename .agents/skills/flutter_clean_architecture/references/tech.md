---
trigger: always_on
---

# Tech Stack

- Language: Dart 3.11+
- Framework: Flutter (Material 3, dark theme only)
- Platforms: Android, iOS

## State Management
- flutter_bloc / bloc 9.x — every feature gets its own Bloc
- equatable for value equality on events and states

## Dependency Injection
- get_it (manual registration in `lib/injection_container.dart`)
- Repositories registered as `LazySingleton`, UseCases and Blocs as `Factory`

## Networking
- dio for REST API calls
- Custom SSE streaming via a separate `sseDio` instance with `text/event-stream` accept header
- AuthInterceptor handles token injection and 401/403 flows

## Data Serialization
- json_annotation + json_serializable for DTOs (`.g.dart` generated files)
- freezed_annotation available but DTOs currently use `@JsonSerializable()` pattern

## Navigation
- go_router with `StatefulShellRoute.indexedStack` for bottom nav tabs
- Pages define static `path` and `routeName` constants

## Local Storage
- shared_preferences for key-value storage
- flutter_secure_storage for sensitive data (tokens)
- sqflite / drift for structured local DB (chat messages)

## Firebase
- firebase_core, firebase_auth (anonymous + Google Sign-In)
- firebase_messaging (push notifications)
- firebase_remote_config (feature flags)

## i18n
- slang for type-safe translations (12 locales)
- Source JSON files in `lib/i18n/*.i18n.json`, generated Dart in `lib/i18n/strings*.g.dart`

## Asset Generation
- flutter_gen_runner generates `lib/gen/assets.gen.dart` and `lib/gen/fonts.gen.dart`
- Integrations: flutter_svg, lottie
- Access assets via generated APIs from `Assets.*`, not by raw string paths in app code

## UI Libraries
- flutter_svg, lottie, cached_network_image, shimmer
- liquid_glass_widgets, flutter_slidable

## Linting
- flutter_lints (default rules, no custom overrides)

## Common Commands

```bash
# Install dependencies
flutter pub get

# Run full code generation (build_runner + slang)
# Or double-click generate.command on macOS
flutter pub get && dart run build_runner build --delete-conflicting-outputs && dart run slang

# Run build_runner only (models, DI, assets)
dart run build_runner build --delete-conflicting-outputs

# Run slang only (translations)
dart run slang

# Analyze code
flutter analyze

# Run tests
flutter test

# Build APK
flutter build apk

# Build iOS
flutter build ios
```
