abstract class NotificationRepository {
  Future<bool> requestPermission();
  Future<void> subscribeToTopic(String topic);
  Future<void> unsubscribeFromTopic(String topic);

  // Stream of notification data payloads when clicked by the user
  Stream<Map<String, dynamic>> get notificationDataStream;

  // Initialize listeners and local notification plugins
  Future<void> initialize();

  // Show a local notification banner
  Future<void> showLocalNotification({
    required String title,
    required String body,
    Map<String, dynamic>? data,
  });

  // Daily check-in notification methods
  Future<void> scheduleDailyCheckInNotification();
  Future<void> cancelDailyCheckInNotification();
  bool isCheckInNotificationEnabled();
  Future<void> setCheckInNotificationEnabled(bool enabled);
  Future<void> triggerTestCheckInNotification();
}
