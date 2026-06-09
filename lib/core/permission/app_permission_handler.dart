import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:gal/gal.dart';
import 'package:ai_video_flutter/core/widgets/app_confirm_dialog.dart';
import 'package:ai_video_flutter/i18n/strings.g.dart';
import 'package:ai_video_flutter/core/utils/log_utils.dart';

class AppPermissionHandler {
  AppPermissionHandler._();

  /// A generic method to check, request, and handle settings redirection for any [Permission].
  /// Returns [true] if permission is granted, [false] otherwise.
  static Future<bool> checkAndRequestPermission(
    BuildContext context,
    Permission permission, {
    required String title,
    required String desc,
  }) async {
    LogUtils.i('AppPermissionHandler: Checking permission for $permission...');
    final status = await permission.status;
    LogUtils.d('AppPermissionHandler: Current permission status: $status');

    if (status.isGranted) {
      LogUtils.i('AppPermissionHandler: Permission $permission is already granted');
      return true;
    }

    if (status.isPermanentlyDenied) {
      LogUtils.w('AppPermissionHandler: Permission $permission is permanently denied. Showing settings dialog.');
      if (context.mounted) {
        await _showSettingsDialog(context, title: title, desc: desc);
      }
      return false;
    }

    // Request permission
    LogUtils.d('AppPermissionHandler: Requesting permission for $permission...');
    final requestResult = await permission.request();
    LogUtils.i('AppPermissionHandler: Permission request result: $requestResult');

    if (requestResult.isGranted) {
      return true;
    }

    if (requestResult.isPermanentlyDenied) {
      LogUtils.w('AppPermissionHandler: Permission $permission became permanently denied after request. Showing settings dialog.');
      if (context.mounted) {
        await _showSettingsDialog(context, title: title, desc: desc);
      }
    }

    return false;
  }

  /// Checks and requests Camera permission.
  static Future<bool> checkAndRequestCameraPermission(BuildContext context) async {
    final t = context.t;
    return checkAndRequestPermission(
      context,
      Permission.camera,
      title: t.permission.camera_title,
      desc: t.permission.camera_desc,
    );
  }

  /// Checks and requests Photos/Storage permission.
  static Future<bool> checkAndRequestPhotosPermission(BuildContext context) async {
    final t = context.t;

    if (Platform.isIOS) {
      final status = await Permission.photos.status;
      LogUtils.d('AppPermissionHandler: Current iOS Photos permission status: $status');

      if (status.isGranted || status.isLimited) {
        LogUtils.i('AppPermissionHandler: Photos permission is already granted or limited');
        return true;
      }

      if (status.isPermanentlyDenied) {
        LogUtils.w('AppPermissionHandler: Photos permission is permanently denied. Showing settings dialog.');
        if (context.mounted) {
          await _showSettingsDialog(
            context,
            title: t.permission.photos_title,
            desc: t.permission.photos_desc,
          );
        }
        return false;
      }

      LogUtils.d('AppPermissionHandler: Requesting iOS Photos permission...');
      final requestResult = await Permission.photos.request();
      LogUtils.i('AppPermissionHandler: Photos permission request result: $requestResult');

      if (requestResult.isGranted || requestResult.isLimited) {
        return true;
      }

      if (requestResult.isPermanentlyDenied) {
        if (context.mounted) {
          await _showSettingsDialog(
            context,
            title: t.permission.photos_title,
            desc: t.permission.photos_desc,
          );
        }
      }
      return false;
    } else if (Platform.isAndroid) {
      final sdkVersion = await _getAndroidSdkVersion();
      LogUtils.d('AppPermissionHandler: Android SDK version: $sdkVersion');

      if (sdkVersion >= 29) {
        // Android 10+ (API 29+) uses MediaStore to save images/videos, which does not require WRITE_EXTERNAL_STORAGE.
        // Thus, we consider permission as granted for saving purposes.
        LogUtils.i('AppPermissionHandler: Android SDK >= 29, no storage permission required for saving.');
        return true;
      } else {
        // Android < 10 (API < 29) requires WRITE_EXTERNAL_STORAGE.
        return checkAndRequestPermission(
          context,
          Permission.storage,
          title: t.permission.photos_title,
          desc: t.permission.photos_desc,
        );
      }
    }
    return true;
  }

  /// Checks and requests Microphone permission.
  static Future<bool> checkAndRequestMicrophonePermission(BuildContext context) async {
    final t = context.t;
    return checkAndRequestPermission(
      context,
      Permission.microphone,
      title: t.permission.microphone_title,
      desc: t.permission.microphone_desc,
    );
  }

  /// Checks and requests Notification permission.
  static Future<bool> checkAndRequestNotificationPermission(BuildContext context) async {
    final t = context.t;
    return checkAndRequestPermission(
      context,
      Permission.notification,
      title: t.permission.notification_title,
      desc: t.permission.notification_desc,
    );
  }

  /// Checks if Camera permission is already granted.
  static Future<bool> isCameraPermissionGranted() async {
    final status = await Permission.camera.status;
    return status.isGranted;
  }

  /// Checks if Photos/Gallery permission is already granted.
  static Future<bool> isPhotosPermissionGranted() async {
    if (Platform.isIOS) {
      final status = await Permission.photos.status;
      return status.isGranted || status.isLimited;
    } else if (Platform.isAndroid) {
      final sdkVersion = await _getAndroidSdkVersion();
      if (sdkVersion >= 29) {
        return true;
      } else {
        final status = await Permission.storage.status;
        return status.isGranted;
      }
    }
    return true;
  }

  /// Checks if Microphone permission is already granted.
  static Future<bool> isMicrophonePermissionGranted() async {
    final status = await Permission.microphone.status;
    return status.isGranted;
  }

  /// Checks if Notification permission is already granted.
  static Future<bool> isNotificationPermissionGranted() async {
    final status = await Permission.notification.status;
    return status.isGranted;
  }

  static Future<void> _showSettingsDialog(
    BuildContext context, {
    required String title,
    required String desc,
  }) async {
    final t = context.t;
    await AppConfirmDialog.show<void>(
      context: context,
      title: title,
      description: desc,
      cancelLabel: t.permission.cancel,
      confirmLabel: t.permission.settings,
      onConfirm: () async {
        LogUtils.i('AppPermissionHandler: Opening app settings...');
        await openAppSettings();
      },
    );
  }

  static Future<int> _getAndroidSdkVersion() async {
    if (!Platform.isAndroid) return 0;
    try {
      final sdkString = Platform.operatingSystemVersion;
      final match = RegExp(r'SDK\s+(\d+)').firstMatch(sdkString);
      if (match != null) {
        return int.parse(match.group(1)!);
      }
    } catch (e) {
      LogUtils.e('AppPermissionHandler: Failed to parse Android SDK version', error: e);
    }
    return 0;
  }

}
