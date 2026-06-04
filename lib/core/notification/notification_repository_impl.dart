import 'dart:convert';
import 'package:core_business/core_business.dart' as biz;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ai_video_flutter/i18n/strings.g.dart';

class NotificationRepositoryImpl implements biz.NotificationRepository {
  final FirebaseMessaging _firebaseMessaging;
  final SharedPreferences _sharedPreferences;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  
  final BehaviorSubject<Map<String, dynamic>> _notificationDataController =
      BehaviorSubject<Map<String, dynamic>>();

  @override
  Stream<Map<String, dynamic>> get notificationDataStream =>
      _notificationDataController.stream;

  NotificationRepositoryImpl(this._firebaseMessaging, this._sharedPreferences);

  @override
  Future<void> initialize() async {
    await _initForegroundPresentationOptions();
    await _initLocalNotifications();

    // Listen to foreground notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      biz.LogUtils.d(
        'NotificationRepositoryImpl: Foreground message received. '
        'Notification: ${message.notification != null ? "Yes" : "No"}, '
        'Title: "${message.notification?.title}", '
        'Body: "${message.notification?.body}", '
        'Data: ${message.data}',
      );
      _showLocalNotification(message);
    });

    // Listen to notification clicks when app is in foreground/background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      biz.LogUtils.d(
        'NotificationRepositoryImpl: User clicked notification to open app: title="${message.notification?.title}", data=${message.data}',
      );
      _handleNotificationClick(message);
    });

    // Check initial message if app opened from terminated state via notification
    try {
      final message = await _firebaseMessaging.getInitialMessage();
      if (message != null) {
        biz.LogUtils.d(
          'NotificationRepositoryImpl: App opened from terminated state via notification: title="${message.notification?.title}", data=${message.data}',
        );
        _handleNotificationClick(message);
      }
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'NotificationRepositoryImpl: Failed to check initial message',
        error: e,
        stackTrace: stackTrace,
      );
    }

    // Listen to FCM Token refresh to automatically re-subscribe to default topics
    _firebaseMessaging.onTokenRefresh.listen((token) async {
      biz.LogUtils.d('NotificationRepositoryImpl: FCM Token refreshed: $token');
      await _subscribeToDefaultTopics();
    });

    // Check if deviceId is already stored, indicating the app has logged in before.
    // If so, attempt to subscribe to default topics during initialization.
    final deviceId = _sharedPreferences.getString(biz.StorageKeys.deviceId);
    if (deviceId != null && deviceId.isNotEmpty) {
      _subscribeToDefaultTopics();
    }
  }

  void _handleNotificationClick(RemoteMessage message) {
    if (message.data.isNotEmpty) {
      _notificationDataController.add(message.data);
    }
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
      
      await _localNotificationsPlugin.initialize(
        initSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          final payload = response.payload;
          biz.LogUtils.d(
            'NotificationRepositoryImpl: Local notification clicked. Payload: $payload',
          );
          if (payload != null && payload.isNotEmpty) {
            try {
              final Map<String, dynamic> data =
                  Map<String, dynamic>.from(jsonDecode(payload));
              _notificationDataController.add(data);
            } catch (e, stackTrace) {
              biz.LogUtils.e(
                'NotificationRepositoryImpl: Failed to parse local notification payload',
                error: e,
                stackTrace: stackTrace,
              );
            }
          }
        },
      );

      final AndroidNotificationChannel channel = AndroidNotificationChannel(
        'high_importance_channel',
        t.notification.channel_name,
        description: t.notification.channel_description,
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
          NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel',
              t.notification.channel_name,
              channelDescription: t.notification.channel_description,
              importance: Importance.max,
              priority: Priority.high,
              icon: '@mipmap/ic_launcher',
            ),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
          payload: jsonEncode(message.data),
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

  Future<void> _subscribeToDefaultTopics() async {
    try {
      final permissionStatus = await _firebaseMessaging.getNotificationSettings();
      final isGranted =
          permissionStatus.authorizationStatus == AuthorizationStatus.authorized ||
          permissionStatus.authorizationStatus == AuthorizationStatus.provisional;
      
      if (isGranted) {
        biz.LogUtils.d('NotificationRepositoryImpl: Subscribing to default topics...');
        await subscribeToTopic('all');
        final deviceId = _sharedPreferences.getString(biz.StorageKeys.deviceId);
        if (deviceId != null && deviceId.isNotEmpty) {
          await subscribeToTopic(deviceId);
        } else {
          biz.LogUtils.w(
            'NotificationRepositoryImpl: Cannot subscribe to deviceId topic because deviceId is null or empty in SharedPreferences',
          );
        }
      } else {
        biz.LogUtils.w(
          'NotificationRepositoryImpl: Cannot subscribe to default topics because notification permissions are not granted.',
        );
      }
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'NotificationRepositoryImpl: Failed to subscribe to default topics',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
