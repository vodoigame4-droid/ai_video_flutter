import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:media_kit/media_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/injection/injection_container.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';
import 'gen/assets.gen.dart';
import 'i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MediaKit.ensureInitialized();
  await initDependencies();

  // Load saved locale from SharedPreferences
  final prefs = sl<SharedPreferences>();
  final savedLocaleCode = prefs.getString(StorageKeys.selectedLocale);
  if (savedLocaleCode != null) {
    LocaleSettings.setLocaleRawSync(savedLocaleCode);
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
              return child ?? const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
