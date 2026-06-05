import 'dart:async';
import 'dart:convert';
import 'package:core_business/core_business.dart' as biz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:ai_video_flutter/i18n/strings.g.dart';

class LocalNotificationService {
  final SharedPreferences _sharedPreferences;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final StreamController<Map<String, dynamic>> _onClickController =
      StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get onClickStream => _onClickController.stream;

  LocalNotificationService(this._sharedPreferences);

  static const String _checkInNotificationKey = 'checkin_notification_enabled';
  static const int _dailyCheckInNotificationId = 8888;

  Future<void> initialize() async {
    biz.LogUtils.d('LocalNotificationService: Initializing...');
    await _initTimezones();
    await _initLocalNotifications();

    if (isCheckInNotificationEnabled()) {
      await scheduleDailyCheckInNotification();
    }
  }

  Future<void> _initTimezones() async {
    try {
      tz.initializeTimeZones();
      final String timeZoneName = (await FlutterTimezone.getLocalTimezone()).identifier;
      tz.setLocalLocation(tz.getLocation(timeZoneName));
      biz.LogUtils.d('LocalNotificationService: Timezone initialized to $timeZoneName');
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'LocalNotificationService: Failed to initialize timezone, falling back to UTC',
        error: e,
        stackTrace: stackTrace,
      );
      try {
        tz.setLocalLocation(tz.UTC);
      } catch (_) {}
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
            'LocalNotificationService: Notification clicked. Payload: $payload',
          );
          if (payload != null && payload.isNotEmpty) {
            try {
              final Map<String, dynamic> data =
                  Map<String, dynamic>.from(jsonDecode(payload));
              _onClickController.add(data);
            } catch (e, stackTrace) {
              biz.LogUtils.e(
                'LocalNotificationService: Failed to parse local notification payload',
                error: e,
                stackTrace: stackTrace,
              );
            }
          }
        },
      );

      final AndroidNotificationChannel channel = AndroidNotificationChannel(
        'daily_checkin_channel',
        t.notification.channel_name,
        description: t.notification.channel_description,
        importance: Importance.max,
      );

      final androidPlugin = _localNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      if (androidPlugin != null) {
        await androidPlugin.createNotificationChannel(channel);
      }

      biz.LogUtils.d('LocalNotificationService: Local notifications initialized successfully.');
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'LocalNotificationService: Failed to initialize local notifications',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  bool isCheckInNotificationEnabled() {
    return _sharedPreferences.getBool(_checkInNotificationKey) ?? true;
  }

  Future<void> setCheckInNotificationEnabled(bool enabled) async {
    await _sharedPreferences.setBool(_checkInNotificationKey, enabled);
  }

  Future<void> cancelDailyCheckInNotification() async {
    biz.LogUtils.d('LocalNotificationService: Canceling daily check-in notification');
    try {
      await _localNotificationsPlugin.cancel(id: _dailyCheckInNotificationId);
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'LocalNotificationService: Failed to cancel daily check-in notification',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> scheduleDailyCheckInNotification() async {
    biz.LogUtils.d('LocalNotificationService: Scheduling daily check-in notification at 8:00 AM');
    try {
      // Cancel first to prevent duplicates
      await _localNotificationsPlugin.cancel(id: _dailyCheckInNotificationId);

      final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
      tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day,
        8, // 8 AM
        0,
      );

      if (scheduledDate.isBefore(now)) {
        scheduledDate = scheduledDate.add(const Duration(days: 1));
      }

      biz.LogUtils.d('LocalNotificationService: Scheduled date-time: $scheduledDate');

      await _localNotificationsPlugin.zonedSchedule(
        id: _dailyCheckInNotificationId,
        title: t.notification.checkin_title,
        body: t.notification.checkin_body,
        scheduledDate: scheduledDate,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            'daily_checkin_channel',
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
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: jsonEncode({'type': 'checkin'}),
      );
      biz.LogUtils.d('LocalNotificationService: Daily check-in notification scheduled successfully');
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'LocalNotificationService: Failed to schedule daily check-in notification',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> triggerTestCheckInNotification() async {
    biz.LogUtils.d('LocalNotificationService: Triggering test check-in notification immediately');
    try {
      await _localNotificationsPlugin.show(
        id: _dailyCheckInNotificationId + 1,
        title: '${t.notification.checkin_title} (Test)',
        body: t.notification.checkin_body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            'daily_checkin_channel',
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
        payload: jsonEncode({'type': 'checkin_test'}),
      );
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'LocalNotificationService: Failed to show test notification',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> showLocalNotification({
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    biz.LogUtils.d('LocalNotificationService: Displaying local notification: title="$title"');
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
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'LocalNotificationService: Failed to display local notification',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
