import 'package:core_business/core_business.dart' as biz;
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationRepositoryImpl implements biz.NotificationRepository {
  final FirebaseMessaging _firebaseMessaging;

  NotificationRepositoryImpl(this._firebaseMessaging);

  @override
  Future<bool> requestPermission() async {
    try {
      final settings = await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      
      final isGranted = settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional;
          
      biz.LogUtils.d('NotificationRepositoryImpl: Permission status: ${settings.authorizationStatus}');
      return isGranted;
    } catch (e, stackTrace) {
      biz.LogUtils.e('NotificationRepositoryImpl: Request permission failed', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  @override
  Future<void> subscribeToTopic(String topic) async {
    try {
      biz.LogUtils.d('NotificationRepositoryImpl: Subscribing to topic: $topic');
      await _firebaseMessaging.subscribeToTopic(topic);
    } catch (e, stackTrace) {
      biz.LogUtils.e('NotificationRepositoryImpl: Subscribe to topic $topic failed', error: e, stackTrace: stackTrace);
    }
  }

  @override
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      biz.LogUtils.d('NotificationRepositoryImpl: Unsubscribing from topic: $topic');
      await _firebaseMessaging.unsubscribeFromTopic(topic);
    } catch (e, stackTrace) {
      biz.LogUtils.e('NotificationRepositoryImpl: Unsubscribe from topic $topic failed', error: e, stackTrace: stackTrace);
    }
  }
}
