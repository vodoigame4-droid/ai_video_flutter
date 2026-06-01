import 'dart:io';
import 'package:core_business/core_business.dart';

class AppConfigImpl implements AppConfig {
  final String _appVersion;

  AppConfigImpl({required String appVersion}) : _appVersion = appVersion;

  @override
  String get appType => Platform.isIOS ? 'ios' : 'android';

  @override
  String get appVersion => _appVersion;

  @override
  String get appTypeName => 'video_tgv';
}
