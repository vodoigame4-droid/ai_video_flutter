import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';
import '../../../../core/resources/resource.dart';

class ProfilePage extends StatelessWidget {
  static const String path = '/profile';
  static const String name = 'profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileBloc>()..add(const ProfileEvent.init()),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              ready: (subTabIndex, videosState) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      
                      // Header Row: Profile Title and Credit Icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            t.profile.title,
                            style: context.textTheme.titleLarge,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: const BorderRadius.all(Radius.circular(100)),
                              border: Border.all(
                                color: context.appTheme.lightBorderColor,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/images/credit_icon.png',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '100',
                                  style: context.appTheme.bodyNormalBold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 24),

                      // Premium Upgrade Banner
                      Container(
                        height: 140,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                            image: AssetImage('assets/images/premium_banner.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                                  color: Colors.black.withValues(alpha: 0.35),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          t.profile.upgradeTitle,
                                          style: context.textTheme.titleMedium,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          t.profile.upgradeSubtitle,
                                          style: context.textTheme.bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                      decoration: BoxDecoration(
                                        gradient: context.appTheme.primaryGradient,
                                        borderRadius: const BorderRadius.all(Radius.circular(100)),
                                      ),
                                      child: Text(
                                        t.profile.goPremium,
                                        style: context.appTheme.bodyNormalBold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Sub-tab Bar Selectors
                      Row(
                        children: [
                          Expanded(
                            child: _buildSubTabItem(
                              context,
                              index: 0,
                              label: t.profile.myVideo,
                              isSelected: subTabIndex == 0,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildSubTabItem(
                              context,
                              index: 1,
                              label: t.profile.liked,
                              isSelected: subTabIndex == 1,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Tab Content - videos state handling
                      videosState.when(
                        initial: () => const SizedBox.shrink(),
                        loading: () => const SizedBox(
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        success: (videos) {
                          // In our mock scenario it defaults to empty, but we render lists if present
                          return const SizedBox.shrink();
                        },
                        empty: () => Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 32),
                              Image.asset(
                                'assets/images/empty_history.png',
                                width: 140,
                                height: 140,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                t.profile.noVideos,
                                style: context.textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                child: Text(
                                  t.profile.noVideosDesc,
                                  style: context.textTheme.bodySmall,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        error: (errorMsg) => Center(
                          child: Text(
                            errorMsg,
                            style: context.appTheme.errorTextStyle,
                          ),
                        ),
                      ),

                      // Extra spacing at the bottom so content is not hidden by the floating bottom nav bar
                      const SizedBox(height: 120),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildSubTabItem(
    BuildContext context, {
    required int index,
    required String label,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        context.read<ProfileBloc>().add(ProfileEvent.changeSubTab(index));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : Colors.white.withValues(alpha: 0.05),
          gradient: isSelected ? context.appTheme.primaryGradient : null,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          border: isSelected
              ? null
              : Border.all(color: context.appTheme.borderColor, width: 1),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: isSelected ? context.appTheme.bodyNormalBold : context.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
