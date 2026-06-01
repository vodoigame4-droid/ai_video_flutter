import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../create_video/presentation/pages/create_video_page.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class DashboardPage extends StatelessWidget {
  static const String path = '/dashboard';
  static const String name = 'dashboard';

  final StatefulNavigationShell navigationShell;

  static void go(BuildContext context) => context.goNamed(HomePage.name);

  const DashboardPage({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<DashboardBloc>()..add(DashboardEvent.init(initialTab: navigationShell.currentIndex)),
      child: DashboardView(navigationShell: navigationShell),
    );
  }
}

class DashboardView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const DashboardView({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    final int currentIndex = navigationShell.currentIndex;

    // Sync GoRouter shell navigation tab index back to DashboardBloc
    final dashboardBloc = context.read<DashboardBloc>();
    final currentBlocTab = dashboardBloc.state.maybeWhen(
      currentTab: (index) => index,
      orElse: () => 0,
    );
    if (currentBlocTab != currentIndex) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          context.read<DashboardBloc>().add(DashboardEvent.changeTab(currentIndex));
        }
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Screen content
          Positioned.fill(
            child: navigationShell,
          ),
          // Floating Bottom Nav Bar
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: CustomBottomNavBar(
                selectedIndex: currentIndex,
                onTabSelected: (index) {
                  context.read<DashboardBloc>().add(
                    DashboardEvent.changeTab(index),
                  );
                  navigationShell.goBranch(
                    index,
                    initialLocation: index == currentIndex,
                  );
                },
                onCreatePressed: () {
                  context.pushNamed(
                    CreateVideoPage.name,
                    queryParameters: {'tab': '0'},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
