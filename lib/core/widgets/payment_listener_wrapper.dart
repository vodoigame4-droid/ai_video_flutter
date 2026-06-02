import 'dart:async';
import 'package:flutter/material.dart';
import '../navigation/app_router.dart';
import '../network/payment_event_broker.dart';
import '../../features/premium/presentation/pages/iap_page.dart';

/// A wrapper widget that listens to global payment events (such as VIP limit errors)
/// and programmatically navigates to the IAP (VIP upgrade) screen.
class PaymentListenerWrapper extends StatefulWidget {
  final Widget child;

  const PaymentListenerWrapper({super.key, required this.child});

  @override
  State<PaymentListenerWrapper> createState() => _PaymentListenerWrapperState();
}

class _PaymentListenerWrapperState extends State<PaymentListenerWrapper> {
  StreamSubscription<PaymentEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = PaymentEventBroker.instance.stream.listen((event) {
      if (event == PaymentEvent.vipUpgrade) {
        final currentPath = appRouter.routerDelegate.currentConfiguration.uri.toString();
        // Guard against multiple concurrent pushes if already on the IAP page
        if (!currentPath.contains(IapPage.path)) {
          appRouter.push(IapPage.path);
        }
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
