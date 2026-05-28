import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/templates/presentation/pages/templates_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/settings/presentation/pages/language_page.dart';
import '../../features/create_video/presentation/pages/create_video_page.dart';
import '../../features/premium/presentation/pages/paywall_video_page.dart';
import '../../features/premium/presentation/pages/iap_page.dart';
import '../../features/premium/presentation/pages/buy_credits_page.dart';
import '../../features/video_player/presentation/pages/video_player_page.dart';

abstract class AppRoutePage {
  const AppRoutePage._();

  static Page<T> cupertino<T>({
    required GoRouterState state,
    required Widget child,
  }) {
    return CupertinoPage<T>(
      key: state.pageKey,
      name: state.name ?? state.matchedLocation,
      arguments: state.extra,
      child: child,
    );
  }
}

final RouteObserver<ModalRoute<dynamic>> routeObserver = RouteObserver<ModalRoute<dynamic>>();

final GoRouter appRouter = GoRouter(
  initialLocation: SplashPage.path,
  observers: [routeObserver],
  routes: [
    GoRoute(
      path: SplashPage.path,
      name: SplashPage.name,
      pageBuilder: (context, state) => AppRoutePage.cupertino<void>(
        state: state,
        child: const SplashPage(),
      ),
    ),
    GoRoute(
      path: OnboardingPage.path,
      name: OnboardingPage.name,
      pageBuilder: (context, state) => AppRoutePage.cupertino<void>(
        state: state,
        child: const OnboardingPage(),
      ),
    ),
    GoRoute(
      path: DashboardPage.path,
      name: DashboardPage.name,
      pageBuilder: (context, state) => AppRoutePage.cupertino<void>(
        state: state,
        child: const DashboardPage(),
      ),
    ),
    GoRoute(
      path: TemplatesPage.path,
      name: TemplatesPage.name,
      pageBuilder: (context, state) {
        final category = state.uri.queryParameters['category'] ?? 'All';
        return AppRoutePage.cupertino<void>(
          state: state,
          child: TemplatesPage(initialCategory: category),
        );
      },
    ),
    GoRoute(
      path: SettingsPage.path,
      name: SettingsPage.name,
      pageBuilder: (context, state) => AppRoutePage.cupertino<void>(
        state: state,
        child: const SettingsPage(),
      ),
    ),
    GoRoute(
      path: LanguagePage.path,
      name: LanguagePage.name,
      pageBuilder: (context, state) => AppRoutePage.cupertino<void>(
        state: state,
        child: const LanguagePage(),
      ),
    ),
    GoRoute(
      path: CreateVideoPage.path,
      name: CreateVideoPage.name,
      pageBuilder: (context, state) {
        final tabStr = state.uri.queryParameters['tab'] ?? '0';
        final initialTab = int.tryParse(tabStr) ?? 0;
        return AppRoutePage.cupertino<void>(
          state: state,
          child: CreateVideoPage(initialTab: initialTab),
        );
      },
    ),
    GoRoute(
      path: PaywallVideoPage.path,
      name: PaywallVideoPage.name,
      pageBuilder: (context, state) => AppRoutePage.cupertino<void>(
        state: state,
        child: const PaywallVideoPage(),
      ),
    ),
    GoRoute(
      path: IapPage.path,
      name: IapPage.name,
      pageBuilder: (context, state) => AppRoutePage.cupertino<void>(
        state: state,
        child: const IapPage(),
      ),
    ),
    GoRoute(
      path: BuyCreditsPage.path,
      name: BuyCreditsPage.name,
      pageBuilder: (context, state) => AppRoutePage.cupertino<void>(
        state: state,
        child: const BuyCreditsPage(),
      ),
    ),
    GoRoute(
      path: VideoPlayerPage.path,
      name: VideoPlayerPage.name,
      pageBuilder: (context, state) {
        final videoUrl = state.uri.queryParameters['videoUrl'] ?? '';
        final title = state.uri.queryParameters['title'] ?? '';
        return AppRoutePage.cupertino<void>(
          state: state,
          child: VideoPlayerPage(videoUrl: videoUrl, title: title),
        );
      },
    ),
  ],
);
