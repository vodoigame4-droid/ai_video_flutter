import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer_state.freezed.dart';

@freezed
abstract class DeveloperState with _$DeveloperState {
  const factory DeveloperState.initial() = _Initial;
  const factory DeveloperState.loading() = _Loading;
  const factory DeveloperState.update({
    required int tapCount,
    required bool navigateToDebug,
  }) = _Update;
}
