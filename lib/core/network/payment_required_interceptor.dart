import 'package:dio/dio.dart';
import 'payment_event_broker.dart';

/// Interceptor to globally catch payment/VIP-related errors and trigger a redirect to IAP.
class PaymentRequiredInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final responseData = err.response?.data;
    if (responseData is Map<String, dynamic>) {
      final errorCode = responseData['errorCode']?.toString();
      
      // Check for codes related to VIP limit, out of credits, or VIP-only features:
      // ER00623: Not enough free suggestion, please upgrade to VIP
      // ER00619: Not enough credit
      // ER00618: This feature requires a VIP subscription
      // ER00103: Insufficient funds
      if (errorCode == 'ER00623' ||
          errorCode == 'ER00619' ||
          errorCode == 'ER00618' ||
          errorCode == 'ER00103') {
        PaymentEventBroker.instance.triggerUpgrade();
      }
    }
    super.onError(err, handler);
  }
}
