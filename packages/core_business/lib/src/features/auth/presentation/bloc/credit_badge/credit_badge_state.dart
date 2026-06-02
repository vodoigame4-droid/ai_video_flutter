import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_badge_state.freezed.dart';

@freezed
abstract class CreditBadgeState with _$CreditBadgeState {
  const factory CreditBadgeState.initial() = _Initial;
  const factory CreditBadgeState.loading() = _Loading;
  const factory CreditBadgeState.ready({
    required bool isPro,
    required int credits,
  }) = _Ready;
  const factory CreditBadgeState.error(String message) = _Error;
}
