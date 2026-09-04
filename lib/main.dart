import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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
import 'core/widgets/global_purchase_overlay.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'i18n/strings.g.dart';
import 'package:core_business/core_business.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:app_redirect/app_redirect.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await ScreenProtector.preventScreenshotOn();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Set up Firebase Crashlytics
  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }

  FlutterError.onError = (errorDetails) {
    final exceptionStr = errorDetails.exceptionAsString();
    final stackStr = errorDetails.stack?.toString() ?? '';
    final isImageStreamError = (exceptionStr.contains('Null check operator used on a null value') ||
            exceptionStr.contains('MultiImageStreamCompleter') ||
            exceptionStr.contains('MultiFrameImageStreamCompleter') ||
            exceptionStr.contains('ImageStreamCompleter')) &&
        (stackStr.contains('MultiImageStreamCompleter') ||
            stackStr.contains('multi_image_stream_completer') ||
            stackStr.contains('MultiFrameImageStreamCompleter') ||
            stackStr.contains('image_stream') ||
            stackStr.contains('_handleAppFrame'));

    if (isImageStreamError) {
      LogUtils.w(
        'Handled transient image stream error without fatal crash: ${errorDetails.exception}',
      );
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      return;
    }

    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    final errorStr = error.toString();
    final stackStr = stack.toString();
    final isImageStreamError = (errorStr.contains('Null check operator used on a null value') ||
            errorStr.contains('MultiImageStreamCompleter') ||
            errorStr.contains('MultiFrameImageStreamCompleter') ||
            errorStr.contains('ImageStreamCompleter')) &&
        (stackStr.contains('MultiImageStreamCompleter') ||
            stackStr.contains('multi_image_stream_completer') ||
            stackStr.contains('MultiFrameImageStreamCompleter') ||
            stackStr.contains('image_stream') ||
            stackStr.contains('_handleAppFrame'));

    if (isImageStreamError) {
      LogUtils.w(
        'Handled transient platform image stream error without fatal crash: $error',
      );
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: false);
      return true;
    }

    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  MediaKit.ensureInitialized();
  await initDependencies();
  sl<NotificationRepository>().initialize();

  // Load saved locale from SharedPreferences
  final prefs = sl<SharedPreferences>();
  final savedLocaleCode = prefs.getString(StorageKeys.selectedLocale);
  if (savedLocaleCode != null) {
    await LocaleSettings.setLocaleRaw(savedLocaleCode);
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    LogUtils.d(
      'NotificationRepositoryImpl: Foreground message received. '
      'Notification: ${message.notification != null ? "Yes" : "No"}, '
      'Title: "${message.notification?.title}", '
      'Body: "${message.notification?.body}", '
      'Data: ${message.data}',
    );
    final notification = message.notification;
    if (notification != null && Platform.isAndroid) {
      sl<NotificationRepository>().showLocalNotification(
        title: notification.title ?? '',
        body: notification.body ?? '',
        data: message.data,
      );
    }
    // Refresh history stream when a notification is received in foreground
    sl<GetHistoryUseCase>()(GetHistoryParams(page: 1, take: 50));
  });

  if (Platform.isAndroid) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  } else {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  // Prevent red/grey screen of death in production
  if (!kDebugMode) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      FirebaseCrashlytics.instance.recordFlutterError(details);
      return Scaffold(
        backgroundColor: const Color(0xFF0D0D0D),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline_rounded,
                    color: Colors.redAccent,
                    size: 64,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    t.errors.unknown,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    };
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: BlocProvider<IapBloc>(
        create: (context) => sl<IapBloc>()..add(const IapEvent.init()),
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              title: 'Vido',
              theme: AppTheme.darkTheme,
              themeMode: ThemeMode.dark,
              scrollBehavior: const ScrollBehavior().copyWith(
                overscroll: false,
              ),
              locale: TranslationProvider.of(context).locale.flutterLocale,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              routerConfig: appRouter,
              builder: (context, child) {
                return AppRedirectGate(
                  enableRealtime: true,
                  child: ConnectivityListenerWrapper(
                    child: PaymentListenerWrapper(
                      child: NotificationListenerWrapper(
                        child: GlobalPurchaseOverlay(
                          child: child ?? const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
