import 'package:ai_video_flutter/core/theme/app_colors.dart';
import 'package:ai_video_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../core/errors/backend_error_handler.dart';
import 'package:core_business/core_business.dart';
import '../../../../i18n/strings.g.dart';
import '../../../templates/presentation/pages/templates_page.dart';
import '../widgets/home_banner_widget.dart';
import '../widgets/home_features_grid_widget.dart';
import '../widgets/home_templates_section_widget.dart';
import '../../../../core/widgets/credit_badge_widget.dart';
import '../../../../core/widgets/checkin_widget.dart';

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
                                          ...categories.asMap().entries.map((entry) {
                                            final index = entry.key;
                                            final category = entry.value;
                                            final themes = category.theme ?? [];
                                            if (themes.isEmpty)
                                              return const SizedBox.shrink();

                                            // Random/Diverse select from the 5 SVG icons shown in the picture
                                            final iconAsset = [
                                              Assets.icons.icLayerYellow,
                                              Assets.icons.icBlueMask,
                                              Assets.icons.icPurpleBox,
                                              Assets.icons.icAiYellow,
                                              Assets.icons.icTrending,
                                            ][index % 5];

                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 28,
                                              ),
                                              child: HomeTemplatesSectionWidget(
                                                title: _getTranslatedCategory(
                                                  context,
                                                  category.name,
                                                ),
                                                iconAsset: iconAsset,
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
                                      error: (failure) => Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 40,
                                          ),
                                          child: Text(
                                            BackendErrorHelper.getErrorMessage(context, failure.toErrorCodeOrMessage()),
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
                                    Image.asset(
                                      Assets.images.icLogoHome.path,
                                      height: 42,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const CheckInWidget(),
                                    const SizedBox(width: 4),
                                    const CreditBadgeWidget(),
                                  ],
                                ),
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
