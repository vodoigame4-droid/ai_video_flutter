import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer_event.freezed.dart';

@freezed
abstract class DeveloperEvent with _$DeveloperEvent {
  const factory DeveloperEvent.tap() = _Tap;
  const factory DeveloperEvent.reset() = _Reset;
}
