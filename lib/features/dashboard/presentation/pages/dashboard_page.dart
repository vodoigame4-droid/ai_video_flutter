import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../home/presentation/widgets/video_settings_sheet.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class DashboardPage extends StatelessWidget {
  static const String path = '/dashboard';
  static const String name = 'dashboard';

  static void go(BuildContext context) => context.goNamed(name);

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DashboardBloc>()..add(const DashboardEvent.init()),
      child: const DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          final int currentIndex = state.when(
            initial: () => 0,
            currentTab: (index) => index,
          );

          return Stack(
            children: [
              // Screen content
              Positioned.fill(
                child: IndexedStack(
                  index: currentIndex,
                  children: const [
                    HomePage(),
                    ProfilePage(),
                  ],
                ),
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
                      context.read<DashboardBloc>().add(DashboardEvent.changeTab(index));
                    },
                    onCreatePressed: () => _showSettingsSheet(context),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showSettingsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const VideoSettingsSheet(),
    );
  }
}
