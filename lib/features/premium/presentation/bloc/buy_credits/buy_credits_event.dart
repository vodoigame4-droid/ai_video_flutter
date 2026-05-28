import 'package:freezed_annotation/freezed_annotation.dart';

part 'buy_credits_event.freezed.dart';

@freezed
abstract class BuyCreditsEvent with _$BuyCreditsEvent {
  const factory BuyCreditsEvent.init() = _Init;
  const factory BuyCreditsEvent.purchaseCredits({
    required int credits,
    required String priceText,
  }) = _PurchaseCredits;
  const factory BuyCreditsEvent.toggleReveal() = _ToggleReveal;
}
