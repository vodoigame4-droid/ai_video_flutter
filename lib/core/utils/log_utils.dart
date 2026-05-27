import 'package:flutter/foundation.dart';

class LogUtils {
  static void e(String message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('[ERROR] $message');
      if (error != null) {
        // ignore: avoid_print
        print('Error details: $error');
      }
      if (stackTrace != null) {
        // ignore: avoid_print
        print('Stacktrace: $stackTrace');
      }
    }
  }

  static void d(String message) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('[DEBUG] $message');
    }
  }
}
