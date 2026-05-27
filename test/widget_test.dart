import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_video_flutter/main.dart';
import 'package:ai_video_flutter/core/injection/injection_container.dart';
import 'package:ai_video_flutter/i18n/strings.g.dart';

void main() {
  // Disable Google Fonts HTTP fetching during tests
  GoogleFonts.config.allowRuntimeFetching = false;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await sl.reset();
    await initDependencies();
  });

  testWidgets('Video AI app renders successfully', (WidgetTester tester) async {
    // Initialize slang for testing
    LocaleSettings.useDeviceLocaleSync();

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Wait for Splash screen timer and navigation to complete (1.5 seconds splash + transition)
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final t = await AppLocale.en.build();

    // Tap Get Started on page 1
    await tester.tap(find.text(t.onboarding.page1.button));
    await tester.pumpAndSettle();

    // Tap Continue on page 2
    await tester.tap(find.text(t.onboarding.page2.button));
    await tester.pumpAndSettle();

    // Tap Continue on page 3
    await tester.tap(find.text(t.onboarding.page3.button));
    await tester.pumpAndSettle();

    // Tap Continue on page 4
    await tester.tap(find.text(t.onboarding.page4.button));
    await tester.pumpAndSettle();

    // Tap Continue on page 5 to navigate to HomePage
    await tester.tap(find.text(t.onboarding.page5.button));
    await tester.pumpAndSettle();

    // Verify that the app title "Video AI" is rendered in the widget tree on HomePage.
    expect(find.text('Video AI'), findsOneWidget);
  });
}
