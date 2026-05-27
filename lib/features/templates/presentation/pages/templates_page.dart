import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/resources/resource.dart';
import '../../../../../i18n/strings.g.dart';
import '../bloc/templates_bloc.dart';
import '../bloc/templates_event.dart';
import '../bloc/templates_state.dart';
import '../../../../core/widgets/video_card.dart';
import '../../../../core/widgets/credit_badge_widget.dart';
import '../../../../features/home/presentation/widgets/video_settings_sheet.dart';
import '../widgets/category_selector_widget.dart';

class TemplatesPage extends StatelessWidget {
  static const String path = '/templates';
  static const String name = 'templates';

  final String initialCategory;

  const TemplatesPage({
    super.key,
    this.initialCategory = 'All',
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TemplatesBloc>()..add(TemplatesEvent.init(initialCategory)),
      child: const TemplatesView(),
    );
  }
}

class TemplatesView extends StatelessWidget {
  const TemplatesView({super.key});

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
      body: Stack(
        children: [
          // Main Scrollable Content
          SafeArea(
            child: BlocBuilder<TemplatesBloc, TemplatesState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(child: CircularProgressIndicator()),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (msg) => Center(
                    child: Text(msg, style: context.appTheme.errorTextStyle),
                  ),
                  ready: (categoriesState, selectedCategory, templatesState) {
                    final currentTitle = _getTranslatedCategory(context, selectedCategory);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Custom Header Row
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Glassmorphic Back Button
                              ClipOval(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(alpha: 0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: const BorderRadius.all(Radius.circular(18)),
                                        onTap: () => context.pop(),
                                        child: const Center(
                                          child: Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Screen Title
                              Expanded(
                                child: Text(
                                  currentTitle,
                                  style: context.textTheme.titleMedium?.copyWith(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ) ??
                                      const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              // PRO badge button
                              CreditBadgeWidget(
                                isPro: true,
                                onTap: () {
                                  // Handle Upgrade Action
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) => const VideoSettingsSheet(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        // Categories List Bar
                        categoriesState.when(
                          initial: () => const SizedBox.shrink(),
                          loading: () => const SizedBox(
                            height: 40,
                            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                          ),
                          success: (categories) => CategorySelectorWidget(
                            categories: categories,
                            selectedCategory: selectedCategory,
                            onSelected: (category) {
                              context.read<TemplatesBloc>().add(
                                    TemplatesEvent.selectCategory(category),
                                  );
                            },
                          ),
                          empty: () => const SizedBox.shrink(),
                          error: (msg) => Center(
                            child: Text(msg, style: context.appTheme.errorTextStyle),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Grid of Cards (Expanded to fill available height)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: templatesState.when(
                              initial: () => const SizedBox.shrink(),
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              success: (templates) {
                                return GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12,
                                    childAspectRatio: 173 / 250, // Match Figma Card Ratio
                                  ),
                                  itemCount: templates.length,
                                  padding: const EdgeInsets.only(bottom: 24),
                                  itemBuilder: (context, index) {
                                    final template = templates[index];
                                    return VideoCard(
                                      title: template.title,
                                      imageUrl: template.imageUrl,
                                      viewsCount: template.viewsCount,
                                      badgeType: template.badgeType,
                                      showPlayButton: false,
                                      showVolumeIcon: false,
                                      onTap: () {
                                        // Handle card click
                                      },
                                    );
                                  },
                                );
                              },
                              empty: () => Center(
                                child: Text(
                                  t.profile.noVideos,
                                  style: context.textTheme.bodyMedium,
                                ),
                              ),
                              error: (msg) => Center(
                                child: Text(
                                  msg,
                                  style: context.appTheme.errorTextStyle,
                                ),
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
          ),
        ],
      ),
    );
  }
}
