import 'package:freezed_annotation/freezed_annotation.dart';

part 'paywall_video_state.freezed.dart';

@freezed
abstract class PaywallVideoState with _$PaywallVideoState {
  const factory PaywallVideoState.initial() = _Initial;
  const factory PaywallVideoState.loading() = _Loading;
  const factory PaywallVideoState.ready({
    required bool isWeeklySelected,
    required bool isVideoRevealed,
  }) = _Ready;
  const factory PaywallVideoState.success({
    required String message,
    required bool isWeeklySelected,
    required bool isVideoRevealed,
  }) = _Success;
  const factory PaywallVideoState.error({
    required String message,
    required bool isWeeklySelected,
    required bool isVideoRevealed,
  }) = _Error;
}
