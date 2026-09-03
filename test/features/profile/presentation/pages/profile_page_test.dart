import 'package:ai_video_flutter/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ai_video_flutter/core/injection/injection_container.dart';
import 'package:ai_video_flutter/core/theme/app_theme.dart';
import 'package:core_business/core_business.dart';
import 'package:ai_video_flutter/i18n/strings.g.dart';
import 'package:ai_video_flutter/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:ai_video_flutter/features/dashboard/presentation/bloc/dashboard_state.dart';

class MockProfileBloc extends Mock implements ProfileBloc {}
class MockDeveloperBloc extends Mock implements DeveloperBloc {}
class MockDashboardBloc extends Mock implements DashboardBloc {}
class MockCreditBadgeBloc extends Mock implements CreditBadgeBloc {}
class MockWatchProfileUseCase extends Mock implements WatchProfileUseCase {}

void main() {
  late MockProfileBloc mockProfileBloc;
  late MockDeveloperBloc mockDeveloperBloc;
  late MockDashboardBloc mockDashboardBloc;
  late MockCreditBadgeBloc mockCreditBadgeBloc;
  late MockWatchProfileUseCase mockWatchProfileUseCase;

  setUp(() async {
    mockProfileBloc = MockProfileBloc();
    mockDeveloperBloc = MockDeveloperBloc();
    mockDashboardBloc = MockDashboardBloc();
    mockCreditBadgeBloc = MockCreditBadgeBloc();
    mockWatchProfileUseCase = MockWatchProfileUseCase();

    when(() => mockProfileBloc.state).thenReturn(
      const ProfileState.ready(
        subTabIndex: 0,
        videosState: Resource.empty(),
        likedTemplates: [],
      ),
    );
    when(() => mockProfileBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockProfileBloc.close()).thenAnswer((_) async {});

    when(() => mockDeveloperBloc.state).thenReturn(
      const DeveloperState.initial(),
    );
    when(() => mockDeveloperBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockDeveloperBloc.close()).thenAnswer((_) async {});

    when(() => mockDashboardBloc.state).thenReturn(
      const DashboardState.currentTab(1),
    );
    when(() => mockDashboardBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockDashboardBloc.close()).thenAnswer((_) async {});

    when(() => mockCreditBadgeBloc.state).thenReturn(
      const CreditBadgeState.ready(isPro: false, credits: 300),
    );
    when(() => mockCreditBadgeBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockCreditBadgeBloc.close()).thenAnswer((_) async {});

    when(() => mockWatchProfileUseCase.call()).thenAnswer(
      (_) => Stream.value(
        UserEntity(
          id: 'test-user-id',
          deviceId: 'device-id',
          name: 'Test',
          email: 'test@example.com',
          avatarUrl: '',
          inviteCode: 'EDFO1R0Y2XLBJ1I2',
          status: 'ACTIVE',
          credits: 300,
          extraCredits: 0,
          subscribeCredits: 0,
          isRated: true,
          isVip: false,
          freeSuggestions: 0,
          activeSubId: null,
          refUsersCount: 0,
          createdAt: DateTime.now(),
        ),
      ),
    );

    await sl.reset();
    sl.registerFactory<ProfileBloc>(() => mockProfileBloc);
    sl.registerFactory<DeveloperBloc>(() => mockDeveloperBloc);
    sl.registerFactory<DashboardBloc>(() => mockDashboardBloc);
    sl.registerFactory<CreditBadgeBloc>(() => mockCreditBadgeBloc);
    sl.registerLazySingleton<WatchProfileUseCase>(() => mockWatchProfileUseCase);
  });

  testWidgets('ProfilePage renders and triggers DeveloperEvent.tap on title tap', (WidgetTester tester) async {
    LocaleSettings.setLocale(AppLocale.en);
    final t = await AppLocale.en.build();

    await tester.pumpWidget(
      TranslationProvider(
        child: MaterialApp(
          theme: AppTheme.darkTheme,
          home: BlocProvider<DashboardBloc>.value(
            value: mockDashboardBloc,
            child: const ProfilePage(),
          ),
        ),
      ),
    );

    await tester.pump();

    // Verify Title is present
    expect(find.text(t.profile.title), findsOneWidget);

    // Tap the title
    await tester.tap(find.text(t.profile.title));
    await tester.pump();

    verify(() => mockDeveloperBloc.add(const DeveloperEvent.tap())).called(1);
  });
}
