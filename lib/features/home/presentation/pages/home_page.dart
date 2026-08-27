import 'dart:async';
import 'package:ai_video_flutter/core/theme/app_colors.dart';
import 'package:ai_video_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../core/errors/backend_error_handler.dart';
import '../../../../core/navigation/route_observer.dart';
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
    final homeBloc = sl<HomeBloc>();
    final isInitial = homeBloc.state.maybeMap(initial: (_) => true, orElse: () => false);
    if (isInitial) {
      homeBloc.add(const HomeEvent.init());
    }
    return BlocProvider.value(
      value: homeBloc,
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final modalRoute = ModalRoute.of(context);
    if (modalRoute is PageRoute) {
      routeObserver.subscribe(this, modalRoute);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    LogUtils.d('HomeView: Returned to Home screen, refreshing home data...');
    if (mounted) {
      sl<HomeBloc>().add(const HomeEvent.refresh());
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
                        child: RefreshIndicator(
                          color: AppColors.primary,
                          backgroundColor: AppColors.background,
                          edgeOffset: 60.0,
                          onRefresh: () async {
                            final completer = Completer<void>();
                            context.read<HomeBloc>().add(
                              HomeEvent.refresh(completer: completer),
                            );
                            await completer.future;
                          },
                          child: CustomScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            slivers: [
                              // Top spacing for fixed banner
                              const SliverToBoxAdapter(
                                child: SizedBox(height: 250),
                              ),
                              // Features Grid
                              const SliverToBoxAdapter(
                                child: HomeFeaturesGridWidget(),
                              ),
                              // Categories or status states
                              ...categoriesState.when(
                                initial: () => [
                                  const SliverToBoxAdapter(
                                    child: SizedBox(height: 100),
                                  ),
                                ],
                                loading: () => [
                                  SliverToBoxAdapter(
                                    child: Container(
                                      color: AppColors.background,
                                      height: 200,
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                ],
                                success: (categories) {
                                  final validCategories = categories
                                      .where((c) => (c.theme ?? []).isNotEmpty)
                                      .toList();

                                  return [
                                    DecoratedSliver(
                                      decoration: const BoxDecoration(
                                        color: AppColors.background,
                                      ),
                                      sliver: SliverList.builder(
                                        itemCount: validCategories.length,
                                        itemBuilder: (context, index) {
                                          final category =
                                              validCategories[index];
                                          final themes = category.theme ?? [];

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
                                              key: ValueKey(category.id),
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
                                                      'category': category.name,
                                                    },
                                                  ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SliverToBoxAdapter(
                                      child: SizedBox(height: 120),
                                    ),
                                  ];
                                },
                                empty: () => [
                                  const SliverToBoxAdapter(
                                    child: SizedBox(height: 100),
                                  ),
                                ],
                                error: (failure) => [
                                  SliverToBoxAdapter(
                                    child: Container(
                                      color: AppColors.background,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 40,
                                      ),
                                      child: Center(
                                        child: Text(
                                          BackendErrorHelper.getErrorMessage(
                                            context,
                                            failure.toErrorCodeOrMessage(),
                                          ),
                                          style: context.appTheme.errorTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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

