import 'package:ai_video_flutter/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ai_video_flutter/core/injection/injection_container.dart';
import 'package:ai_video_flutter/core/theme/app_theme.dart';
import 'package:ai_video_flutter/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:ai_video_flutter/features/settings/presentation/bloc/settings_state.dart';
import 'package:ai_video_flutter/i18n/strings.g.dart';

class MockSettingsBloc extends Mock implements SettingsBloc {}

void main() {
  late MockSettingsBloc mockSettingsBloc;

  setUp(() async {
    mockSettingsBloc = MockSettingsBloc();
    when(() => mockSettingsBloc.state).thenReturn(
      const SettingsState.ready(currentLocale: AppLocale.en),
    );
    when(() => mockSettingsBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockSettingsBloc.close()).thenAnswer((_) async {});
    
    await sl.reset();
    sl.registerFactory<SettingsBloc>(() => mockSettingsBloc);
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
}
