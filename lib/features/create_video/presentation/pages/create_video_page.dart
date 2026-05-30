import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import 'package:core_business/core_business.dart';
import 'generating_page.dart';
import '../widgets/create_video_tab_bar_widget.dart';
import '../widgets/image_to_video_tab.dart';
import '../widgets/image_to_dance_tab.dart';
import '../widgets/transition_video_tab.dart';
import '../widgets/unified_video_tab.dart';

class CreateVideoPage extends StatelessWidget {
  static const String path = '/create-video';
  static const String name = 'create_video';

  final int initialTab;

  const CreateVideoPage({super.key, required this.initialTab});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CreateVideoBloc>()..add(CreateVideoEvent.init(initialTab)),
      child: const CreateVideoView(),
    );
  }
}

class CreateVideoView extends StatelessWidget {
  const CreateVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      body: BlocListener<CreateVideoBloc, CreateVideoState>(
        listener: (context, state) {
          state.mapOrNull(
            ready: (readyState) {
              if (readyState.isGenerating) {
                context.pushNamed(
                  GeneratingPage.name,
                  queryParameters: {
                    'title': readyState.customPrompt.trim().isEmpty
                        ? t.profile.imageGeneration
                        : readyState.customPrompt,
                    'imageUrl': readyState.slotsPaths.firstWhere(
                          (p) => p != null,
                          orElse: () => '',
                        ) ?? '',
                  },
                );
              }
            },
          );
        },
        child: BlocBuilder<CreateVideoBloc, CreateVideoState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(
                child: Text(message, style: context.appTheme.errorTextStyle),
              ),
              ready:
                  (
                    selectedTab,
                    customPrompt,
                    inspireMeCount,
                    slotsPaths,
                    quality,
                    duration,
                    isGenerating,
                    isSuccess,
                  ) {
                    return SafeArea(
                      child: Column(
                        children: [
                          // Header
                          _buildHeader(context),
                          SizedBox(height: 16),

                          // Tab Bar selector
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CreateVideoTabBarWidget(
                              selectedIndex: selectedTab,
                              onTabSelected: (index) {
                                context.read<CreateVideoBloc>().add(
                                  CreateVideoEvent.changeTab(index),
                                );
                              },
                              onHistoryPressed: () {
                                context.pushNamed(ProfilePage.name);
                              },
                            ),
                          ),

                          // The selected tab view
                          Expanded(child: _buildSelectedTab(selectedTab)),
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

  Widget _buildHeader(BuildContext context) {
    final t = context.t;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => context.pop(),
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.black.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: AppColors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          Text(t.create.generate_title, style: context.textTheme.titleLarge),
        ],
      ),
    );
  }

  Widget _buildSelectedTab(int index) {
    switch (index) {
      case 0:
        return const ImageToVideoTab();
      case 1:
        return const TransitionVideoTab();
      case 2:
        return const ImageToDanceTab();
      case 3:
        return const UnifiedVideoTab();
      default:
        return const SizedBox.shrink();
    }
  }
}
