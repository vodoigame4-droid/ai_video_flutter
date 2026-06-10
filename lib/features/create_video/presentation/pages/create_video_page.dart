import 'package:ai_video_flutter/core/widgets/app_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import 'package:core_business/core_business.dart';
import '../../../../core/utils/credit_navigation_helper.dart';
import 'generating_page.dart';
import '../widgets/create_video_tab_bar_widget.dart';
import '../widgets/image_to_video_tab.dart';
import '../widgets/image_to_dance_tab.dart';
import '../widgets/transition_video_tab.dart';
import '../widgets/unified_video_tab.dart';
import '../widgets/create_video_guide_bottom_sheet.dart';
import '../../../../core/services/remote_config_service.dart';

class CreateVideoPage extends StatelessWidget {
  static const String path = '/create-video';
  static const String name = 'create_video';

  final int initialTab;

  const CreateVideoPage({super.key, required this.initialTab});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CreateVideoBloc>(param1: initialTab)..add(CreateVideoEvent.init(initialTab)),
      child: const CreateVideoView(),
    );
  }
}

class CreateVideoView extends StatelessWidget {
  const CreateVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return AppBackground(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.translucent,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            behavior: HitTestBehavior.opaque,
            child: BlocListener<CreateVideoBloc, CreateVideoState>(
          listener: (context, state) async {
            await state.mapOrNull(
              ready: (readyState) async {
                if (readyState.isGenerating) {
                  String resolvedVideoUrl = '';
                  if (readyState.selectedTab == 2) {
                    final cachedRemoteUrl = readyState.uploadedSlotsPaths.isNotEmpty
                        ? readyState.uploadedSlotsPaths[0]
                        : null;
                    resolvedVideoUrl = (cachedRemoteUrl != null && cachedRemoteUrl.isNotEmpty)
                        ? cachedRemoteUrl
                        : (readyState.slotsPaths.isNotEmpty ? (readyState.slotsPaths[0] ?? '') : '');
                  }

                  final hasInsufficient = await CreditNavigationHelper.checkInsufficientCreditsAndNavigate(
                    context,
                    videoUrl: resolvedVideoUrl,
                  );
                  if (hasInsufficient) return;

                  if (!context.mounted) return;

                  final String serviceType;
                  final String imageUrl;
                  String? videoUrl;

                  String getPathOrUrl(int index) {
                    final cachedRemoteUrl = readyState.uploadedSlotsPaths.length > index
                        ? readyState.uploadedSlotsPaths[index]
                        : null;
                    if (cachedRemoteUrl != null && cachedRemoteUrl.isNotEmpty) {
                      return cachedRemoteUrl;
                    }
                    return readyState.slotsPaths.length > index
                        ? (readyState.slotsPaths[index] ?? '')
                        : '';
                  }

                  switch (readyState.selectedTab) {
                    case 0:
                      serviceType = 'ITV_SINGLE_SOURCE';
                      imageUrl = getPathOrUrl(0);
                      break;
                    case 1:
                      serviceType = 'TRANSITION_VIDEO';
                      imageUrl = '${getPathOrUrl(0)},${getPathOrUrl(1)}';
                      break;
                    case 2:
                      serviceType = 'DANCING_IMAGE';
                      imageUrl = getPathOrUrl(1);
                      videoUrl = getPathOrUrl(0);
                      break;
                    case 3:
                      serviceType = 'ITV_DUAL_SOURCE';
                      imageUrl = [getPathOrUrl(0), getPathOrUrl(1), getPathOrUrl(2)]
                          .where((p) => p.isNotEmpty)
                          .join(',');
                      break;
                    default:
                      serviceType = 'IMAGE_TO_VIDEO';
                      final resolvedPaths = List.generate(readyState.slotsPaths.length, getPathOrUrl);
                      imageUrl = resolvedPaths.firstWhere((p) => p.isNotEmpty, orElse: () => '');
                  }

                  GeneratingPage.push(
                    context,
                    title: readyState.customPrompt.trim().isEmpty
                        ? t.profile.imageGeneration
                        : readyState.customPrompt,
                    imageUrl: imageUrl,
                    serviceType: serviceType,
                    videoUrl: videoUrl,
                    prompt: readyState.customPrompt,
                    isHd: readyState.quality == 'Full HD' || readyState.quality == 'HD',
                    isLongTime: readyState.duration == '10s' || readyState.duration == '15s',
                    heroTag: 'create-video-hero',
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
                      uploadedSlotsPaths,
                      quality,
                      duration,
                      isGenerating,
                      isSuccess,
                      isInspiring,
                      isVip,
                    ) {
                      return SafeArea(
                        child: Column(
                          children: [
                            // Header
                            _buildHeader(context),
                            SizedBox(height: 16),

                            // Tab Bar selector
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: CreateVideoTabBarWidget(
                                selectedIndex: selectedTab,
                                onTabSelected: (index) {
                                  context.read<CreateVideoBloc>().add(
                                    CreateVideoEvent.changeTab(index),
                                  );
                                },
                                 onHelpPressed: () {
                                   final guideImageUrls = sl<RemoteConfigService>().getGuideImageUrls();
                                   final imageUrl = selectedTab >= 0 && selectedTab < guideImageUrls.length
                                       ? guideImageUrls[selectedTab]
                                       : guideImageUrls[0];
                                   
                                   final String step1Text;
                                   final String step2Text;
                                   switch (selectedTab) {
                                     case 0:
                                       step1Text = t.guide.upload_photo;
                                       step2Text = t.guide.write_prompt;
                                       break;
                                     case 1:
                                       step1Text = t.guide.upload_2_photos;
                                       step2Text = t.guide.generate;
                                       break;
                                     case 2:
                                       step1Text = t.guide.upload_portrait;
                                       step2Text = t.guide.choose_style;
                                       break;
                                     case 3:
                                       step1Text = t.guide.add_assets;
                                       step2Text = t.guide.write_prompt;
                                       break;
                                     default:
                                       step1Text = t.guide.upload_photo;
                                       step2Text = t.guide.write_prompt;
                                   }

                                   CreateVideoGuideBottomSheet.show(
                                     context,
                                     imageUrl: imageUrl,
                                     step1Text: step1Text,
                                     step2Text: step2Text,
                                   );
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
      ),
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
