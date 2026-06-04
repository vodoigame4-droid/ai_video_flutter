import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:media_kit/media_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/injection/injection_container.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/connectivity_listener_wrapper.dart';
import 'core/widgets/payment_listener_wrapper.dart';
import 'core/widgets/notification_listener_wrapper.dart';
import 'i18n/strings.g.dart';
import 'package:core_business/core_business.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MediaKit.ensureInitialized();
  await initDependencies();
  await sl<NotificationRepository>().initialize();

  // Load saved locale from SharedPreferences
  final prefs = sl<SharedPreferences>();
  final savedLocaleCode = prefs.getString(StorageKeys.selectedLocale);
  if (savedLocaleCode != null) {
    LocaleSettings.setLocaleRawSync(savedLocaleCode);
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    LogUtils.d(
      'NotificationRepositoryImpl: Foreground message received. '
      'Notification: ${message.notification != null ? "Yes" : "No"}, '
      'Title: "${message.notification?.title}", '
      'Body: "${message.notification?.body}", '
      'Data: ${message.data}',
    );
  });

  if (Platform.isAndroid) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  } else {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: 'Video AI',
            theme: AppTheme.darkTheme,
            themeMode: ThemeMode.dark,
            scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
            locale: TranslationProvider.of(context).locale.flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            routerConfig: appRouter,
            builder: (context, child) {
              return ConnectivityListenerWrapper(
                child: PaymentListenerWrapper(
                  child: NotificationListenerWrapper(
                    child: child ?? const SizedBox.shrink(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
