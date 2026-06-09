import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
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

    if (Platform.isAndroid) {
      // For saving/downloading videos using Gal on Android 10 (API 29) and higher,
      // no runtime permissions are required. We can return true immediately.
      final sdkVersion = _getAndroidSdkVersion();
      if (sdkVersion >= 29) {
        LogUtils.i('AppPermissionHandler: Android SDK version is $sdkVersion. No storage permission is required for downloading.');
        return true;
      }

      // Fallback for Android 9 (API 28) or lower
      return checkAndRequestPermission(
        context,
        Permission.storage,
        title: t.permission.photos_title,
        desc: t.permission.photos_desc,
      );
    }

    // For iOS, check and request photos permission
    return checkAndRequestPermission(
      context,
      Permission.photos,
      title: t.permission.photos_title,
      desc: t.permission.photos_desc,
    );
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

  static int _getAndroidSdkVersion() {
    try {
      final versionString = Platform.operatingSystemVersion;
      // Typically: "Android 10 (SDK 29)" or "SDK 29"
      final match = RegExp(r'SDK\s+(\d+)').firstMatch(versionString);
      if (match != null) {
        return int.tryParse(match.group(1) ?? '') ?? 0;
      }
    } catch (_) {}
    return 0;
  }
}
