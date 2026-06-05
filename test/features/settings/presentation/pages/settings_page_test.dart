import 'package:ai_video_flutter/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ai_video_flutter/core/injection/injection_container.dart';
import 'package:ai_video_flutter/core/theme/app_theme.dart';
import 'package:core_business/core_business.dart';
import 'package:ai_video_flutter/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_video_flutter/features/settings/presentation/bloc/developer_bloc.dart';
import 'package:ai_video_flutter/features/settings/presentation/bloc/developer_event.dart';
import 'package:ai_video_flutter/features/settings/presentation/bloc/developer_state.dart';

class MockSettingsBloc extends Mock implements SettingsBloc {}
class MockCreditBadgeBloc extends Mock implements CreditBadgeBloc {}
class MockWatchProfileUseCase extends Mock implements WatchProfileUseCase {}
class MockAppConfig extends Mock implements AppConfig {}
class MockSharedPreferences extends Mock implements SharedPreferences {}
class MockDeveloperBloc extends Mock implements DeveloperBloc {}

void main() {
  late MockSettingsBloc mockSettingsBloc;
  late MockWatchProfileUseCase mockWatchProfileUseCase;
  late MockAppConfig mockAppConfig;

  setUp(() async {
    mockSettingsBloc = MockSettingsBloc();
    when(() => mockSettingsBloc.state).thenReturn(
      const SettingsState.ready(currentLanguageCode: 'en'),
    );
    when(() => mockSettingsBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockSettingsBloc.close()).thenAnswer((_) async {});

    final mockCreditBadgeBloc = MockCreditBadgeBloc();
    when(() => mockCreditBadgeBloc.state).thenReturn(
      const CreditBadgeState.ready(isPro: false, credits: 300),
    );
    when(() => mockCreditBadgeBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockCreditBadgeBloc.close()).thenAnswer((_) async {});

    final mockDeveloperBloc = MockDeveloperBloc();
    when(() => mockDeveloperBloc.state).thenReturn(const DeveloperState.initial());
    when(() => mockDeveloperBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockDeveloperBloc.close()).thenAnswer((_) async {});

    mockWatchProfileUseCase = MockWatchProfileUseCase();
    mockAppConfig = MockAppConfig();

    when(() => mockAppConfig.appVersion).thenReturn('1.1.1');
    
    final mockUser = UserEntity(
      id: 'EDFO1R0Y2XLBJ1I2',
      deviceId: 'device-id',
      name: 'Test User',
      email: 'user@example.com',
      avatarUrl: '',
      inviteCode: 'invite-code',
      status: 'active',
      credits: 300,
      extraCredits: 0,
      subscribeCredits: 0,
      isRated: false,
      isVip: false,
      freeSuggestions: 3,
      activeSubId: null,
      refUsersCount: 0,
      createdAt: DateTime.now(),
    );
    when(() => mockWatchProfileUseCase()).thenAnswer((_) => Stream.value(mockUser));
    
    final mockPrefs = MockSharedPreferences();
    when(() => mockPrefs.getBool('rating_has_rated')).thenReturn(false);

    await sl.reset();
    sl.allowReassignment = true;
    sl.registerFactory<SettingsBloc>(() => mockSettingsBloc);
    sl.registerFactory<CreditBadgeBloc>(() => mockCreditBadgeBloc);
    sl.registerFactory<DeveloperBloc>(() => mockDeveloperBloc);
    sl.registerLazySingleton<WatchProfileUseCase>(() => mockWatchProfileUseCase);
    sl.registerLazySingleton<AppConfig>(() => mockAppConfig);
    sl.registerLazySingleton<SharedPreferences>(() => mockPrefs);
  });

  testWidgets('SettingsPage renders all items correctly', (WidgetTester tester) async {
    LocaleSettings.setLocale(AppLocale.en);
    final t = await AppLocale.en.build();

    await tester.pumpWidget(
      TranslationProvider(
        child: MaterialApp(
          theme: AppTheme.darkTheme,
          home: const SettingsPage(),
        ),
      ),
    );

    await tester.pump();

    // Verify Title
    expect(find.text(t.settings.title), findsOneWidget);

    // Verify first few items that are visible
    expect(find.text(t.settings.myCredits), findsOneWidget);
    expect(find.text(t.settings.language), findsOneWidget);
    expect(find.text(t.settings.contactUs), findsOneWidget);

    // Scroll down to reveal the rest
    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pumpAndSettle();

    // Verify remaining items
    expect(find.text(t.settings.rateApp), findsOneWidget);
    expect(find.text(t.settings.termsOfUse), findsOneWidget);
    expect(find.text(t.settings.privacyPolicy), findsOneWidget);
    expect(find.text(t.settings.userCode), findsOneWidget);
    expect(find.text('EDFO1R0Y2XLBJ1I2'), findsOneWidget);
  });

  testWidgets('Tapping version text 7 times triggers developer tap event', (WidgetTester tester) async {
    LocaleSettings.setLocale(AppLocale.en);
    final mockDeveloperBloc = MockDeveloperBloc();
    when(() => mockDeveloperBloc.state).thenReturn(const DeveloperState.initial());
    when(() => mockDeveloperBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockDeveloperBloc.close()).thenAnswer((_) async {});

    sl.registerFactory<DeveloperBloc>(() => mockDeveloperBloc);

    await tester.pumpWidget(
      TranslationProvider(
        child: MaterialApp(
          theme: AppTheme.darkTheme,
          home: const SettingsPage(),
        ),
      ),
    );

    await tester.pump();

    // Scroll down to find version text
    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pumpAndSettle();

    // Find version text which starts with 'v'
    final versionTextFinder = find.text('v1.1.1');
    expect(versionTextFinder, findsOneWidget);

    // Tap it 7 times
    for (int i = 0; i < 7; i++) {
      await tester.tap(versionTextFinder);
      await tester.pump();
    }

    // Verify tap event was sent to DeveloperBloc
    verify(() => mockDeveloperBloc.add(const DeveloperEvent.tap())).called(7);
  });
}
