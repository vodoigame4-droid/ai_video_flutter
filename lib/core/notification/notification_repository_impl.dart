import 'dart:io';
import 'package:core_business/core_business.dart' as biz;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationRepositoryImpl implements biz.NotificationRepository {
  final FirebaseMessaging _firebaseMessaging;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationRepositoryImpl(this._firebaseMessaging) {
    _initForegroundPresentationOptions();
    _initLocalNotifications();
  }

  Future<void> _initForegroundPresentationOptions() async {
    try {
      await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      biz.LogUtils.d(
        'NotificationRepositoryImpl: Set foreground options successfully.',
      );
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'NotificationRepositoryImpl: Failed to set foreground presentation options',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _initLocalNotifications() async {
    try {
      const AndroidInitializationSettings androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const DarwinInitializationSettings iosSettings =
          DarwinInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
          );
      const InitializationSettings initSettings = InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      );
      await _localNotificationsPlugin.initialize(initSettings);

      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'high_importance_channel',
        'High Importance Notifications',
        description: 'This channel is used for important notifications.',
        importance: Importance.max,
      );

      final androidPlugin = _localNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      if (androidPlugin != null) {
        await androidPlugin.createNotificationChannel(channel);
      }

      // Print FCM Token for debugging asynchronously so it doesn't block listener initialization
      _firebaseMessaging
          .getToken()
          .then((fcmToken) {
            biz.LogUtils.d('NotificationRepositoryImpl: FCM Token: $fcmToken');
          })
          .catchError((e) {
            biz.LogUtils.e(
              'NotificationRepositoryImpl: Failed to get FCM Token (Normal on simulators without APNs)',
              error: e,
            );
          });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        biz.LogUtils.d(
          'NotificationRepositoryImpl: User clicked notification to open app: title="${message.notification?.title}", data=${message.data}',
        );
      });

      // Check initial message if app opened from terminated state via notification
      _firebaseMessaging.getInitialMessage().then((message) {
        if (message != null) {
          biz.LogUtils.d(
            'NotificationRepositoryImpl: App opened from terminated state via notification: title="${message.notification?.title}", data=${message.data}',
          );
        }
      });

      biz.LogUtils.d(
        'NotificationRepositoryImpl: Local notifications initialized.',
      );
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'NotificationRepositoryImpl: Failed to initialize local notifications',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  void _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification != null) {
      biz.LogUtils.d(
        'NotificationRepositoryImpl: Displaying local notification: title="${notification.title}", body="${notification.body}"',
      );
      try {
        await _localNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel',
              'High Importance Notifications',
              channelDescription:
                  'This channel is used for important notifications.',
              importance: Importance.max,
              priority: Priority.high,
              icon: '@mipmap/ic_launcher',
            ),
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
        );
        biz.LogUtils.d(
          'NotificationRepositoryImpl: Local notification displayed successfully.',
        );
      } catch (e, stackTrace) {
        biz.LogUtils.e(
          'NotificationRepositoryImpl: Failed to show local notification',
          error: e,
          stackTrace: stackTrace,
        );
      }
    } else {
      biz.LogUtils.d(
        'NotificationRepositoryImpl: Message notification payload is null. Skipping local notification display.',
      );
    }
  }

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

      final isGranted =
          settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional;

      biz.LogUtils.d(
        'NotificationRepositoryImpl: Permission status: ${settings.authorizationStatus}',
      );
      return isGranted;
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'NotificationRepositoryImpl: Request permission failed',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  @override
  Future<void> subscribeToTopic(String topic) async {
    try {
      biz.LogUtils.d(
        'NotificationRepositoryImpl: Subscribing to topic: $topic',
      );
      await _firebaseMessaging.subscribeToTopic(topic);
      biz.LogUtils.d(
        'NotificationRepositoryImpl: Successfully subscribed to topic: $topic',
      );
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'NotificationRepositoryImpl: Subscribe to topic $topic failed',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      biz.LogUtils.d(
        'NotificationRepositoryImpl: Unsubscribing from topic: $topic',
      );
      await _firebaseMessaging.unsubscribeFromTopic(topic);
      biz.LogUtils.d(
        'NotificationRepositoryImpl: Successfully unsubscribed from topic: $topic',
      );
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'NotificationRepositoryImpl: Unsubscribe from topic $topic failed',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
