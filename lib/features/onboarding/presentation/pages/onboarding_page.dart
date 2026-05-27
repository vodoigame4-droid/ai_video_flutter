import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';
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

  static void go(BuildContext context) => context.goNamed(name);

  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
      create: (context) => sl<OnboardingBloc>()..add(const OnboardingEvent.init()),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          state.mapOrNull(
            currentPage: (currentState) {
              if (currentState.isCompleted) {
                DashboardPage.go(context);
                return;
              }
              if (_pageController.hasClients &&
                  _pageController.page?.round() != currentState.index) {
                _pageController.animateToPage(
                  currentState.index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          );
        },
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return PageView(
              controller: _pageController,
              onPageChanged: (index) {
                context.read<OnboardingBloc>().add(OnboardingEvent.pageChanged(index));
              },
              children: [
                ObPage1(
                  onButtonPressed: () =>
                      context.read<OnboardingBloc>().add(const OnboardingEvent.nextPage()),
                ),
                ObPage2(
                  onButtonPressed: () =>
                      context.read<OnboardingBloc>().add(const OnboardingEvent.nextPage()),
                ),
                ObPage3(
                  onButtonPressed: () =>
                      context.read<OnboardingBloc>().add(const OnboardingEvent.nextPage()),
                ),
                ObPage4(
                  onButtonPressed: () =>
                      context.read<OnboardingBloc>().add(const OnboardingEvent.nextPage()),
                ),
                ObPage5(
                  onButtonPressed: () =>
                      context.read<OnboardingBloc>().add(const OnboardingEvent.nextPage()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
