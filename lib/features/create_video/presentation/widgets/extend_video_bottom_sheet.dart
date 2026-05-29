import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../bloc/result_bloc.dart';
import '../bloc/result_event.dart';
import '../bloc/result_state.dart';
import '../pages/generating_page.dart';
import 'custom_prompt_card_widget.dart';
import 'video_settings_card_widget.dart';

class ExtendVideoBottomSheet extends StatelessWidget {
  final ResultBloc resultBloc;
  final String videoTitle;
  final String videoImageUrl;

  const ExtendVideoBottomSheet({
    super.key,
    required this.resultBloc,
    required this.videoTitle,
    required this.videoImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocProvider.value(
      value: resultBloc,
      child: BlocBuilder<ResultBloc, ResultState>(
        builder: (context, state) {
          return state.maybeWhen(
            ready: (videoId, title, imageUrl, videoUrl, createdAt, isPlaying, isMuted, isBuffering,
                extendPrompt, extendQuality, extendDuration, inspireMeCount, isGeneratingExtended, isDeleted) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 24.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Drag handle
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3F3F3F),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Title row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          t.result.extends_title,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Close button
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: AppColors.white,
                              size: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Custom Prompt Label
                    Row(
                      children: [
                        Text(
                          t.create.custom_prompt,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "(${t.create.optional_label})",
                          style: const TextStyle(
                            color: AppColors.subText,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Custom Prompt Card
                    CustomPromptCardWidget(
                      promptText: extendPrompt,
                      inspireMeCount: inspireMeCount,
                      onPromptChanged: (val) {
                        resultBloc.add(ResultEvent.changeExtendPrompt(val));
                      },
                      onInspireMePressed: () {
                        resultBloc.add(const ResultEvent.useInspireMe());
                      },
                      onClearPressed: () {
                        resultBloc.add(const ResultEvent.clearExtendPrompt());
                      },
                    ),
                    const SizedBox(height: 24),

                    // Video Settings Label
                    Row(
                      children: [
                        Text(
                          t.create.video_settings,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "(${t.create.optional_label})",
                          style: const TextStyle(
                            color: AppColors.subText,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Video Settings Card
                    VideoSettingsCardWidget(
                      selectedQuality: extendQuality,
                      selectedDuration: extendDuration,
                      onQualityChanged: (val) {
                        resultBloc.add(ResultEvent.changeExtendQuality(val));
                      },
                      onDurationChanged: (val) {
                        resultBloc.add(ResultEvent.changeExtendDuration(val));
                      },
                    ),
                    const SizedBox(height: 24),

                    // Generate Button
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        context.pushNamed(
                          GeneratingPage.name,
                          queryParameters: {
                            'title': extendPrompt.trim().isEmpty
                                ? "$videoTitle Extended"
                                : extendPrompt,
                            'imageUrl': videoImageUrl,
                          },
                        );
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      child: Ink(
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: context.appTheme.primaryGradient,
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) =>
                                    AppColors.primaryGradient.createShader(bounds),
                                blendMode: BlendMode.srcIn,
                                child: const Icon(
                                  Icons.auto_awesome,
                                  size: 22,
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                t.common.generate,
                                style: context.textTheme.labelLarge?.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
