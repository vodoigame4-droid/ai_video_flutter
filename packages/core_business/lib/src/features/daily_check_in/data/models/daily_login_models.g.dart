// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_login_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyRewardModel _$DailyRewardModelFromJson(Map<String, dynamic> json) =>
    _DailyRewardModel(
      id: json['id'] as String,
      streakDay: (json['streakDay'] as num).toInt(),
      rewardCredits: (json['rewardCredits'] as num).toInt(),
      isSpecial: json['isSpecial'] as bool,
    );

Map<String, dynamic> _$DailyRewardModelToJson(_DailyRewardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'streakDay': instance.streakDay,
      'rewardCredits': instance.rewardCredits,
      'isSpecial': instance.isSpecial,
    };

_DailyLoginResponseModel _$DailyLoginResponseModelFromJson(
  Map<String, dynamic> json,
) => _DailyLoginResponseModel(
  currentStreak: (json['currentStreak'] as num).toInt(),
  lastLoginAt: json['lastLoginAt'],
  rewards: (json['reward'] as List<dynamic>)
      .map((e) => DailyRewardModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DailyLoginResponseModelToJson(
  _DailyLoginResponseModel instance,
) => <String, dynamic>{
  'currentStreak': instance.currentStreak,
  'lastLoginAt': instance.lastLoginAt,
  'reward': instance.rewards,
};

_DailyCheckInRequestModel _$DailyCheckInRequestModelFromJson(
  Map<String, dynamic> json,
) => _DailyCheckInRequestModel(ignoreReward: json['ignoreReward'] as bool);

Map<String, dynamic> _$DailyCheckInRequestModelToJson(
  _DailyCheckInRequestModel instance,
) => <String, dynamic>{'ignoreReward': instance.ignoreReward};

_DailyCheckInResponseModel _$DailyCheckInResponseModelFromJson(
  Map<String, dynamic> json,
) => _DailyCheckInResponseModel(
  rewardCredits: (json['rewardCredits'] as num).toInt(),
);

Map<String, dynamic> _$DailyCheckInResponseModelToJson(
  _DailyCheckInResponseModel instance,
) => <String, dynamic>{'rewardCredits': instance.rewardCredits};
