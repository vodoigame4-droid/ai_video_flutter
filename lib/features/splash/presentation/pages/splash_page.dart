import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';
import '../../../premium/presentation/pages/iap_page.dart';
import '../../../../core/services/remote_config_service.dart';
import '../../../onboarding/presentation/pages/onboarding_page.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';
import '../bloc/splash_state.dart';
import '../widgets/logo_section_widget.dart';
import '../widgets/progress_section_widget.dart';

class SplashPage extends StatelessWidget {
  static const String path = '/';
  static const String name = 'splash';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => sl<SplashBloc>()..add(const SplashEvent.init()),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000200),
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (successState) {
              if (!successState.isOnboardingCompleted) {
                OnboardingPage.go(
                  context,
                  preloadedImages: successState.preloadedUrls,
                );
              } else if (successState.isVip || !sl<RemoteConfigService>().showIAP) {
                DashboardPage.go(context);
              } else {
                _navigateToIapAndHome(context);
              }
            },
          );
        },
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg_splash.png',
                fit: BoxFit.cover,
              ).animate().scale(
                begin: const Offset(1.25, 1.25),
                end: const Offset(1.0, 1.0),
                duration: const Duration(seconds: 4),
                curve: Curves.easeOutCubic,
              ).fade(
                begin: 0.0,
                end: 1.0,
                duration: const Duration(milliseconds: 1200),
                curve: Curves.easeOut,
              ),
            ),
            // Center Logo & Title
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 100.0),
                child: LogoSectionWidget(),
              ),
            ),
            // Bottom Progress section
            const Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Center(
                child: ProgressSectionWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateToIapAndHome(BuildContext context) async {
    await context.pushNamed(
      IapPage.name,
      queryParameters: {
        'fromSplash': 'true',
      },
    );
    if (context.mounted) {
      DashboardPage.go(context);
    }
  }
}
