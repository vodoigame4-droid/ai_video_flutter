---
name: logger_rules
description: Enforce the use of LogUtils for all logging across the Flutter project. Use when Codex needs to add or edit logging statements (debug, info, warning, error, or verbose) in the codebase.
---

# Logger Rules

All log statements in this project (both the main app shell and the `core_business` package) MUST strictly use `LogUtils`. Raw `print`, `debugPrint`, or third-party logger calls are strictly forbidden to ensure logs are color-coded, clean, and completely stripped in production builds.

## Available Log Levels

Use the appropriate method on `LogUtils` depending on the severity and purpose of the log:

| Method | Level | Color | When to Use | Example |
|--------|-------|-------|-------------|---------|
| `LogUtils.d` | Debug | Blue | Local debug notes, event handling, or state flows | `LogUtils.d('HomeBloc: Init fetching home categories');` |
| `LogUtils.i` | Info | Green | App lifecycle changes, success notices, or setup steps | `LogUtils.i('AuthRetryInterceptor: Token refreshed successfully');` |
| `LogUtils.w` | Warning | Yellow | Recoverable errors, unexpected defaults, or retry events | `LogUtils.w('Token refresh failed. Attempting background login...');` |
| `LogUtils.e` | Error | Red | Unrecoverable failures, API failures, or crash reports | `LogUtils.e('AuthRepositoryImpl: login failed', error: e, stackTrace: stack);` |
| `LogUtils.v` | Verbose | Cyan | Large payloads, HTTP request/response details, raw dumps | `LogUtils.v('API Response Body: ${response.data}');` |

## Enforcement Rules

1. **No Raw Prints**: Never write `print("...")` or `debugPrint("...")` directly in the feature code.
2. **Importing LogUtils**:
   * For files in the root app shell (`lib/`), import `package:core_business/core_business.dart` and call `LogUtils`.
   * For files inside the `core_business` package, import `packages/core_business/lib/src/core/utils/log_utils.dart` (or via its relative path) and call `LogUtils`.
3. **Only Logs in Debug**: Ensure all methods check `kDebugMode` before logging to keep production release builds clean. This is already implemented in `LogUtils`.
