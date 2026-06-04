import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_check_in_event.freezed.dart';

@freezed
abstract class DailyCheckInEvent with _$DailyCheckInEvent {
  const factory DailyCheckInEvent.init() = _Init;
  const factory DailyCheckInEvent.checkIn({@Default(false) bool ignoreReward}) = _CheckIn;
}
