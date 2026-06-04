import 'package:freezed_annotation/freezed_annotation.dart';
import 'daily_reward_entity.dart';

part 'daily_login_entity.freezed.dart';

@freezed
abstract class DailyLoginEntity with _$DailyLoginEntity {
  const factory DailyLoginEntity({
    required int currentStreak,
    required String? lastLoginAt,
    required List<DailyRewardEntity> rewards,
  }) = _DailyLoginEntity;
}
