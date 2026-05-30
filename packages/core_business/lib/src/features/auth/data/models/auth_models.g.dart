// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    _LoginRequestModel(
      deviceId: json['deviceId'] as String,
      app: json['app'] as String,
      appVersion: json['app-version'] as String,
      refCode: json['refCode'] as String?,
      appType: json['app-type'] as String,
    );

Map<String, dynamic> _$LoginRequestModelToJson(_LoginRequestModel instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'app': instance.app,
      'app-version': instance.appVersion,
      'refCode': instance.refCode,
      'app-type': instance.appType,
    };

_LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    _LoginResponseModel(
      accessToken: json['accessToken'] as String,
      tokenExpires: (json['tokenExpires'] as num).toInt(),
      refreshToken: json['refreshToken'] as String,
      refreshTokenExpires: (json['refreshTokenExpires'] as num).toInt(),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseModelToJson(_LoginResponseModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'tokenExpires': instance.tokenExpires,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpires': instance.refreshTokenExpires,
      'user': instance.user,
    };

_RefreshRequestModel _$RefreshRequestModelFromJson(Map<String, dynamic> json) =>
    _RefreshRequestModel(refreshToken: json['refreshToken'] as String);

Map<String, dynamic> _$RefreshRequestModelToJson(
  _RefreshRequestModel instance,
) => <String, dynamic>{'refreshToken': instance.refreshToken};

_UpdateUserRequestModel _$UpdateUserRequestModelFromJson(
  Map<String, dynamic> json,
) => _UpdateUserRequestModel(
  name: json['name'] as String?,
  email: json['email'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
);

Map<String, dynamic> _$UpdateUserRequestModelToJson(
  _UpdateUserRequestModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'avatarUrl': instance.avatarUrl,
};
