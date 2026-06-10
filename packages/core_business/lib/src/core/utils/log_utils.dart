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

  static void _safePrint({
    required String tagNoColor,
    required String tagColor,
    required String message,
    required String color,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!kDebugMode) return;

    final formattedTag = _useColor ? tagColor : tagNoColor;

    // Split message into chunks of 800 characters to prevent OS console truncation
    if (message.length <= 800) {
      final formattedMsg = _useColor ? '$color$message$_reset' : message;
      // ignore: avoid_print
      print('$formattedTag $formattedMsg');
    } else {
      int startIndex = 0;
      int chunkIndex = 0;
      while (startIndex < message.length) {
        int endIndex = startIndex + 800;
        if (endIndex > message.length) {
          endIndex = message.length;
        }
        final chunk = message.substring(startIndex, endIndex);
        final prefix = chunkIndex > 0 ? '...' : '';
        final suffix = endIndex < message.length ? '...' : '';

        final formattedMsg = _useColor ? '$color$prefix$chunk$suffix$_reset' : '$prefix$chunk$suffix';
        // ignore: avoid_print
        print('$formattedTag $formattedMsg');

        startIndex = endIndex;
        chunkIndex++;
      }
    }

    if (error != null) {
      // ignore: avoid_print
      print(_useColor ? '${_red}Error details: $error$_reset' : 'Error details: $error');
    }
    if (stackTrace != null) {
      // ignore: avoid_print
      print(_useColor ? '${_red}Stacktrace:\n$stackTrace$_reset' : 'Stacktrace:\n$stackTrace');
    }
  }

  static void e(String message, {Object? error, StackTrace? stackTrace}) {
    _safePrint(
      tagNoColor: '🚨 [ERROR]',
      tagColor: '$_red🚨 [ERROR]$_reset',
      message: message,
      color: _red,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void d(String message) {
    _safePrint(
      tagNoColor: '🔵 [DEBUG]',
      tagColor: '$_blue🔵 [DEBUG]$_reset',
      message: message,
      color: _blue,
    );
  }

  static void i(String message) {
    _safePrint(
      tagNoColor: '🟢 [INFO]',
      tagColor: '$_green🟢 [INFO]$_reset',
      message: message,
      color: _green,
    );
  }

  static void w(String message) {
    _safePrint(
      tagNoColor: '🟡 [WARNING]',
      tagColor: '$_yellow🟡 [WARNING]$_reset',
      message: message,
      color: _yellow,
    );
  }

  static void v(String message) {
    _safePrint(
      tagNoColor: '🟣 [VERBOSE]',
      tagColor: '$_cyan🟣 [VERBOSE]$_reset',
      message: message,
      color: _cyan,
    );
  }
}

