import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/resources/resource.dart';
import '../../../../../i18n/strings.g.dart';
import '../blocs/home_bloc.dart';
import '../blocs/home_event.dart';
import '../blocs/home_state.dart';
import '../widgets/category_selector.dart';
import '../widgets/video_card.dart';
import '../widgets/video_settings_sheet.dart';

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
            initial: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (message) => Center(
              child: Text(
                message,
                style: context.appTheme.errorTextStyle,
              ),
            ),
            ready: (categoriesState, selectedCategory, trendingVideosState, newVideosState, currentLocale) {
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
                              image: AssetImage('assets/images/home_banner.png'),
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 12),
                                // Header Row: Title, PRO badge, Language dropdown
                                Row(
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
                                    _buildLanguageDropdown(context, currentLocale),
                                  ],
                                ),
                                const SizedBox(height: 48),
                                // Inner Banner Title
                                Text(
                                  t.home_new.welcomeToAppName,
                                  style: context.appTheme.onboardingTitleStyle,
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
                              onTap: () => _showSettingsSheet(context),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _buildFeatureItem(
                              context,
                              icon: Icons.auto_awesome_motion_outlined,
                              label: t.home_new.transitionVideo,
                              onTap: () => _showSettingsSheet(context),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _buildFeatureItem(
                              context,
                              icon: Icons.directions_run_outlined,
                              label: t.home_new.imageToDance,
                              onTap: () => _showSettingsSheet(context),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _buildFeatureItem(
                              context,
                              icon: Icons.grid_view_outlined,
                              label: t.home_new.unifiedVideo,
                              onTap: () => _showSettingsSheet(context),
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
                          context.read<HomeBloc>().add(HomeEvent.selectCategory(category));
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
                            onPressed: () {},
                            child: Text(
                              t.common.see_all,
                            ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          separatorBuilder: (context, index) => const SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            return VideoCard(title: trendingVideos[index]);
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
                            onPressed: () {},
                            child: Text(
                              t.common.see_all,
                            ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          separatorBuilder: (context, index) => const SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            return VideoCard(title: newVideos[index]);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
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
  );
}

  Widget _buildLanguageDropdown(BuildContext context, String currentLocale) {
    final flagMap = {
      'en': '🇬🇧',
      'vi': '🇻🇳',
      'fr': '🇫🇷',
      'de': '🇩🇪',
      'es': '🇪🇸',
      'pt': '🇵🇹',
      'ar': '🇸🇦',
      'hi': '🇮🇳',
      'id': '🇮🇩',
      'ja': '🇯🇵',
      'ko': '🇰🇷',
      'zh': '🇨🇳',
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: currentLocale,
          dropdownColor: context.colorScheme.surface,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          items: flagMap.entries.map((e) {
            return DropdownMenuItem<String>(
              value: e.key,
              child: Text(
                '${e.value}  ${e.key.toUpperCase()}',
                style: context.textTheme.bodyMedium,
              ),
            );
          }).toList(),
          onChanged: (val) {
            if (val != null) {
              final newLocale = AppLocale.values.firstWhere((element) => element.languageCode == val);
              LocaleSettings.setLocale(newLocale);
              context.read<HomeBloc>().add(HomeEvent.changeLanguage(val));
            }
          },
        ),
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
