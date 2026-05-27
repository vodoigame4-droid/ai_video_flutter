import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../i18n/strings.g.dart';
import '../blocs/home_bloc.dart';
import '../blocs/home_event.dart';
import '../blocs/home_state.dart';
import '../widgets/category_selector.dart';
import '../widgets/leave_alert_dialog.dart';
import '../widgets/video_card.dart';
import '../widgets/video_settings_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(const HomeEvent.init()),
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
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
              error: (message) => Center(
                child: Text(
                  message,
                  style: AppTextStyles.bodyNormal.copyWith(color: AppColors.heart),
                ),
              ),
              loaded: (categories, selectedCategory, trendingVideos, newVideos, currentLocale) {
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
                                  style: AppTextStyles.appName,
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: const BoxDecoration(
                                    gradient: AppColors.primaryGradient,
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: Text(
                                    t.common.pro,
                                    style: AppTextStyles.proBadgeText,
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
                      CategorySelector(
                        categories: categories,
                        selectedCategory: selectedCategory,
                        onSelected: (category) {
                          context.read<HomeBloc>().add(HomeEvent.selectCategory(category));
                        },
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
                                const Icon(
                                  Icons.bolt_rounded,
                                  color: AppColors.primary,
                                  size: 20,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  t.home.trending,
                                  style: AppTextStyles.sectionTitle,
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                t.common.see_all,
                                style: AppTextStyles.seeAllText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
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
                      const SizedBox(height: 28),

                      // New Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.fiber_new_rounded,
                                  color: AppColors.secondary,
                                  size: 20,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  t.home.new_section,
                                  style: AppTextStyles.sectionTitle,
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                t.common.see_all,
                                style: AppTextStyles.seeAllText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
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
        color: AppColors.surface,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(icon, color: AppColors.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.bodyNormal.copyWith(fontWeight: FontWeight.bold),
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
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: currentLocale,
          dropdownColor: AppColors.surface,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          items: flagMap.entries.map((e) {
            return DropdownMenuItem<String>(
              value: e.key,
              child: Text(
                '${e.value}  ${e.key.toUpperCase()}',
                style: AppTextStyles.bodyNormal,
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
      backgroundColor: Colors.transparent,
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
