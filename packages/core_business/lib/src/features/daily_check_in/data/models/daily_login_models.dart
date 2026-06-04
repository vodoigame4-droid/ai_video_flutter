import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/daily_login_entity.dart';
import '../../domain/entities/daily_reward_entity.dart';

part 'daily_login_models.freezed.dart';
part 'daily_login_models.g.dart';

@freezed
abstract class DailyRewardModel with _$DailyRewardModel {
  const factory DailyRewardModel({
    required String id,
    required int streakDay,
    required int rewardCredits,
    required bool isSpecial,
  }) = _DailyRewardModel;

  factory DailyRewardModel.fromJson(Map<String, dynamic> json) =>
      _$DailyRewardModelFromJson(json);
}

extension DailyRewardModelX on DailyRewardModel {
  DailyRewardEntity toEntity() => DailyRewardEntity(
        id: id,
        streakDay: streakDay,
        rewardCredits: rewardCredits,
        isSpecial: isSpecial,
      );
}

@freezed
abstract class DailyLoginResponseModel with _$DailyLoginResponseModel {
  const factory DailyLoginResponseModel({
    required int currentStreak,
    required dynamic lastLoginAt,
    @JsonKey(name: 'reward') required List<DailyRewardModel> rewards,
  }) = _DailyLoginResponseModel;

  factory DailyLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DailyLoginResponseModelFromJson(json);
}

extension DailyLoginResponseModelX on DailyLoginResponseModel {
  DailyLoginEntity toEntity() => DailyLoginEntity(
        currentStreak: currentStreak,
        lastLoginAt: lastLoginAt?.toString(),
        rewards: rewards.map((r) => r.toEntity()).toList(),
      );
}

@freezed
abstract class DailyCheckInRequestModel with _$DailyCheckInRequestModel {
  const factory DailyCheckInRequestModel({
    required bool ignoreReward,
  }) = _DailyCheckInRequestModel;

  factory DailyCheckInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DailyCheckInRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class DailyCheckInResponseModel with _$DailyCheckInResponseModel {
  const factory DailyCheckInResponseModel({
    required int rewardCredits,
  }) = _DailyCheckInResponseModel;

  factory DailyCheckInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DailyCheckInResponseModelFromJson(json);
}
