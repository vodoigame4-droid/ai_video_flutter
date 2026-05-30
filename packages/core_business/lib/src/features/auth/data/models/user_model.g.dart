// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  deviceId: json['deviceId'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  avatarUrl: json['avatarUrl'] as String,
  inviteCode: json['inviteCode'] as String,
  status: json['status'] as String,
  credits: (json['credits'] as num).toInt(),
  extraCredits: (json['extraCredits'] as num).toInt(),
  subscribeCredits: (json['subscribeCredits'] as num).toInt(),
  isRated: json['isRated'] as bool,
  isVip: json['isVip'] as bool,
  activeSubId: json['activeSubId'] as String?,
  refUsersCount: (json['refUsersCount'] as num).toInt(),
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'name': instance.name,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'inviteCode': instance.inviteCode,
      'status': instance.status,
      'credits': instance.credits,
      'extraCredits': instance.extraCredits,
      'subscribeCredits': instance.subscribeCredits,
      'isRated': instance.isRated,
      'isVip': instance.isVip,
      'activeSubId': instance.activeSubId,
      'refUsersCount': instance.refUsersCount,
      'createdAt': instance.createdAt,
    };
