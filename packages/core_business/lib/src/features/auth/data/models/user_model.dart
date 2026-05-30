import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

Object? _readDeviceId(Map json, String key) {
  return json['deviceId'] ?? json['device_id'];
}

Object? _readInviteCode(Map json, String key) {
  return json['inviteCode'] ?? json['invite_code'];
}

Object? _readIsRated(Map json, String key) {
  return json['isRated'] ?? json['is_rated'] ?? false;
}

Object? _readActiveSubId(Map json, String key) {
  return json['activeSubId'] ?? json['active_sub_id'];
}

Object? _readCreatedAt(Map json, String key) {
  return json['createdAt'] ?? json['created_at'];
}

Object? _readIsVip(Map json, String key) {
  final vipExpireAt = json['vipExpireAt'] ?? json['vip_expire_at'];
  if (vipExpireAt != null) {
    try {
      final date = DateTime.parse(vipExpireAt.toString());
      return date.isAfter(DateTime.now());
    } catch (_) {
      return false;
    }
  }
  return json['isVip'] ?? json['is_vip'] ?? false;
}

Object? _readSubscribeCredits(Map json, String key) {
  return json['temporaryCredits'] ?? 
         json['temporary_credits'] ?? 
         json['subscribeCredits'] ?? 
         json['subscribe_credits'] ?? 
         0;
}

Object? _readExtraCredits(Map json, String key) {
  if (json['extraCredits'] != null) return json['extraCredits'];
  if (json['extra_summary'] != null) return json['extra_summary'];
  if (json['extra_credits'] != null) return json['extra_credits'];
  
  final credits = (json['credits'] as num?)?.toInt() ?? 0;
  final subscribeCredits = (json['temporaryCredits'] ?? 
                            json['temporary_credits'] ?? 
                            json['subscribeCredits'] ?? 
                            json['subscribe_credits'] as num?)?.toInt() ?? 0;
  return credits - subscribeCredits;
}

Object? _readRefUsersCount(Map json, String key) {
  return json['refUsersCount'] ?? json['ref_users_count'] ?? 0;
}

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    @JsonKey(readValue: _readDeviceId) required String deviceId,
    required String? name,
    required String? email,
    required String? avatarUrl,
    @JsonKey(readValue: _readInviteCode) required String inviteCode,
    required String status,
    required int credits,
    @JsonKey(readValue: _readExtraCredits) required int extraCredits,
    @JsonKey(readValue: _readSubscribeCredits) required int subscribeCredits,
    @JsonKey(readValue: _readIsRated) required bool isRated,
    @JsonKey(readValue: _readIsVip) required bool isVip,
    @JsonKey(readValue: _readActiveSubId) required String? activeSubId,
    @JsonKey(readValue: _readRefUsersCount) required int refUsersCount,
    @JsonKey(readValue: _readCreatedAt) required String createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  UserEntity toEntity() => UserEntity(
        id: id,
        deviceId: deviceId,
        name: name ?? '',
        email: email ?? '',
        avatarUrl: avatarUrl ?? '',
        inviteCode: inviteCode,
        status: status,
        credits: credits,
        extraCredits: extraCredits,
        subscribeCredits: subscribeCredits,
        isRated: isRated,
        isVip: isVip,
        activeSubId: activeSubId,
        refUsersCount: refUsersCount,
        createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
      );
}


