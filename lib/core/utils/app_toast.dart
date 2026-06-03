import 'dart:async';
import 'package:flutter/material.dart';
import '../navigation/app_router.dart';

class AppToast {
  static OverlayEntry? _currentEntry;
  static Timer? _timer;

  /// Hiển thị thông báo Thành Công (Màu xanh lá)
  static void showSuccess(String message) {
    _showOverlay(message, _ToastType.success);
  }

  /// Hiển thị thông báo Lỗi (Màu đỏ)
  static void showError(String message) {
    _showOverlay(message, _ToastType.error);
  }

  /// Hiển thị thông báo Cảnh báo / Nhắc nhở (Màu vàng)
  static void showWarning(String message) {
    _showOverlay(message, _ToastType.warning);
  }

  static void _showOverlay(String message, _ToastType type) {
    // Thu hồi và xóa ngay Toast đang tồn tại (tránh dội nhau cục súc)
    _currentEntry?.remove();
    _currentEntry = null;
    _timer?.cancel();

    final overlayState = rootNavigatorKey.currentState?.overlay;
    if (overlayState == null) return;

    Color bgColor;
    Color borderColor;
    IconData icon;
    Color iconColor;

    switch (type) {
      case _ToastType.success:
        bgColor = const Color(0xFF1E2F23); // Xanh rêu tối
        borderColor = const Color(0xFF4CAF50);
        iconColor = const Color(0xFF4CAF50);
        icon = Icons.check_circle_rounded;
        break;
      case _ToastType.error:
        bgColor = const Color(0xFF331A1A); // Đỏ thẫm
        borderColor = const Color(0xFFE53935);
        iconColor = const Color(0xFFEF5350);
        icon = Icons.cancel_rounded;
        break;
      case _ToastType.warning:
        bgColor = const Color(0xFF332D1A); // Vàng đất
        borderColor = const Color(0xFFFF9800);
        iconColor = const Color(0xFFFFB74D);
        icon = Icons.info_rounded;
        break;
    }

    // Animation trượt từ trên xuống kèm mờ ảo
    _currentEntry = OverlayEntry(
      builder: (context) {
        // Sử dụng MediaQuery để lấy phần an toàn phía trên (tai thỏ/hole punch)
        final topPadding = MediaQuery.of(context).padding.top;
        
        return Positioned(
          top: topPadding + 16, // Cách mép status bar 16 pixel
          left: 16,
          right: 16,
          child: Material(
            color: Colors.transparent,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return Opacity(
                  // Yêu cầu bắt buộc của Flutter là Opacity phải từ 0-1,
                  // Tự động chặn giới hạn để chống crash do curve `easeOutBack` làm lố (overshoot) lên 1.1
                  opacity: value.clamp(0.0, 1.0),
                  child: Transform.translate(
                    // Trượt từ âm (trên) hướng xuống vị trí cân bằng
                    offset: Offset(0, (1 - value) * -40),
                    child: child,
                  ),
                );
              },
              child: Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.up,
                onDismissed: (direction) {
                  _currentEntry?.remove();
                  _currentEntry = null;
                  _timer?.cancel();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: borderColor.withValues(alpha: 0.4), width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.4),
                        offset: const Offset(0, 8),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(icon, color: iconColor, size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    overlayState.insert(_currentEntry!);

    // Tự tàn lụi sau 3 giây
    _timer = Timer(const Duration(seconds: 3), () {
      _currentEntry?.remove();
      _currentEntry = null;
    });
  }
}

enum _ToastType { success, error, warning }
