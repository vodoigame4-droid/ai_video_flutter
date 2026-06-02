import 'dart:async';

enum PaymentEvent { vipUpgrade }

class PaymentEventBroker {
  PaymentEventBroker._();
  static final instance = PaymentEventBroker._();

  final _controller = StreamController<PaymentEvent>.broadcast();
  Stream<PaymentEvent> get stream => _controller.stream;

  void triggerUpgrade() {
    _controller.add(PaymentEvent.vipUpgrade);
  }
}
