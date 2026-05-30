import 'dart:io' show stdout;
import 'package:flutter/foundation.dart';

class LogUtils {
  // ANSI Escape Codes for console coloring
  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[31m';
  static const String _green = '\x1B[32m';
  static const String _yellow = '\x1B[33m';
  static const String _blue = '\x1B[34m';
  static const String _cyan = '\x1B[36m';

  static bool get _useColor {
    if (kIsWeb) return false;
    try {
      return stdout.supportsAnsiEscapes;
    } catch (_) {
      return false;
    }
  }

  static void e(String message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      final tag = _useColor ? '$_red🚨 [ERROR]$_reset' : '🚨 [ERROR]';
      final msg = _useColor ? '$_red$message$_reset' : message;
      // ignore: avoid_print
      print('$tag $msg');
      if (error != null) {
        // ignore: avoid_print
        print(_useColor ? '${_red}Error details: $error$_reset' : 'Error details: $error');
      }
      if (stackTrace != null) {
        // ignore: avoid_print
        print(_useColor ? '${_red}Stacktrace:\n$stackTrace$_reset' : 'Stacktrace:\n$stackTrace');
      }
    }
  }

  static void d(String message) {
    if (kDebugMode) {
      final tag = _useColor ? '$_blue🔵 [DEBUG]$_reset' : '🔵 [DEBUG]';
      final msg = _useColor ? '$_blue$message$_reset' : message;
      // ignore: avoid_print
      print('$tag $msg');
    }
  }

  static void i(String message) {
    if (kDebugMode) {
      final tag = _useColor ? '$_green🟢 [INFO]$_reset' : '🟢 [INFO]';
      final msg = _useColor ? '$_green$message$_reset' : message;
      // ignore: avoid_print
      print('$tag $msg');
    }
  }

  static void w(String message) {
    if (kDebugMode) {
      final tag = _useColor ? '$_yellow🟡 [WARNING]$_reset' : '🟡 [WARNING]';
      final msg = _useColor ? '$_yellow$message$_reset' : message;
      // ignore: avoid_print
      print('$tag $msg');
    }
  }

  static void v(String message) {
    if (kDebugMode) {
      final tag = _useColor ? '$_cyan🟣 [VERBOSE]$_reset' : '🟣 [VERBOSE]';
      final msg = _useColor ? '$_cyan$message$_reset' : message;
      // ignore: avoid_print
      print('$tag $msg');
    }
  }
}

