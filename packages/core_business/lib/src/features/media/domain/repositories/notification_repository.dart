abstract class NotificationRepository {
  Future<bool> requestPermission();
  Future<void> subscribeToTopic(String topic);
  Future<void> unsubscribeFromTopic(String topic);
}
