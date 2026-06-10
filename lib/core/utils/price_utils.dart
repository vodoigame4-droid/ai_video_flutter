import 'package:intl/intl.dart';

/// Utility class for currency and price formatting.
class PriceUtils {
  /// Formats a given [amount] based on the [currencyCode] and locale.
  /// Handles special cases like VND (Vietnamese Dong) which does not have decimals.
  static String formatPrice(double amount, String currencyCode) {
    try {
      final codeUpper = currencyCode.toUpperCase();
      if (codeUpper == 'VND' || codeUpper == 'VND.ANDR' || codeUpper == 'VND_ANDR') {
        final formatter = NumberFormat.currency(
          locale: 'vi_VN',
          symbol: 'đ',
          decimalDigits: 0,
        );
        return formatter.format(amount.round());
      }
      final formatter = NumberFormat.simpleCurrency(name: currencyCode);
      return formatter.format(amount);
    } catch (e) {
      // Fallback formatting if intl package fails
      return '${amount.toStringAsFixed(2)} $currencyCode';
    }
  }
}
