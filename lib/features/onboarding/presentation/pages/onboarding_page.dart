import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:core_business/core_business.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';
import '../../../premium/presentation/pages/iap_page.dart';
import '../../../../core/services/remote_config_service.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_event.dart';
import '../bloc/onboarding_state.dart';
import '../widgets/ob_page_1.dart';
import '../widgets/ob_page_2.dart';
import '../widgets/ob_page_3.dart';
import '../widgets/ob_page_4.dart';
import '../widgets/ob_page_5.dart';

class OnboardingPage extends StatelessWidget {
  static const String path = '/onboarding';
  static const String name = 'onboarding';

  static void go(BuildContext context, {List<String>? preloadedImages}) =>
      context.goNamed(name, extra: preloadedImages);

  final List<String>? preloadedImages;

  const OnboardingPage({super.key, this.preloadedImages});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
      create: (context) =>
          sl<OnboardingBloc>()
            ..add(OnboardingEvent.init(preloadedImages: preloadedImages)),
      child: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onOnboardingCompleted(BuildContext context) async {
    bool isVip = false;
    try {
      final cachedUser = sl<AuthRepository>().cachedUser;
      if (cachedUser != null) {
        isVip = cachedUser.isVip;
      } else {
        final user = await sl<WatchProfileUseCase>()().first.timeout(
          const Duration(milliseconds: 300),
        );
        isVip = user.isVip;
      }
    } catch (e) {
      LogUtils.w(
        'OnboardingView: Failed to check VIP status, defaulting to false: $e',
      );
    }

    if (context.mounted) {
      if (isVip || !sl<RemoteConfigService>().showIAP) {
        DashboardPage.go(context);
      } else {
        await context.pushNamed(
          IapPage.name,
          queryParameters: {'fromSplash': 'true'},
        );
        if (context.mounted) {
          DashboardPage.go(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          state.maybeWhen(
            ready: (images, index, isCompleted) {
              if (isCompleted) {
                _onOnboardingCompleted(context);
                return;
              }
              if (_pageController.hasClients &&
                  _pageController.page?.round() != index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            orElse: () {},
          );
        },
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
              ready: (images, index, isCompleted) {
                return PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  allowImplicitScrolling: true,
                  onPageChanged: (newIndex) {
                    context.read<OnboardingBloc>().add(
                      OnboardingEvent.pageChanged(newIndex),
                    );
                  },
                  itemBuilder: (context, pageIndex) {
                    void onButtonPressed() => context
                        .read<OnboardingBloc>()
                        .add(const OnboardingEvent.nextPage());

                    final page = switch (pageIndex) {
                      0 => ObPage1(
                        backgroundImage: images[pageIndex],
                        onButtonPressed: onButtonPressed,
                      ),
                      1 => ObPage2(
                        backgroundImage: images[pageIndex],
                        onButtonPressed: onButtonPressed,
                      ),
                      2 => ObPage3(
                        backgroundImage: images[pageIndex],
                        onButtonPressed: onButtonPressed,
                      ),
                      3 => ObPage4(
                        backgroundImage: images[pageIndex],
                        onButtonPressed: onButtonPressed,
                      ),
                      _ => ObPage5(
                        backgroundImage: images[pageIndex],
                        onButtonPressed: onButtonPressed,
                      ),
                    };

                    return TickerMode(enabled: pageIndex == index, child: page);
                  },
                );
              },
              error: (message) => Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
