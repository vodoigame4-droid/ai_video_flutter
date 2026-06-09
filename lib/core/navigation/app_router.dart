import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:core_business/core_business.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/templates/presentation/pages/templates_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/settings/presentation/pages/language_page.dart';
import '../../features/create_video/presentation/pages/create_video_page.dart';
import '../../features/create_video/presentation/pages/generating_page.dart';
import '../../features/create_video/presentation/pages/result_page.dart';
import '../../features/premium/presentation/pages/iap_page.dart';
import '../../features/premium/presentation/pages/buy_credits_page.dart';
import '../../features/premium/presentation/pages/generation_iap_page.dart';
import '../../features/premium/presentation/pages/generation_buy_credits_page.dart';
import '../../features/premium/presentation/pages/discount_page.dart';
import '../../features/premium/presentation/pages/debug_page.dart';
import '../../features/create_video/presentation/pages/create_from_template_page.dart';
import '../../features/create_video/presentation/pages/create_template_settings_page.dart';
import '../../features/video_player/presentation/pages/video_player_page.dart';
import '../../features/create_video/presentation/pages/video_trim_page.dart';

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

  static Page<T> fullscreenDialog<T>({
    required GoRouterState state,
    required Widget child,
  }) {
    return CupertinoPage<T>(
      key: state.pageKey,
      name: state.name ?? state.matchedLocation,
      arguments: state.extra,
      fullscreenDialog: true,
      child: child,
    );
  }

  static Page<T> fade<T>({
    required GoRouterState state,
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      name: state.name ?? state.matchedLocation,
      arguments: state.extra,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: child,
    );
  }
}

final RouteObserver<ModalRoute<dynamic>> routeObserver =
    RouteObserver<ModalRoute<dynamic>>();

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: SplashPage.path,
  observers: [
    routeObserver,
    if (Firebase.apps.isNotEmpty)
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
  routes: [
    GoRoute(
      path: SplashPage.path,
      name: SplashPage.name,
      pageBuilder: (context, state) =>
          AppRoutePage.cupertino<void>(state: state, child: const SplashPage()),
    ),
    GoRoute(
      path: OnboardingPage.path,
      name: OnboardingPage.name,
      pageBuilder: (context, state) {
        final extra = state.extra;
        final preloadedImages = extra is List
            ? List<String>.from(extra.map((e) => e.toString()))
            : null;
        return AppRoutePage.cupertino<void>(
          state: state,
          child: OnboardingPage(preloadedImages: preloadedImages),
        );
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return DashboardPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: HomePage.path,
              name: HomePage.name,
              pageBuilder: (context, state) => AppRoutePage.cupertino<void>(
                state: state,
                child: const HomePage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ProfilePage.path,
              name: ProfilePage.name,
              pageBuilder: (context, state) => AppRoutePage.cupertino<void>(
                state: state,
                child: const ProfilePage(),
              ),
            ),
          ],
        ),
      ],
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
      path: CreateFromTemplatePage.path,
      name: CreateFromTemplatePage.name,
      pageBuilder: (context, state) {
        final templateId = state.uri.queryParameters['templateId'] ?? '';
        final title = state.uri.queryParameters['title'] ?? '';
        final videoUrl = state.uri.queryParameters['videoUrl'] ?? '';
        final imageUrl = state.uri.queryParameters['imageUrl'] ?? '';
        final themeType = state.uri.queryParameters['themeType'] ?? 'TEMPLATE';
        final themeOrgId =
            int.tryParse(state.uri.queryParameters['themeOrgId'] ?? '') ?? 1;
        return AppRoutePage.cupertino<void>(
          state: state,
          child: CreateFromTemplatePage(
            templateId: templateId,
            title: title,
            videoUrl: videoUrl,
            imageUrl: imageUrl,
            themeType: themeType,
            themeOrgId: themeOrgId,
          ),
        );
      },
    ),
    GoRoute(
      path: CreateTemplateSettingsPage.path,
      name: CreateTemplateSettingsPage.name,
      redirect: (context, state) {
        if (state.extra is! CreateFromTemplateBloc) {
          return SplashPage.path;
        }
        return null;
      },
      pageBuilder: (context, state) {
        final bloc = state.extra as CreateFromTemplateBloc?;
        if (bloc == null) {
          return AppRoutePage.cupertino<void>(
            state: state,
            child: const SplashPage(),
          );
        }
        return AppRoutePage.cupertino<void>(
          state: state,
          child: CreateTemplateSettingsPage(bloc: bloc),
        );
      },
    ),
    GoRoute(
      path: GeneratingPage.path,
      name: GeneratingPage.name,
      pageBuilder: (context, state) {
        final title = state.uri.queryParameters['title'] ?? 'Image Generation';
        final imageUrl = state.uri.queryParameters['imageUrl'];
        final themeId = state.uri.queryParameters['themeId'] ?? '1';
        final themeType = state.uri.queryParameters['themeType'] ?? 'TEMPLATE';
        final themeOrgId =
            int.tryParse(state.uri.queryParameters['themeOrgId'] ?? '') ?? 1;
        final isHd = state.uri.queryParameters['isHd'] == 'true';
        final isLongTime = state.uri.queryParameters['isLongTime'] == 'true';
        final serviceType =
            state.uri.queryParameters['serviceType'] ?? 'IMAGE_TO_VIDEO';
        final videoUrl = state.uri.queryParameters['videoUrl'];
        final prompt = state.uri.queryParameters['prompt'];
        final heroTag = state.uri.queryParameters['heroTag'];
        return AppRoutePage.fade<void>(
          state: state,
          duration: const Duration(milliseconds: 400),
          child: GeneratingPage(
            title: title,
            imageUrl: imageUrl,
            themeId: themeId,
            themeType: themeType,
            themeOrgId: themeOrgId,
            isHd: isHd,
            isLongTime: isLongTime,
            serviceType: serviceType,
            videoUrl: videoUrl,
            prompt: prompt,
            heroTag: heroTag,
          ),
        );
      },
    ),
    GoRoute(
      path: ResultPage.path,
      name: ResultPage.name,
      pageBuilder: (context, state) {
        final extraArgs = state.extra as ResultPageArgs?;
        final videoId =
            extraArgs?.videoId ?? state.uri.queryParameters['videoId'] ?? '';
        final title =
            extraArgs?.title ??
            state.uri.queryParameters['title'] ??
            'Image Generation';

        final rawImageUrl = state.uri.queryParameters['imageUrl'] ?? '';
        final imageUrl =
            extraArgs?.imageUrl ??
            (rawImageUrl.isNotEmpty ? Uri.decodeComponent(rawImageUrl) : '');

        final rawVideoUrl = state.uri.queryParameters['videoUrl'] ?? '';
        final videoUrl =
            extraArgs?.videoUrl ??
            (rawVideoUrl.isNotEmpty ? Uri.decodeComponent(rawVideoUrl) : '');

        final createdAt =
            extraArgs?.createdAt ??
            state.uri.queryParameters['createdAt'] ??
            '';

        final serviceType =
            extraArgs?.serviceType ??
            state.uri.queryParameters['serviceType'] ??
            'IMAGE_TO_VIDEO';

        final rawVideoUrlSrc = state.uri.queryParameters['videoUrlSrc'] ?? '';
        final videoUrlSrc =
            extraArgs?.videoUrlSrc ??
            (rawVideoUrlSrc.isNotEmpty
                ? Uri.decodeComponent(rawVideoUrlSrc)
                : null);

        final themeId =
            extraArgs?.themeId ?? state.uri.queryParameters['themeId'] ?? '1';
        final themeType =
            extraArgs?.themeType ??
            state.uri.queryParameters['themeType'] ??
            'TEMPLATE';
        final themeOrgId =
            extraArgs?.themeOrgId ??
            int.tryParse(state.uri.queryParameters['themeOrgId'] ?? '') ??
            1;
        final isHd =
            extraArgs?.isHd ?? state.uri.queryParameters['isHd'] == 'true';
        final isLongTime =
            extraArgs?.isLongTime ??
            state.uri.queryParameters['isLongTime'] == 'true';
        final fromGeneration =
            extraArgs?.fromGeneration ??
            state.uri.queryParameters['fromGeneration'] == 'true';

        if (fromGeneration) {
          return AppRoutePage.fade<void>(
            state: state,
            duration: const Duration(milliseconds: 400),
            child: ResultPage(
              videoId: videoId,
              title: title,
              imageUrl: imageUrl,
              videoUrl: videoUrl,
              createdAt: createdAt,
              serviceType: serviceType,
              videoUrlSrc: videoUrlSrc,
              themeId: themeId,
              themeType: themeType,
              themeOrgId: themeOrgId,
              isHd: isHd,
              isLongTime: isLongTime,
              fromGeneration: fromGeneration,
            ),
          );
        }

        return AppRoutePage.cupertino<void>(
          state: state,
          child: ResultPage(
            videoId: videoId,
            title: title,
            imageUrl: imageUrl,
            videoUrl: videoUrl,
            createdAt: createdAt,
            serviceType: serviceType,
            videoUrlSrc: videoUrlSrc,
            themeId: themeId,
            themeType: themeType,
            themeOrgId: themeOrgId,
            isHd: isHd,
            isLongTime: isLongTime,
            fromGeneration: fromGeneration,
          ),
        );
      },
    ),
    GoRoute(
      path: IapPage.path,
      name: IapPage.name,
      pageBuilder: (context, state) {
        final videoUrl = state.uri.queryParameters['videoUrl'] ?? '';
        final fromSplash = state.uri.queryParameters['fromSplash'] == 'true';
        return AppRoutePage.fullscreenDialog<void>(
          state: state,
          child: IapPage(videoUrl: videoUrl, fromSplash: fromSplash),
        );
      },
    ),
    GoRoute(
      path: BuyCreditsPage.path,
      name: BuyCreditsPage.name,
      pageBuilder: (context, state) => AppRoutePage.fullscreenDialog<void>(
        state: state,
        child: const BuyCreditsPage(),
      ),
    ),
    GoRoute(
      path: GenerationIapPage.path,
      name: GenerationIapPage.name,
      pageBuilder: (context, state) {
        final videoUrl = state.uri.queryParameters['videoUrl'] ?? '';
        return AppRoutePage.fullscreenDialog<void>(
          state: state,
          child: GenerationIapPage(videoUrl: videoUrl),
        );
      },
    ),
    GoRoute(
      path: GenerationBuyCreditsPage.path,
      name: GenerationBuyCreditsPage.name,
      pageBuilder: (context, state) {
        final videoUrl = state.uri.queryParameters['videoUrl'] ?? '';
        return AppRoutePage.fullscreenDialog<void>(
          state: state,
          child: GenerationBuyCreditsPage(videoUrl: videoUrl),
        );
      },
    ),
    GoRoute(
      path: DiscountPage.path,
      name: DiscountPage.name,
      pageBuilder: (context, state) {
        final fromSplash = state.uri.queryParameters['fromSplash'] == 'true';
        return AppRoutePage.fade<void>(
          state: state,
          duration: const Duration(seconds: 1),
          child: DiscountPage(fromSplash: fromSplash),
        );
      },
    ),
    GoRoute(
      path: DebugPage.path,
      name: DebugPage.name,
      pageBuilder: (context, state) =>
          AppRoutePage.cupertino<void>(state: state, child: const DebugPage()),
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
    GoRoute(
      path: VideoTrimPage.path,
      name: VideoTrimPage.name,
      pageBuilder: (context, state) {
        final videoPath = state.uri.queryParameters['videoPath'] ?? '';
        return AppRoutePage.cupertino<String?>(
          state: state,
          child: VideoTrimPage(videoPath: videoPath),
        );
      },
    ),
  ],
);
