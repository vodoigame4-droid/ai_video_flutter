import 'package:ai_video_flutter/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/resources/resource.dart';
import '../../../../../i18n/strings.g.dart';
import '../../../templates/presentation/pages/templates_page.dart';
import '../blocs/home_bloc.dart';
import '../blocs/home_event.dart';
import '../blocs/home_state.dart';
import '../widgets/category_selector.dart';
import '../widgets/home_banner_widget.dart';
import '../widgets/home_features_grid_widget.dart';
import '../widgets/home_templates_section_widget.dart';
import '../../../../core/widgets/credit_badge_widget.dart';
import '../../../../core/widgets/app_background.dart';

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
      backgroundColor: Colors.black,
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
                  return Stack(
                    children: [
                      // Layer 1: Fixed Banner Background
                      const Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: HomeBannerWidget(),
                      ),

                      // Layer 2: Scrollable List (scrolls on top of the banner)
                      Positioned.fill(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(height: 250),
                              const HomeFeaturesGridWidget(),
                              Container(
                                color: AppColors
                                    .background, // Solid background color to cover the banner area as we scroll down
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),

                                    // Category Selector Row
                                    categoriesState.when(
                                      initial: () => const SizedBox.shrink(),
                                      loading: () => const SizedBox(
                                        height: 37,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
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
                                          style:
                                              context.appTheme.errorTextStyle,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 24),

                                    // Trending Section
                                    HomeTemplatesSectionWidget(
                                      title: t.home.trending,
                                      icon: Icons.bolt_rounded,
                                      iconColor: context.colorScheme.primary,
                                      videosState: trendingVideosState,
                                      onSeeAllPressed: () => context.pushNamed(
                                        TemplatesPage.name,
                                        queryParameters: {
                                          'category': 'Trending',
                                        },
                                      ),
                                    ),

                                    const SizedBox(height: 28),

                                    // New Section
                                    HomeTemplatesSectionWidget(
                                      title: t.home.new_section,
                                      icon: Icons.fiber_new_rounded,
                                      iconColor: context.colorScheme.secondary,
                                      videosState: newVideosState,
                                      onSeeAllPressed: () => context.pushNamed(
                                        TemplatesPage.name,
                                        queryParameters: {'category': 'New'},
                                      ),
                                    ),

                                    // Spacing so the content scrolls fully past the floating navigation bar
                                    const SizedBox(height: 120),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Layer 3: Fixed Header Row at the top
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: SafeArea(
                          bottom: false,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      t.home.title,
                                      style: context.textTheme.displayMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      'assets/images/pro_badge_icon.png',
                                      height: 22,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                                const CreditBadgeWidget(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
          );
        },
      ),
    );
  }
}
