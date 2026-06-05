import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:core_business/core_business.dart';

abstract class AppConstants {
  const AppConstants._();

  static const String supportEmail = 'vodoigame4@gmail.com';
  static const String emailSubject = 'Support & Feedback - Video AI';
  static const String privacyPolicyUrl = 'https://google.com';
  static const String termsOfUseUrl = 'https://google.com';
}

/// Helper function to open the email client with predefined subject, body, and app metadata.
Future<void> launchSupportEmail() async {
  String appVersion = '1.0.0';
  final String osVersion = Platform.isAndroid ? 'Android' : 'iOS';

  try {
    final packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
  } catch (_) {
    // Fallback if package info cannot be retrieved (e.g. in test env)
  }

  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: AppConstants.supportEmail,
    queryParameters: {
      'subject': AppConstants.emailSubject,
      'body': '\n\n---\nApp Version: $appVersion\nOS: $osVersion',
    },
  );

  try {
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      LogUtils.e('AppConstants: Could not launch support email client for Uri: $emailUri');
    }
  } catch (e, stack) {
    LogUtils.e('AppConstants: Error launching support email', error: e, stackTrace: stack);
  }
}

/// Helper function to open the Privacy Policy URL inside the App's built-in webview.
Future<void> launchPrivacyPolicy() async {
  final Uri uri = Uri.parse(AppConstants.privacyPolicyUrl);
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    } else {
      LogUtils.e('AppConstants: Could not launch Privacy Policy URL: $uri');
    }
  } catch (e, stack) {
    LogUtils.e('AppConstants: Error launching Privacy Policy URL', error: e, stackTrace: stack);
  }
}

/// Helper function to open the Terms of Use URL inside the App's built-in webview.
Future<void> launchTermsOfUse() async {
  final Uri uri = Uri.parse(AppConstants.termsOfUseUrl);
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    } else {
      LogUtils.e('AppConstants: Could not launch Terms of Use URL: $uri');
    }
  } catch (e, stack) {
    LogUtils.e('AppConstants: Error launching Terms of Use URL', error: e, stackTrace: stack);
  }
}
