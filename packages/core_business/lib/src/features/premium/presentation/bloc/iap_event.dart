import 'package:freezed_annotation/freezed_annotation.dart';

part 'iap_event.freezed.dart';

@freezed
abstract class IapEvent with _$IapEvent {
  const factory IapEvent.init() = _Init;
  const factory IapEvent.selectWeekly() = _SelectWeekly;
  const factory IapEvent.selectAnnually() = _SelectAnnually;
  const factory IapEvent.toggleReveal() = _ToggleReveal;
  const factory IapEvent.purchase() = _Purchase;
  const factory IapEvent.purchaseCredits({
    required int credits,
    required String priceText,
  }) = _PurchaseCredits;
}
