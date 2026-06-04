abstract class NotificationRepository {
  Future<bool> requestPermission();
  Future<void> subscribeToTopic(String topic);
  Future<void> unsubscribeFromTopic(String topic);

  // Stream of notification data payloads when clicked by the user
  Stream<Map<String, dynamic>> get notificationDataStream;

  // Initialize listeners and local notification plugins
  Future<void> initialize();
}
