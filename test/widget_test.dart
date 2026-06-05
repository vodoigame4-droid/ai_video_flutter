import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_video_flutter/main.dart';
import 'package:ai_video_flutter/core/injection/injection_container.dart';
import 'package:ai_video_flutter/i18n/strings.g.dart';
import 'package:mocktail/mocktail.dart';
import 'package:core_business/core_business.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ai_video_flutter/core/services/remote_config_service.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MockMediaRepository extends Mock implements MediaRepository {}
class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}
class MockNotificationSettings extends Mock implements NotificationSettings {}
class MockAutoLoginUseCase extends Mock implements AutoLoginUseCase {}
class MockGetProfileUseCase extends Mock implements GetProfileUseCase {}
class MockWatchProfileUseCase extends Mock implements WatchProfileUseCase {}
class MockRemoteConfigService extends Mock implements RemoteConfigService {}
class MockGetDailyLoginStatusUseCase extends Mock implements GetDailyLoginStatusUseCase {}
class MockCheckInUseCase extends Mock implements CheckInUseCase {}

void main() {
  // Disable Google Fonts HTTP fetching during tests
  GoogleFonts.config.allowRuntimeFetching = false;
  VisibilityDetectorController.instance.updateInterval = Duration.zero;

  setUp(() async {
    registerFallbackValue(NoParams());

    SharedPreferences.setMockInitialValues({});
    await sl.reset();
    await initDependencies();

    final mockFirebaseMessaging = MockFirebaseMessaging();
    final mockNotificationSettings = MockNotificationSettings();
    final mockAutoLoginUseCase = MockAutoLoginUseCase();
    final mockGetProfileUseCase = MockGetProfileUseCase();
    final mockWatchProfileUseCase = MockWatchProfileUseCase();
    final mockGetDailyLoginStatusUseCase = MockGetDailyLoginStatusUseCase();
    final mockCheckInUseCase = MockCheckInUseCase();

    final mockUser = UserEntity(
      id: 'mock_user_id',
      deviceId: 'mock-device-id-tgv',
      name: 'Mock User',
      email: 'mock@example.com',
      avatarUrl: '',
      inviteCode: '',
      status: 'active',
      credits: 100,
      extraCredits: 0,
      subscribeCredits: 0,
      isRated: false,
      isVip: false,
      freeSuggestions: 3,
      activeSubId: null,
      refUsersCount: 0,
      createdAt: DateTime.now(),
    );

    when(() => mockNotificationSettings.authorizationStatus)
        .thenReturn(AuthorizationStatus.authorized);

    when(() => mockFirebaseMessaging.setForegroundNotificationPresentationOptions(
          alert: any(named: 'alert'),
          badge: any(named: 'badge'),
          sound: any(named: 'sound'),
        )).thenAnswer((_) async {});
    when(() => mockFirebaseMessaging.getToken()).thenAnswer((_) async => 'mock_token');
    when(() => mockFirebaseMessaging.getInitialMessage()).thenAnswer((_) async => null);
    when(() => mockFirebaseMessaging.requestPermission(
          alert: any(named: 'alert'),
          announcement: any(named: 'announcement'),
          badge: any(named: 'badge'),
          carPlay: any(named: 'carPlay'),
          criticalAlert: any(named: 'criticalAlert'),
          provisional: any(named: 'provisional'),
          sound: any(named: 'sound'),
        )).thenAnswer((_) async => mockNotificationSettings);

    when(() => mockAutoLoginUseCase(any())).thenAnswer(
      (_) async => Resource.success(mockUser),
    );

    when(() => mockGetProfileUseCase(any())).thenAnswer(
      (_) async => Resource.success(mockUser),
    );

    when(() => mockWatchProfileUseCase()).thenAnswer(
      (_) => Stream.value(mockUser),
    );

    when(() => mockGetDailyLoginStatusUseCase(any())).thenAnswer(
      (_) async => const Resource.success(DailyLoginEntity(
        currentStreak: 0,
        lastLoginAt: null,
        rewards: [],
      )),
    );

    when(() => mockCheckInUseCase(any())).thenAnswer(
      (_) async => const Resource.success(10),
    );

    sl.unregister<FirebaseMessaging>();
    sl.registerLazySingleton<FirebaseMessaging>(() => mockFirebaseMessaging);

    sl.unregister<AutoLoginUseCase>();
    sl.registerLazySingleton<AutoLoginUseCase>(() => mockAutoLoginUseCase);

    sl.unregister<GetProfileUseCase>();
    sl.registerLazySingleton<GetProfileUseCase>(() => mockGetProfileUseCase);

    sl.unregister<WatchProfileUseCase>();
    sl.registerLazySingleton<WatchProfileUseCase>(() => mockWatchProfileUseCase);

    sl.unregister<GetDailyLoginStatusUseCase>();
    sl.registerLazySingleton<GetDailyLoginStatusUseCase>(() => mockGetDailyLoginStatusUseCase);

    sl.unregister<CheckInUseCase>();
    sl.registerLazySingleton<CheckInUseCase>(() => mockCheckInUseCase);

    final mockMediaRepository = MockMediaRepository();

    // Stub getHomeCategories
    when(() => mockMediaRepository.getHomeCategories()).thenAnswer(
      (_) async => const Resource.success([
        HomeCategoryEntity(
          id: '1',
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
          id: '2',
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

    // Stub getOnboardingImages
    when(() => mockMediaRepository.getOnboardingImages()).thenAnswer(
      (_) async => const Resource.success([]),
    );

    sl.unregister<MediaRepository>();
    sl.registerLazySingleton<MediaRepository>(() => mockMediaRepository);

    final mockRemoteConfigService = MockRemoteConfigService();
    when(() => mockRemoteConfigService.initialize()).thenAnswer((_) async {});
    when(() => mockRemoteConfigService.preloadVideos()).thenAnswer((_) async {});
    when(() => mockRemoteConfigService.getBannerHomeUrl()).thenReturn('https://example.com/banner.png');
    when(() => mockRemoteConfigService.videoGenCost).thenReturn(35);

    sl.unregister<RemoteConfigService>();
    sl.registerLazySingleton<RemoteConfigService>(() => mockRemoteConfigService);
  });

  testWidgets('Video AI app renders successfully', (WidgetTester tester) async {
    // Initialize slang for testing
    LocaleSettings.setLocale(AppLocale.en);

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

    // Verify that the dashboard create video label is rendered on HomePage.
    expect(find.text(t.dashboard.createVideo), findsOneWidget);
  });
}
