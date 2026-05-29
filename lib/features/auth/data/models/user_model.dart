import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
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
    required String createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  UserEntity toEntity() => UserEntity(
        id: id,
        deviceId: deviceId,
        name: name,
        email: email,
        avatarUrl: avatarUrl,
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
