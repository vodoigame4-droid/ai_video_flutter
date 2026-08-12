import 'dart:async';
import 'package:flutter/material.dart';
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
import 'package:ai_video_flutter/core/navigation/app_router.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMediaRepository extends Mock implements MediaRepository {}
class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}
class MockNotificationSettings extends Mock implements NotificationSettings {}
class MockAutoLoginUseCase extends Mock implements AutoLoginUseCase {}
class MockGetProfileUseCase extends Mock implements GetProfileUseCase {}
class MockWatchProfileUseCase extends Mock implements WatchProfileUseCase {}
class MockRemoteConfigService extends Mock implements RemoteConfigService {}
class MockGetDailyLoginStatusUseCase extends Mock implements GetDailyLoginStatusUseCase {}
class MockCheckInUseCase extends Mock implements CheckInUseCase {}
class FakeWebViewController extends PlatformWebViewController {
  FakeWebViewController()
      : super.implementation(
          const PlatformWebViewControllerCreationParams(),
        );

  @override
  Future<void> setJavaScriptMode(JavaScriptMode javaScriptMode) async {}

  @override
  Future<void> loadRequest(LoadRequestParams params) async {}

  @override
  Future<void> loadHtmlString(String html, {String? baseUrl}) async {}

  @override
  Future<void> setBackgroundColor(Color color) async {}

  @override
  Future<void> setPlatformNavigationDelegate(PlatformNavigationDelegate handler) async {}
}

class FakeWebViewWidget extends PlatformWebViewWidget {
  FakeWebViewWidget(PlatformWebViewController controller)
      : super.implementation(
          PlatformWebViewWidgetCreationParams(controller: controller),
        );

  @override
  Widget build(BuildContext context) => const SizedBox();
}

class FakeNavigationDelegate extends PlatformNavigationDelegate {
  FakeNavigationDelegate()
      : super.implementation(
          const PlatformNavigationDelegateCreationParams(),
        );

  @override
  Future<void> setOnNavigationRequest(
    FutureOr<NavigationDecision> Function(NavigationRequest request)
        onNavigationRequest,
  ) async {}

  @override
  Future<void> setOnPageStarted(
    void Function(String url) onPageStarted,
  ) async {}

  @override
  Future<void> setOnPageFinished(
    void Function(String url) onPageFinished,
  ) async {}

  @override
  Future<void> setOnWebResourceError(
    void Function(WebResourceError error) onWebResourceError,
  ) async {}
}

class MockWebViewPlatform extends WebViewPlatform with MockPlatformInterfaceMixin {
  @override
  PlatformWebViewController createPlatformWebViewController(
    PlatformWebViewControllerCreationParams params,
  ) {
    return FakeWebViewController();
  }

  @override
  PlatformWebViewWidget createPlatformWebViewWidget(
    PlatformWebViewWidgetCreationParams params,
  ) {
    return FakeWebViewWidget(params.controller);
  }

  @override
  PlatformNavigationDelegate createPlatformNavigationDelegate(
    PlatformNavigationDelegateCreationParams params,
  ) {
    return FakeNavigationDelegate();
  }
}
class FakePlatformWebViewControllerCreationParams extends Fake implements PlatformWebViewControllerCreationParams {}
class FakePlatformWebViewWidgetCreationParams extends Fake implements PlatformWebViewWidgetCreationParams {}
class FakeBuildContext extends Fake implements BuildContext {}

void main() {
  // Disable Google Fonts HTTP fetching during tests
  GoogleFonts.config.allowRuntimeFetching = false;
  VisibilityDetectorController.instance.updateInterval = Duration.zero;

  setUpAll(() {
    registerFallbackValue(FakePlatformWebViewControllerCreationParams());
    registerFallbackValue(FakePlatformWebViewWidgetCreationParams());
    registerFallbackValue(JavaScriptMode.unrestricted);
    registerFallbackValue(LoadRequestParams(uri: Uri.parse('https://example.com')));
    registerFallbackValue(const Color(0x00000000));
    registerFallbackValue(FakeBuildContext());
  });

  setUp(() async {
    registerFallbackValue(NoParams());

    WebViewPlatform.instance = MockWebViewPlatform();

    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await sl.reset();
    await initDependencies();
    appRouter.go('/');

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

    // Stub getBanners
    when(() => mockMediaRepository.getBanners()).thenAnswer(
      (_) async => const Resource.success(['https://example.com/banner.png']),
    );

    sl.unregister<MediaRepository>();
    sl.registerLazySingleton<MediaRepository>(() => mockMediaRepository);

    final mockRemoteConfigService = MockRemoteConfigService();
    when(() => mockRemoteConfigService.initialize()).thenAnswer((_) async {});
    when(() => mockRemoteConfigService.preloadVideos()).thenAnswer((_) async {});
    when(() => mockRemoteConfigService.getBannerHomeUrl()).thenReturn('https://example.com/banner.png');
    when(() => mockRemoteConfigService.videoGenCost).thenReturn(35);
    when(() => mockRemoteConfigService.getOnboardingUrls()).thenReturn([]);
    when(() => mockRemoteConfigService.getBgIAPUrl()).thenReturn('https://example.com/bg_iap.mp4');
    when(() => mockRemoteConfigService.getBgDiscountUrl()).thenReturn('https://example.com/bg_discount.mp4');
    when(() => mockRemoteConfigService.closeButtonDelaySeconds).thenReturn(0);
    when(() => mockRemoteConfigService.showIAP).thenReturn(true);
    when(() => mockRemoteConfigService.showRatingFeature).thenReturn(true);

    sl.unregister<RemoteConfigService>();
    sl.registerLazySingleton<RemoteConfigService>(() => mockRemoteConfigService);
  });

  testWidgets('Vido app renders successfully - VIP user bypasses IAP', (WidgetTester tester) async {
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
      isVip: true, // VIP!
      freeSuggestions: 3,
      activeSubId: null,
      refUsersCount: 0,
      createdAt: DateTime.now(),
    );

    when(() => sl<AutoLoginUseCase>()(any())).thenAnswer(
      (_) async => Resource.success(mockUser),
    );
    when(() => sl<GetProfileUseCase>()(any())).thenAnswer(
      (_) async => Resource.success(mockUser),
    );
    when(() => sl<WatchProfileUseCase>()()).thenAnswer(
      (_) => Stream.value(mockUser),
    );

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

    // Clean up to dispose all active widgets
    await tester.pumpWidget(const SizedBox());
    await tester.pumpAndSettle();
  });

  testWidgets('Vido app goes through onboarding and shows IAP screen - non-VIP user', (WidgetTester tester) async {
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
      isVip: false, // NOT VIP!
      freeSuggestions: 3,
      activeSubId: null,
      refUsersCount: 0,
      createdAt: DateTime.now(),
    );

    when(() => sl<AutoLoginUseCase>()(any())).thenAnswer(
      (_) async => Resource.success(mockUser),
    );
    when(() => sl<GetProfileUseCase>()(any())).thenAnswer(
      (_) async => Resource.success(mockUser),
    );
    when(() => sl<WatchProfileUseCase>()()).thenAnswer(
      (_) => Stream.value(mockUser),
    );

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

    // Tap Continue on page 5 to navigate to IapPage
    await tester.tap(find.text(t.onboarding.page5.button));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    // Verify that we land on IAPPage (shows "Start My Subscription" or similar premium texts)
    expect(find.text(t.premium.auto_renewable), findsOneWidget);

    // Clean up to dispose all active widgets
    await tester.pumpWidget(const SizedBox());
    await tester.pumpAndSettle();
  });
}
