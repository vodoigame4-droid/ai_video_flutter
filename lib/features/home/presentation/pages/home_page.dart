import 'package:ai_video_flutter/core/widgets/credit_badge_widget.dart';
import 'package:ai_video_flutter/core/widgets/gradient_border_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/resources/resource.dart';
import '../../../../../i18n/strings.g.dart';
import '../../../templates/presentation/pages/templates_page.dart';
import '../../../create_video/presentation/pages/create_video_page.dart';
import '../blocs/home_bloc.dart';
import '../blocs/home_event.dart';
import '../blocs/home_state.dart';
import '../widgets/category_selector.dart';
import '../../../../core/widgets/video_card.dart';
import '../../../video_player/presentation/pages/video_player_page.dart';

class HomePage extends StatelessWidget {
  static const String path = '/home';
  static const String name = 'home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(const HomeEvent.init()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(
              child: Text(message, style: context.appTheme.errorTextStyle),
            ),
            ready:
                (
                  categoriesState,
                  selectedCategory,
                  trendingVideosState,
                  newVideosState,
                  currentLocale,
                ) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top Banner Stack
                        Stack(
                          children: [
                            // Banner background image
                            Container(
                              height: 250,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/home_banner.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Dark gradient overlay
                            Container(
                              height: 250,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withValues(alpha: 0.6),
                                    Colors.black.withValues(alpha: 0.1),
                                    Colors.black.withValues(alpha: 0.8),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                            // Content over the banner
                            SafeArea(
                              bottom: false,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 12),
                                    // Header Row: Title, PRO badge, Language dropdown
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              t.home.title,
                                              style: context
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                            const SizedBox(width: 8),
                                            Image.asset(
                                              'assets/images/pro_badge_icon.png',
                                              height: 22,
                                              fit: BoxFit.contain,
                                            ),
                                          ],
                                        ),
                                        CreditBadgeWidget(),
                                      ],
                                    ),
                                    const SizedBox(height: 48),
                                    // Inner Banner Title
                                    Text(
                                      t.home_new.welcomeToAppName,
                                      style:
                                          context.appTheme.onboardingTitleStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Banner Overlay Features Row (4 Glassmorphic action buttons)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: _buildFeatureItem(
                                  context,
                                  icon: Icons.movie_creation_outlined,
                                  label: t.home_new.imageToVideo,
                                  onTap: () {
                                    context.pushNamed(
                                      CreateVideoPage.name,
                                      queryParameters: {'tab': '0'},
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _buildFeatureItem(
                                  context,
                                  icon: Icons.auto_awesome_motion_outlined,
                                  label: t.home_new.transitionVideo,
                                  onTap: () {
                                    context.pushNamed(
                                      CreateVideoPage.name,
                                      queryParameters: {'tab': '1'},
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _buildFeatureItem(
                                  context,
                                  icon: Icons.directions_run_outlined,
                                  label: t.home_new.imageToDance,
                                  onTap: () {
                                    context.pushNamed(
                                      CreateVideoPage.name,
                                      queryParameters: {'tab': '2'},
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _buildFeatureItem(
                                  context,
                                  icon: Icons.grid_view_outlined,
                                  label: t.home_new.unifiedVideo,
                                  onTap: () {
                                    context.pushNamed(
                                      CreateVideoPage.name,
                                      queryParameters: {'tab': '3'},
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Category Selector
                        categoriesState.when(
                          initial: () => const SizedBox.shrink(),
                          loading: () => const SizedBox(
                            height: 37,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                          success: (categories) => CategorySelector(
                            categories: categories,
                            selectedCategory: selectedCategory,
                            onSelected: (category) {
                              context.read<HomeBloc>().add(
                                HomeEvent.selectCategory(category),
                              );
                            },
                          ),
                          empty: () => const SizedBox.shrink(),
                          error: (message) => Center(
                            child: Text(
                              message,
                              style: context.appTheme.errorTextStyle,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Trending Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.bolt_rounded,
                                    color: context.colorScheme.primary,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    t.home.trending,
                                    style: context.textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () => context.pushNamed(
                                  TemplatesPage.name,
                                  queryParameters: {'category': 'Trending'},
                                ),
                                child: Text(t.common.see_all),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        trendingVideosState.when(
                          initial: () => const SizedBox.shrink(),
                          loading: () => const SizedBox(
                            height: 236,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                          success: (trendingVideos) => SizedBox(
                            height: 236,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: trendingVideos.length,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 12),
                              itemBuilder: (context, index) {
                                return VideoCard(
                                  title: trendingVideos[index],
                                  width: 158,
                                  height: 236,
                                  onTap: () {
                                    const mockVideoUrl = 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
                                    context.pushNamed(
                                      VideoPlayerPage.name,
                                      queryParameters: {
                                        'videoUrl': mockVideoUrl,
                                        'title': trendingVideos[index],
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          empty: () => const SizedBox.shrink(),
                          error: (message) => Center(
                            child: Text(
                              message,
                              style: context.appTheme.errorTextStyle,
                            ),
                          ),
                        ),

                        const SizedBox(height: 28),

                        // New Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.fiber_new_rounded,
                                    color: context.colorScheme.secondary,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    t.home.new_section,
                                    style: context.textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () => context.pushNamed(
                                  TemplatesPage.name,
                                  queryParameters: {'category': 'New'},
                                ),
                                child: Text(t.common.see_all),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        newVideosState.when(
                          initial: () => const SizedBox.shrink(),
                          loading: () => const SizedBox(
                            height: 236,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                          success: (newVideos) => SizedBox(
                            height: 236,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: newVideos.length,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 12),
                              itemBuilder: (context, index) {
                                return VideoCard(
                                  title: newVideos[index],
                                  width: 158,
                                  height: 236,
                                  onTap: () {
                                    const mockVideoUrl = 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
                                    context.pushNamed(
                                      VideoPlayerPage.name,
                                      queryParameters: {
                                        'videoUrl': mockVideoUrl,
                                        'title': newVideos[index],
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          empty: () => const SizedBox.shrink(),
                          error: (message) => Center(
                            child: Text(
                              message,
                              style: context.appTheme.errorTextStyle,
                            ),
                          ),
                        ),

                        // Spacing so the content scrolls fully past the floating navigation bar
                        const SizedBox(height: 120),
                      ],
                    ),
                  );
                },
          );
        },
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.12),
            width: 1,
          ),
        ),
        child: GradientBorderContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(height: 8),
              Text(
                label,
                style: context.appTheme.navLabelCreateStyle,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
