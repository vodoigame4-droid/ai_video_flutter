import 'package:ai_video_flutter/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../../core/theme/app_theme.dart';
import 'package:core_business/core_business.dart';
import '../../../../i18n/strings.g.dart';
import '../../../templates/presentation/pages/templates_page.dart';
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

  IconData _getIconForCategory(String name) {
    switch (name.toLowerCase()) {
      case 'trending':
        return Icons.bolt_rounded;
      case 'new':
      case 'new_section':
        return Icons.fiber_new_rounded;
      case 'popular':
        return Icons.star_rounded;
      case 'toy box':
      case 'toy figure box':
        return Icons.smart_toy_rounded;
      case 'epic morph':
        return Icons.transform_rounded;
      case 'anime':
        return Icons.face_rounded;
      default:
        return Icons.movie_creation_outlined;
    }
  }

  Color _getIconColorForCategory(String name, BuildContext context) {
    switch (name.toLowerCase()) {
      case 'trending':
        return context.colorScheme.primary;
      case 'new':
      case 'new_section':
        return context.colorScheme.secondary;
      case 'popular':
        return Colors.orangeAccent;
      case 'toy box':
      case 'toy figure box':
        return Colors.purpleAccent;
      case 'epic morph':
        return Colors.lightBlueAccent;
      case 'anime':
        return Colors.pinkAccent;
      default:
        return Colors.white70;
    }
  }

  String _getTranslatedCategory(BuildContext context, String category) {
    final t = Translations.of(context);
    switch (category.toLowerCase()) {
      case 'all':
        return t.templates.all;
      case 'trending':
        return t.home.trending;
      case 'new':
        return t.home.new_section;
      case 'toy box':
      case 'toy figure box':
        return t.home.toy_box;
      case 'epic morph':
        return t.home.epic_morph;
      case 'anime':
        return t.home.anime;
      default:
        return category;
    }
  }

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
                                    const SizedBox(height: 8),

                                    // Category Selector Row & Dynamic Sections
                                    categoriesState.when(
                                      initial: () => const SizedBox.shrink(),
                                      loading: () => const SizedBox(
                                        height: 200,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                      success: (categories) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // CategorySelector(
                                          //   categories: categories.map((c) => c.name).toList(),
                                          //   selectedCategory: selectedCategory,
                                          //   onSelected: (category) {
                                          //     context.read<HomeBloc>().add(
                                          //       HomeEvent.selectCategory(category),
                                          //     );
                                          //     // Navigate directly to TemplatesPage with this category selected
                                          //     context.pushNamed(
                                          //       TemplatesPage.name,
                                          //       queryParameters: {
                                          //         'category': category,
                                          //       },
                                          //     );
                                          //   },
                                          // ),
                                          // const SizedBox(height: 24),
                                          ...categories.map((category) {
                                            final themes = category.theme ?? [];
                                            if (themes.isEmpty)
                                              return const SizedBox.shrink();

                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 28,
                                              ),
                                              child: HomeTemplatesSectionWidget(
                                                title: _getTranslatedCategory(
                                                  context,
                                                  category.name,
                                                ),
                                                icon: _getIconForCategory(
                                                  category.name,
                                                ),
                                                iconColor:
                                                    _getIconColorForCategory(
                                                      category.name,
                                                      context,
                                                    ),
                                                videosState: Resource.success(
                                                  themes,
                                                ),
                                                onSeeAllPressed: () =>
                                                    context.pushNamed(
                                                      TemplatesPage.name,
                                                      queryParameters: {
                                                        'category':
                                                            category.name,
                                                      },
                                                    ),
                                              ),
                                            );
                                          }).toList(),
                                        ],
                                      ),
                                      empty: () => const SizedBox.shrink(),
                                      error: (message) => Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 40,
                                          ),
                                          child: Text(
                                            message,
                                            style:
                                                context.appTheme.errorTextStyle,
                                          ),
                                        ),
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
