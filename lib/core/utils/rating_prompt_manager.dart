import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:core_business/core_business.dart';
import '../injection/injection_container.dart';
import '../widgets/rate_app_dialog.dart';

class RatingPromptManager {
  static const String _keyCountShowRating = 'countShowRating';
  static const String _keyHasRated = 'rating_has_rated';
  static const String _keyGeneratedButUnviewed = 'generated_but_unviewed_video_ids';

  /// Check if the video is newly generated and has not been viewed yet.
  /// If so, remove it from the list and return true.
  static Future<bool> checkAndRemovePendingVideo(String videoId) async {
    try {
      final prefs = sl<SharedPreferences>();
      final list = prefs.getStringList(_keyGeneratedButUnviewed) ?? [];
      LogUtils.d('RatingPromptManager: Checking videoId="$videoId" against pending list: $list');
      if (list.contains(videoId)) {
        list.remove(videoId);
        await prefs.setStringList(_keyGeneratedButUnviewed, list);
        LogUtils.d('RatingPromptManager: Video $videoId was pending. Removed. Remaining: $list');
        return true;
      }
    } catch (e, stack) {
      LogUtils.e('RatingPromptManager: Error in checkAndRemovePendingVideo', error: e, stackTrace: stack);
    }
    return false;
  }

  /// Check and prompt rating dialog if conditions are met.
  /// This should be called when video generation is completed.
  static Future<void> checkAndPromptRating(BuildContext context) async {
    try {
      final prefs = sl<SharedPreferences>();

      // 1. Get user rating status from repository
      bool isRated = false;
      try {
        LogUtils.d('RatingPromptManager: Fetching user profile from WatchProfileUseCase...');
        final user = await sl<WatchProfileUseCase>()().first.timeout(const Duration(milliseconds: 500));
        isRated = user.isRated;
        LogUtils.d('RatingPromptManager: Profile fetched. user.isRated=$isRated');
      } catch (e) {
        LogUtils.w('RatingPromptManager: Failed to get isRated from WatchProfileUseCase, falling back to SharedPreferences: $e');
        isRated = prefs.getBool(_keyHasRated) ?? false;
        LogUtils.d('RatingPromptManager: Fallback checked. local isRated=$isRated');
      }

      if (isRated) {
        LogUtils.d('RatingPromptManager: User has already rated. Will not prompt.');
        return;
      }

      // 2. Increment countShowRating
      // Default to 2 so the first video completion makes it 3 and triggers prompt immediately
      final count = prefs.getInt(_keyCountShowRating) ?? 2;
      final newCount = count + 1;
      await prefs.setInt(_keyCountShowRating, newCount);
      LogUtils.d('RatingPromptManager: countShowRating: current=$count, new=$newCount');

      // 3. Check if count reaches 3
      if (newCount >= 3) {
        LogUtils.d('RatingPromptManager: countShowRating reached $newCount >= 3. Resetting count to 0 and triggering showRateAppDialog.');
        await prefs.setInt(_keyCountShowRating, 0); // Reset
        if (context.mounted) {
          LogUtils.d('RatingPromptManager: Showing RateAppDialog now.');
          showRateAppDialog(context);
        } else {
          LogUtils.w('RatingPromptManager: Context not mounted when trying to show dialog.');
        }
      } else {
        LogUtils.d('RatingPromptManager: countShowRating ($newCount) < 3. Will not show dialog yet.');
      }
    } catch (e, stack) {
      LogUtils.e('RatingPromptManager: Error in checkAndPromptRating', error: e, stackTrace: stack);
    }
  }

  /// Mark local status as rated.
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
