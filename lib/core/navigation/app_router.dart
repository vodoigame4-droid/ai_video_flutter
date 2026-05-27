import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

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

final GoRouter appRouter = GoRouter(
  initialLocation: SplashPage.path,
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
  ],
);
