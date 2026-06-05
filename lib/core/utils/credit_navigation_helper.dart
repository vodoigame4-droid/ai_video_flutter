import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:core_business/core_business.dart';
import '../injection/injection_container.dart';
import '../services/remote_config_service.dart';
import '../../features/premium/presentation/pages/generation_buy_credits_page.dart';
import '../../features/premium/presentation/pages/generation_iap_page.dart';

class CreditNavigationHelper {
  /// Checks the user's credit balance. If credits < videoGenCost (from Remote Config),
  /// navigates to the appropriate payment screen based on their VIP status and returns true.
  /// Otherwise, returns false.
  static Future<bool> checkInsufficientCreditsAndNavigate(
    BuildContext context, {
    String videoUrl = '',
  }) async {
    try {
      final user = await sl<WatchProfileUseCase>()().first;
      final cost = sl<RemoteConfigService>().videoGenCost;
      if (user.credits < cost) {
        if (context.mounted) {
          if (user.isVip) {
            context.push(
              '${GenerationBuyCreditsPage.path}?videoUrl=${Uri.encodeComponent(videoUrl)}',
            );
          } else {
            context.push(
              '${GenerationIapPage.path}?videoUrl=${Uri.encodeComponent(videoUrl)}',
            );
          }
        }
        return true;
      }
    } catch (e) {
      LogUtils.e('CreditNavigationHelper: Error checking credits balance', error: e);
    }
    return false;
  }

  /// Directly navigates to the appropriate payment screen based on VIP status (e.g., for test shortcuts).
  static Future<void> navigateToPaymentScreen(
    BuildContext context, {
    String videoUrl = '',
  }) async {
    try {
      final user = await sl<WatchProfileUseCase>()().first;
      if (context.mounted) {
        if (user.isVip) {
          context.push(
            '${GenerationBuyCreditsPage.path}?videoUrl=${Uri.encodeComponent(videoUrl)}',
          );
        } else {
          context.push(
            '${GenerationIapPage.path}?videoUrl=${Uri.encodeComponent(videoUrl)}',
          );
        }
      }
    } catch (e) {
      LogUtils.e('CreditNavigationHelper: Error routing to payment screen', error: e);
    }
  }
}
