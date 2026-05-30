import 'package:flutter/foundation.dart';

class LogUtils {
  // ANSI Escape Codes for console coloring
  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[31m';
  static const String _green = '\x1B[32m';
  static const String _yellow = '\x1B[33m';
  static const String _blue = '\x1B[34m';
  static const String _cyan = '\x1B[36m';

  static void e(String message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('$_red[ERROR] $message$_reset');
      if (error != null) {
        // ignore: avoid_print
        print('${_red}Error details: $error$_reset');
      }
      if (stackTrace != null) {
        // ignore: avoid_print
        print('${_red}Stacktrace:\n$stackTrace$_reset');
      }
    }
  }

  static void d(String message) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('$_blue[DEBUG] $message$_reset');
    }
  }

  static void i(String message) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('$_green[INFO] $message$_reset');
    }
  }

  static void w(String message) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('$_yellow[WARNING] $message$_reset');
    }
  }

  static void v(String message) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('$_cyan[VERBOSE] $message$_reset');
    }
  }
}

