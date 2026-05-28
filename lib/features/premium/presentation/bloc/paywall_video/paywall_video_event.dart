import 'package:freezed_annotation/freezed_annotation.dart';

part 'paywall_video_event.freezed.dart';

@freezed
abstract class PaywallVideoEvent with _$PaywallVideoEvent {
  const factory PaywallVideoEvent.init() = _Init;
  const factory PaywallVideoEvent.selectWeekly() = _SelectWeekly;
  const factory PaywallVideoEvent.selectAnnually() = _SelectAnnually;
  const factory PaywallVideoEvent.purchase() = _Purchase;
  const factory PaywallVideoEvent.toggleReveal() = _ToggleReveal;
}
