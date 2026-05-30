import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String deviceId,
    required String name,
    required String email,
    required String avatarUrl,
    required String inviteCode,
    required String status,
    required int credits,
    required int extraCredits,
    required int subscribeCredits,
    required bool isRated,
    required bool isVip,
    required String? activeSubId,
    required int refUsersCount,
    required DateTime createdAt,
  }) = _UserEntity;
}
