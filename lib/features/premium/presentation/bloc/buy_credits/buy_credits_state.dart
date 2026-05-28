import 'package:freezed_annotation/freezed_annotation.dart';

part 'buy_credits_state.freezed.dart';

@freezed
abstract class BuyCreditsState with _$BuyCreditsState {
  const factory BuyCreditsState.initial() = _Initial;
  const factory BuyCreditsState.loading() = _Loading;
  const factory BuyCreditsState.ready({
    required bool isVideoRevealed,
  }) = _Ready;
  const factory BuyCreditsState.success({
    required String message,
    required bool isVideoRevealed,
  }) = _Success;
  const factory BuyCreditsState.error({
    required String message,
    required bool isVideoRevealed,
  }) = _Error;
}
