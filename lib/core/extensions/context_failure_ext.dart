import 'package:flutter/material.dart';
import 'package:core_business/core_business.dart';
import '../errors/backend_error_handler.dart';
import '../utils/app_toast.dart';

extension ContextFailureX on BuildContext {
  /// Tự động dịch và hiển thị Toast lỗi từ đối tượng Failure.
  /// [onBusinessError] cho phép màn hình tự handle các mã lỗi đặc thù của nó.
  /// Nếu callback [onBusinessError] trả về `true`, extension sẽ không hiện Toast nữa.
  void handleFailure(Failure failure, {bool Function(String code)? onBusinessError}) {
    final errorCode = failure.toErrorCodeOrMessage();

    // 1. Bỏ qua các lỗi hệ thống/VIP đã được PaymentRequiredInterceptor tự động điều hướng sang trang IAP
    if (errorCode == 'ER00623' ||
        errorCode == 'ER00619' ||
        errorCode == 'ER00618' ||
        errorCode == 'ER00103') {
      return;
    }

    // 2. Cho phép màn hình tự handle lỗi đặc thù (như báo đỏ textfield)
    if (onBusinessError != null) {
      final isHandledByScreen = onBusinessError(errorCode);
      if (isHandledByScreen) return; // Màn hình đã tự xử lý xong UI, không Toast nữa
    }

    // 3. Mặc định: Dịch mã lỗi và hiển thị Toast đỏ thông báo lỗi chung
    final errorMessage = BackendErrorHelper.getErrorMessage(this, errorCode);
    AppToast.showError(errorMessage);
  }
}
