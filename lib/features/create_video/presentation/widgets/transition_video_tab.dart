import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../bloc/create_video_bloc.dart';
import '../bloc/create_video_event.dart';
import '../bloc/create_video_state.dart';
import 'custom_prompt_card_widget.dart';
import 'upload_slot_widget.dart';
import 'video_settings_card_widget.dart';

class TransitionVideoTab extends StatelessWidget {
  const TransitionVideoTab({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocBuilder<CreateVideoBloc, CreateVideoState>(
      builder: (context, state) {
        return state.maybeWhen(
          ready: (
            selectedTab,
            customPrompt,
            inspireMeCount,
            slotsPaths,
            quality,
            duration,
            isGenerating,
            isSuccess,
          ) {
            final isGenerateEnabled = slotsPaths[0] != null &&
                slotsPaths[1] != null &&
                customPrompt.trim().isNotEmpty;

            return Stack(
              children: [
                Positioned.fill(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        _buildUploadSectionHeader(context),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            UploadSlotWidget(
                              mediaPath: slotsPaths[0],
                              labelText: t.create.upload_first_photo,
                              placeholderIcon: Icons.add_photo_alternate_outlined,
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
                            const SizedBox(width: 12),
                            UploadSlotWidget(
                              mediaPath: slotsPaths[1],
                              labelText: t.create.upload_last_photo,
                              placeholderIcon: Icons.add_photo_alternate_outlined,
                              onMediaRemoved: () {
                                context.read<CreateVideoBloc>().add(
                                      const CreateVideoEvent.removeMedia(1),
                                    );
                              },
                              onMediaSelected: (path) {
                                context.read<CreateVideoBloc>().add(
                                      CreateVideoEvent.selectMedia(1, path),
                                    );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildPromptSectionHeader(context, isRequired: true),
                        const SizedBox(height: 16),
                        CustomPromptCardWidget(
                          promptText: customPrompt,
                          inspireMeCount: inspireMeCount,
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
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 24,
                  left: 16,
                  right: 16,
                  child: _buildGenerateButton(
                    context,
                    isEnabled: isGenerateEnabled && !isGenerating,
                    isLoading: isGenerating,
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
          children: [
            Text(
              t.create.upload_image,
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(width: 6),
            Text(
              "(${t.create.required_label})",
              style: context.textTheme.labelMedium,
            ),
          ],
        ),
        Icon(
          Icons.info_outline_rounded,
          color: AppColors.white.withValues(alpha: 0.6),
          size: 16,
        ),
      ],
    );
  }

  Widget _buildPromptSectionHeader(BuildContext context, {required bool isRequired}) {
    final t = context.t;

    return Row(
      children: [
        Text(
          t.create.custom_prompt,
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(width: 6),
        Text(
          isRequired ? "(${t.create.required_label})" : "(${t.create.optional_label})",
          style: context.textTheme.labelMedium,
        ),
      ],
    );
  }

  Widget _buildSettingsSectionHeader(BuildContext context) {
    final t = context.t;

    return Row(
      children: [
        Text(
          t.create.video_settings,
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(width: 6),
        Text(
          "(${t.create.optional_label})",
          style: context.textTheme.labelMedium,
        ),
      ],
    );
  }

  Widget _buildGenerateButton(
    BuildContext context, {
    required bool isEnabled,
    required bool isLoading,
  }) {
    final t = context.t;

    return InkWell(
      onTap: isEnabled
          ? () => context.read<CreateVideoBloc>().add(const CreateVideoEvent.generateVideo())
          : null,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Ink(
        height: 56,
        decoration: BoxDecoration(
          gradient: isEnabled ? context.appTheme.primaryGradient : null,
          color: isEnabled ? null : context.colorScheme.onSurface,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: isEnabled ? AppColors.white : AppColors.white.withValues(alpha: 0.4),
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      t.common.generate,
                      style: isEnabled ? context.textTheme.labelLarge : context.textTheme.labelLarge,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
