import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../i18n/strings.g.dart';
import 'package:core_business/core_business.dart';
import 'custom_prompt_card_widget.dart';
import '../../../../core/widgets/upload_slot_widget.dart';
import 'video_settings_card_widget.dart';
import 'create_video_button_widget.dart';

class ImageToVideoTab extends StatelessWidget {
  const ImageToVideoTab({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocBuilder<CreateVideoBloc, CreateVideoState>(
      builder: (context, state) {
        return state.maybeWhen(
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
                final isGenerateEnabled = slotsPaths[0] != null;

                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            _buildUploadSectionHeader(context),
                            const SizedBox(height: 16),
                            Center(
                              child: SizedBox(
                                width: 173,
                                height: 173,
                                child: UploadSlotWidget(
                                  mediaPath: slotsPaths[0],
                                  labelText: t.create.tap_upload,
                                  onMediaRemoved: () {
                                    context.read<CreateVideoBloc>().add(
                                      const CreateVideoEvent.removeMedia(0),
                                    );
                                  },
                                  onMediaSelected: (path) {
                                    context.read<CreateVideoBloc>().add(
                                      CreateVideoEvent.selectMedia(0, path),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            _buildPromptSectionHeader(
                              context,
                              isRequired: false,
                            ),
                            const SizedBox(height: 16),
                            CustomPromptCardWidget(
                              promptText: customPrompt,
                              inspireMeCount: inspireMeCount,
                              isInspiring: isInspiring,
                              hasImage: slotsPaths[0] != null,
                              isVip: isVip,
                              onPromptChanged: (val) {
                                context.read<CreateVideoBloc>().add(
                                  CreateVideoEvent.updatePrompt(val),
                                );
                              },
                              onInspireMePressed: () {
                                context.read<CreateVideoBloc>().add(
                                  const CreateVideoEvent.inspireMe(),
                                );
                              },
                              onClearPressed: () {
                                context.read<CreateVideoBloc>().add(
                                  const CreateVideoEvent.clearPrompt(),
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                            _buildSettingsSectionHeader(context),
                            const SizedBox(height: 16),
                            VideoSettingsCardWidget(
                              selectedQuality: quality,
                              selectedDuration: duration,
                              onQualityChanged: (val) {
                                context.read<CreateVideoBloc>().add(
                                  CreateVideoEvent.selectQuality(val),
                                );
                              },
                              onDurationChanged: (val) {
                                context.read<CreateVideoBloc>().add(
                                  CreateVideoEvent.selectDuration(val),
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 24,
                        top: 8,
                      ),
                      child: CreateVideoButtonWidget(
                        isEnabled: isGenerateEnabled && !isGenerating,
                        isLoading: isGenerating,
                        onPressed: () {
                          context.read<CreateVideoBloc>().add(
                            const CreateVideoEvent.generateVideo(),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildUploadSectionHeader(BuildContext context) {
    final t = context.t;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(t.create.upload_image, style: context.textTheme.titleMedium),
            const SizedBox(width: 6),
            Text(
              "(${t.create.required_label})",
              style: context.textTheme.labelMedium,
            ),
          ],
        ),
        AppSvgIcon(
          assetName: Assets.icons.icNotice,
          color: AppColors.white.withValues(alpha: 0.6),
          width: 16,
          height: 16,
        ),
      ],
    );
  }

  Widget _buildPromptSectionHeader(
    BuildContext context, {
    required bool isRequired,
  }) {
    final t = context.t;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(t.create.custom_prompt, style: context.textTheme.titleMedium),
        const SizedBox(width: 6),
        Text(
          isRequired
              ? "(${t.create.required_label})"
              : "(${t.create.optional_label})",
          style: context.textTheme.labelMedium,
        ),
      ],
    );
  }

  Widget _buildSettingsSectionHeader(BuildContext context) {
    final t = context.t;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(t.create.video_settings, style: context.textTheme.titleMedium),
        const SizedBox(width: 6),
        Text(
          "(${t.create.optional_label})",
          style: context.textTheme.labelMedium,
        ),
      ],
    );
  }
}
