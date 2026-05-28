import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:media_kit/media_kit.dart';
import 'core/injection/injection_container.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';
import 'gen/assets.gen.dart';
import 'i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  await initDependencies();

  // Load saved locale from SharedPreferences
  final prefs = sl<SharedPreferences>();
  final savedLocaleCode = prefs.getString('selected_locale');
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
              return Stack(
                children: [
                  Positioned.fill(
                    child: Assets.images.bgApp.image(
                      fit: BoxFit.cover,
                    ),
                  ),
                  child ?? const SizedBox.shrink(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
