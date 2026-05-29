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
            ready: (
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
                    // Top Banner Section
                    const HomeBannerWidget(),

                    const SizedBox(height: 16),

                    // Grid of 4 glassmorphic feature action buttons
                    const HomeFeaturesGridWidget(),

                    const SizedBox(height: 24),

                    // Category Selector Row
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
                    HomeTemplatesSectionWidget(
                      title: t.home.trending,
                      icon: Icons.bolt_rounded,
                      iconColor: context.colorScheme.primary,
                      videosState: trendingVideosState,
                      onSeeAllPressed: () => context.pushNamed(
                        TemplatesPage.name,
                        queryParameters: {'category': 'Trending'},
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
              );
            },
          );
        },
      ),
    );
  }
}
