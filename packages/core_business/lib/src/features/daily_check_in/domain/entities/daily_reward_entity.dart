import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_reward_entity.freezed.dart';

@freezed
abstract class DailyRewardEntity with _$DailyRewardEntity {
  const factory DailyRewardEntity({
    required String id,
    required int streakDay,
    required int rewardCredits,
    required bool isSpecial,
  }) = _DailyRewardEntity;
}
