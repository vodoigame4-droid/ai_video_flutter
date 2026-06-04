import 'dart:async';
import 'package:flutter/material.dart';
import 'package:core_business/core_business.dart' as biz;
import '../injection/injection_container.dart';
import '../navigation/app_router.dart';

class NotificationListenerWrapper extends StatefulWidget {
  final Widget child;

  const NotificationListenerWrapper({super.key, required this.child});

  @override
  State<NotificationListenerWrapper> createState() => _NotificationListenerWrapperState();
}

class _NotificationListenerWrapperState extends State<NotificationListenerWrapper> {
  late final StreamSubscription<Map<String, dynamic>> _notificationSubscription;
  Map<String, dynamic>? _pendingPayload;

  @override
  void initState() {
    super.initState();
    // Listen to notification clicks
    _notificationSubscription = sl<biz.NotificationRepository>()
        .notificationDataStream
        .listen(_onNotificationDataReceived);

    // Listen to routing changes to process pending notifications
    appRouter.routerDelegate.addListener(_onRouteChanged);
  }

  @override
  void dispose() {
    _notificationSubscription.cancel();
    appRouter.routerDelegate.removeListener(_onRouteChanged);
    super.dispose();
  }

  void _onNotificationDataReceived(Map<String, dynamic> data) {
    biz.LogUtils.d('NotificationListenerWrapper: Received notification click event: $data');
    if (!mounted) return;

    final location = appRouter.routerDelegate.currentConfiguration.uri.toString();
    if (_isAppInitializing(location)) {
      biz.LogUtils.d('NotificationListenerWrapper: App is initializing (location: $location). Buffering payload.');
      _pendingPayload = data;
    } else {
      _navigateForNotification(data);
    }
  }

  void _onRouteChanged() {
    if (_pendingPayload == null) return;

    final location = appRouter.routerDelegate.currentConfiguration.uri.toString();
    if (!_isAppInitializing(location)) {
      biz.LogUtils.d('NotificationListenerWrapper: Route changed to ready state ($location). Processing pending payload.');
      final payload = _pendingPayload!;
      _pendingPayload = null;
      // Post-frame callback to ensure routing is clean after current frame transitions
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _navigateForNotification(payload);
        }
      });
    }
  }

  bool _isAppInitializing(String location) {
    // App is still loading settings/onboarding if location is splash (/) or onboarding (/onboarding)
    return location == '/' || location.startsWith('/onboarding');
  }

  void _navigateForNotification(Map<String, dynamic> data) {
    try {
      biz.LogUtils.d('NotificationListenerWrapper: Handling notification click, navigating to profile screen...');
      
      // Navigate to the Profile Page
      appRouter.go('/profile');
      
      // Switch to My Video tab (index 0) and trigger reload of video history
      sl<biz.ProfileBloc>().add(const biz.ProfileEvent.changeSubTab(0));
      sl<biz.ProfileBloc>().add(const biz.ProfileEvent.init());
      
    } catch (e, stackTrace) {
      biz.LogUtils.e(
        'NotificationListenerWrapper: Navigation to Profile failed',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
