import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/resources/resource.dart';
import '../../domain/entities/daily_login_entity.dart';

part 'daily_check_in_state.freezed.dart';

@freezed
abstract class DailyCheckInState with _$DailyCheckInState {
  const factory DailyCheckInState.initial() = _Initial;
  const factory DailyCheckInState.loading() = _Loading;
  const factory DailyCheckInState.ready({
    required DailyLoginEntity dailyLoginEntity,
    required bool isCheckedInToday,
    required Resource<int> checkInStatus,
  }) = _Ready;
  const factory DailyCheckInState.error({required String message}) = _Error;
}
