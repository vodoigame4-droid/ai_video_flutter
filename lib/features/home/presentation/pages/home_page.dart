import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/resources/resource.dart';
import '../../../../../i18n/strings.g.dart';
import '../blocs/home_bloc.dart';
import '../blocs/home_event.dart';
import '../blocs/home_state.dart';
import '../widgets/category_selector.dart';
import '../widgets/leave_alert_dialog.dart';
import '../widgets/video_card.dart';
import '../widgets/video_settings_sheet.dart';

class HomePage extends StatelessWidget {
  static const String path = '/home';
  static const String name = 'home';

  static void go(BuildContext context) => context.goNamed(name);

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
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
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
                      const SizedBox(height: 20),
                      
                      // Branding & Language Selector Row
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    gradient: context.appTheme.primaryGradient,
                                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: Text(
                                    t.common.pro,
                                    style: context.textTheme.labelSmall,
                                  ),
                                ),
                              ],
                            ),
                            _buildLanguageDropdown(context, currentLocale),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Category list
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

                      // Quick action buttons for test/demo
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: _buildActionCard(
                                context,
                                icon: Icons.settings_rounded,
                                title: t.create.video_settings,
                                onTap: () => _showSettingsSheet(context),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildActionCard(
                                context,
                                icon: Icons.exit_to_app_rounded,
                                title: t.leave_dialog.title,
                                onTap: () => _showLeaveDialog(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),

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
                      const SizedBox(height: 32),
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

  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: context.appTheme.borderColor, width: 1),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(icon, color: context.colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: context.appTheme.bodyNormalBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
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

  void _showLeaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const LeaveAlertDialog(),
    );
  }
}
