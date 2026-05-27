import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ai_video_flutter/main.dart';
import 'package:ai_video_flutter/i18n/strings.g.dart';

void main() {
  // Disable Google Fonts HTTP fetching during tests
  GoogleFonts.config.allowRuntimeFetching = false;
  testWidgets('Video AI app renders successfully', (WidgetTester tester) async {
    // Initialize slang for testing
    LocaleSettings.useDeviceLocaleSync();

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Wait for mock BLoC loading delay to finish
    await tester.pump(const Duration(milliseconds: 1000));
    await tester.pump();

    // Verify that the app title "Video AI" is rendered in the widget tree.
    expect(find.text('Video AI'), findsOneWidget);
  });
}
