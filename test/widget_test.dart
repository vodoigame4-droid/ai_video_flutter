import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ai_video_flutter/main.dart';
import 'package:ai_video_flutter/core/injection/injection_container.dart';
import 'package:ai_video_flutter/i18n/strings.g.dart';

void main() {
  // Disable Google Fonts HTTP fetching during tests
  GoogleFonts.config.allowRuntimeFetching = false;

  setUp(() async {
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

    // Verify that the app title "Video AI" is rendered in the widget tree on HomePage.
    expect(find.text('Video AI'), findsOneWidget);
  });
}
