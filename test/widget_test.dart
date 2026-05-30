import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_video_flutter/main.dart';
import 'package:ai_video_flutter/core/injection/injection_container.dart';
import 'package:ai_video_flutter/i18n/strings.g.dart';
import 'package:mocktail/mocktail.dart';
import 'package:core_business/core_business.dart';

class MockMediaRepository extends Mock implements MediaRepository {}

void main() {
  // Disable Google Fonts HTTP fetching during tests
  GoogleFonts.config.allowRuntimeFetching = false;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await sl.reset();
    await initDependencies();

    final mockMediaRepository = MockMediaRepository();

    // Stub getHomeCategories
    when(() => mockMediaRepository.getHomeCategories()).thenAnswer(
      (_) async => const Resource.success([
        HomeCategoryEntity(
          id: 1,
          name: 'trending',
          theme: [
            ThemeEntity(
              id: '1',
              name: 'Theme 1',
              description: 'Desc 1',
              resultUrl: 'resultUrl',
              sourceUrl: 'sourceUrl',
              sourceUrls: [],
              thumbnailUrl: 'https://example.com/thumbnail.png',
              prompt: 'prompt',
              type: 'type',
              orgId: 1,
            ),
          ],
        ),
        HomeCategoryEntity(
          id: 2,
          name: 'new',
          theme: [
            ThemeEntity(
              id: '2',
              name: 'Theme 2',
              description: 'Desc 2',
              resultUrl: 'resultUrl2',
              sourceUrl: 'sourceUrl2',
              sourceUrls: [],
              thumbnailUrl: 'https://example.com/thumbnail2.png',
              prompt: 'prompt2',
              type: 'type2',
              orgId: 2,
            ),
          ],
        ),
      ]),
    );

    // Stub getHistory
    when(() => mockMediaRepository.getHistory(
          page: any(named: 'page'),
          take: any(named: 'take'),
        )).thenAnswer(
      (_) async => const Resource.success(
        PaginatedListEntity<MediaEntity>(
          data: [],
          meta: PaginationMetaEntity(
            page: 1,
            take: 10,
            total: 0,
            pageCount: 0,
          ),
        ),
      ),
    );

    sl.unregister<MediaRepository>();
    sl.registerLazySingleton<MediaRepository>(() => mockMediaRepository);
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
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    // Verify that the app title "Video AI" is rendered in the widget tree on HomePage.
    expect(find.text('Video AI'), findsOneWidget);
  });
}
