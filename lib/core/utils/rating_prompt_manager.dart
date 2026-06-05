import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:core_business/core_business.dart';
import '../injection/injection_container.dart';
import '../navigation/app_router.dart';
import '../widgets/rate_app_dialog.dart';

class RatingPromptManager {
  static const String _keyHasRated = 'rating_has_rated';
  static const String _keyActionCount = 'rating_action_count';
  static const String _keyLastPromptedTime = 'rating_last_prompted_time';

  // Config parameters
  static const int _actionThreshold = 1;
  static const Duration _cooldownDuration = Duration(hours: 4);

  /// Increment action count in background.
  static Future<void> incrementActionCount() async {
    try {
      final prefs = sl<SharedPreferences>();
      final currentCount = prefs.getInt(_keyActionCount) ?? 0;
      await prefs.setInt(_keyActionCount, currentCount + 1);
      LogUtils.d('RatingPromptManager: Incremented action count to ${currentCount + 1}');
    } catch (e, stack) {
      LogUtils.e('RatingPromptManager: Failed to increment action count', error: e, stackTrace: stack);
    }
  }

  /// Check if rating dialog should be prompted.
  static Future<bool> shouldShowPrompt() async {
    try {
      final prefs = sl<SharedPreferences>();

      // 1. Check if user already rated
      final hasRated = prefs.getBool(_keyHasRated) ?? false;
      if (hasRated) {
        LogUtils.d('RatingPromptManager: User has already rated. Will not prompt.');
        return false;
      }

      // 2. Check action counter
      final actionCount = prefs.getInt(_keyActionCount) ?? 0;
      if (actionCount < _actionThreshold) {
        LogUtils.d('RatingPromptManager: Action count ($actionCount) < threshold ($_actionThreshold). Will not prompt.');
        return false;
      }

      // 3. Check cooldown
      final lastPromptedTimeMs = prefs.getInt(_keyLastPromptedTime) ?? 0;
      if (lastPromptedTimeMs > 0) {
        final lastPromptedTime = DateTime.fromMillisecondsSinceEpoch(lastPromptedTimeMs);
        final timePassed = DateTime.now().difference(lastPromptedTime);
        if (timePassed < _cooldownDuration) {
          LogUtils.d('RatingPromptManager: Cooldown not met. Last prompted: $lastPromptedTime (${timePassed.inMinutes}m ago). Cooldown: ${_cooldownDuration.inHours}h. Will not prompt.');
          return false;
        }
      }

      return true;
    } catch (e, stack) {
      LogUtils.e('RatingPromptManager: Error checking shouldShowPrompt', error: e, stackTrace: stack);
      return false;
    }
  }

  /// Record a key action (e.g. video generated/viewed) and automatically trigger the prompt if conditions are met.
  static Future<void> recordActionAndPromptIfNeeded() async {
    await incrementActionCount();
    final shouldShow = await shouldShowPrompt();
    if (shouldShow) {
      // Update last prompted time & reset action counter first (asynchronous operations)
      try {
        final prefs = sl<SharedPreferences>();
        await prefs.setInt(_keyLastPromptedTime, DateTime.now().millisecondsSinceEpoch);
        await prefs.setInt(_keyActionCount, 0);
      } catch (e, stack) {
        LogUtils.e('RatingPromptManager: Failed to save status on prompt show', error: e, stackTrace: stack);
      }

      // Fetch context and show dialog (no async gap between fetching and using context)
      final BuildContext? context = rootNavigatorKey.currentContext;
      if (context != null && context.mounted) {
        LogUtils.d('RatingPromptManager: Conditions met. Showing RateAppDialog.');
        showRateAppDialog(context);
      } else {
        LogUtils.w('RatingPromptManager: Root context is null or unmounted. Cannot show dialog.');
      }
    }
  }

  /// Mark the user as having completed rating.
  static Future<void> markAsRated() async {
    try {
      final prefs = sl<SharedPreferences>();
      await prefs.setBool(_keyHasRated, true);
      LogUtils.d('RatingPromptManager: Marked as rated.');
    } catch (e, stack) {
      LogUtils.e('RatingPromptManager: Failed to mark as rated', error: e, stackTrace: stack);
    }
  }
}
