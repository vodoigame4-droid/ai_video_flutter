import 'dart:async';
import 'dart:convert';
import 'dart:io';
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


    // Listen to notification clicks when app is in foreground/background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      biz.LogUtils.d(
        'NotificationRepositoryImpl: User clicked notification to open app: title="${message.notification?.title}", data=${message.data}',
      );
      _handleNotificationClick(message);
    });

    // Listen to FCM Token refresh to automatically re-subscribe to default topics
    _firebaseMessaging.onTokenRefresh.listen(
      (token) async {
        biz.LogUtils.d('NotificationRepositoryImpl: FCM Token refreshed: $token');
        if (Platform.isIOS) {
          final apnsToken = await _firebaseMessaging.getAPNSToken();
          biz.LogUtils.d('NotificationRepositoryImpl: APNS Token: $apnsToken');
        }
        await _subscribeToDefaultTopics();
      },
      onError: (error, stackTrace) {
        biz.LogUtils.e(
          'NotificationRepositoryImpl: Error in FCM Token refresh stream',
          error: error,
          stackTrace: stackTrace,
        );
      },
    );

    // Check if deviceId is already stored, indicating the app has logged in before.
    // If so, attempt to subscribe to default topics during initialization.
    final deviceId = _sharedPreferences.getString(biz.StorageKeys.deviceId);
    if (deviceId != null && deviceId.isNotEmpty) {
      () async {
        if (Platform.isIOS) {
          final apnsToken = await _firebaseMessaging.getAPNSToken();
          if (apnsToken == null) {
            biz.LogUtils.d(
              'NotificationRepositoryImpl: APNS token not ready on launch. '
              'Topic subscription will be deferred until APNS is registered.',
            );
            return;
          } else {
            biz.LogUtils.d('NotificationRepositoryImpl: APNS Token ready on launch: $apnsToken');
          }
        }
        await _subscribeToDefaultTopics();
      }();
    }

    // Check initial message asynchronously so it doesn't block the rest of the flow
    _checkInitialMessage();
  }

  void _handleNotificationClick(RemoteMessage message) {
    if (message.data.isNotEmpty) {
      _notificationDataController.add(message.data);
    }
  }

  Future<void> _checkInitialMessage() async {
    try {
      final message = await _firebaseMessaging.getInitialMessage().timeout(
        const Duration(seconds: 3),
      );
      if (message != null) {
        biz.LogUtils.d(
          'NotificationRepositoryImpl: App opened from terminated state via notification: title="${message.notification?.title}", data=${message.data}',
        );
        _handleNotificationClick(message);
      }
    } on TimeoutException {
      biz.LogUtils.d(
        'NotificationRepositoryImpl: getInitialMessage timed out. '
        'This is normal when the app is not launched from a notification click.',
      );
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'NotificationRepositoryImpl: Failed to check initial message',
        error: e,
        stackTrace: stackTrace,
      );
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
        settings: initSettings,
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
      () async {
        try {
          if (Platform.isIOS) {
            final apnsToken = await _firebaseMessaging.getAPNSToken();
            if (apnsToken == null) {
              biz.LogUtils.d(
                'NotificationRepositoryImpl: APNS token is not ready yet on launch. '
                'FCM token will be automatically fetched and registered via onTokenRefresh once APNS registration completes.',
              );
              return;
            }
          }
          final fcmToken = await _firebaseMessaging.getToken();
          biz.LogUtils.d('NotificationRepositoryImpl: FCM Token: $fcmToken');
        } catch (e, stackTrace) {
          biz.LogUtils.e(
            'NotificationRepositoryImpl: Failed to get FCM Token',
            error: e,
            stackTrace: stackTrace,
          );
        }
      }();

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

  @override
  Future<void> showLocalNotification({
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    biz.LogUtils.d(
      'NotificationRepositoryImpl: Displaying local notification: title="$title", body="$body"',
    );
    try {
      await _localNotificationsPlugin.show(
        id: (title + body).hashCode,
        title: title,
        body: body,
        notificationDetails: NotificationDetails(
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
            presentBanner: true,
            presentList: true,
          ),
        ),
        payload: data != null ? jsonEncode(data) : null,
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
