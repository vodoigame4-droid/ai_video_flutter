import 'package:freezed_annotation/freezed_annotation.dart';

part 'iap_state.freezed.dart';

@freezed
abstract class IapState with _$IapState {
  const factory IapState.initial() = _Initial;
  const factory IapState.loading() = _Loading;
  const factory IapState.ready({
    required bool isWeeklySelected,
    required bool isVideoRevealed,
  }) = _Ready;
  const factory IapState.success({
    required String message,
    required bool isWeeklySelected,
    required bool isVideoRevealed,
  }) = _Success;
  const factory IapState.error({
    required String message,
    required bool isWeeklySelected,
    required bool isVideoRevealed,
  }) = _Error;
}
