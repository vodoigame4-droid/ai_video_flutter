import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:core_business/core_business.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_background.dart';
import '../../../../i18n/strings.g.dart';
import '../widgets/video_settings_card_widget.dart';
import 'generating_page.dart';
import '../../../../core/utils/credit_navigation_helper.dart';

class CreateTemplateSettingsPage extends StatelessWidget {
  static const String path = '/create-template-settings';
  static const String name = 'create_template_settings';

  final CreateFromTemplateBloc bloc;

  const CreateTemplateSettingsPage({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: AppBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: BlocListener<CreateFromTemplateBloc, CreateFromTemplateState>(
              listener: (context, state) async {
                await state.mapOrNull(
                  ready: (readyState) async {
                    if (readyState.isGenerating) {
                      final hasInsufficient = await CreditNavigationHelper.checkInsufficientCreditsAndNavigate(
                        context,
                        videoUrl: readyState.videoUrl,
                      );
                      if (hasInsufficient) return;

                      if (!context.mounted) return;

                      GeneratingPage.push(
                        context,
                        title: readyState.title,
                        imageUrl: readyState.selectedPhotoPath,
                        themeId: readyState.templateId,
                        themeType: readyState.themeType,
                        themeOrgId: readyState.themeOrgId,
                        isHd: readyState.quality == 'Full HD' || readyState.quality == 'HD',
                        isLongTime: readyState.duration == '10s' || readyState.duration == '15s',
                      );
                    }
                  },
                );
              },
              child: BlocBuilder<CreateFromTemplateBloc, CreateFromTemplateState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    ready: (
                      templateId,
                      title,
                      videoUrl,
                      imageUrl,
                      themeType,
                      themeOrgId,
                      selectedPhotoPath,
                      quality,
                      duration,
                      isGenerating,
                      isSuccess,
                      isLiked,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            _buildHeader(context, title),
                            const SizedBox(height: 12),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    _buildTopCard(context, selectedPhotoPath, templateId),
                                    const SizedBox(height: 16),
                                    _buildBottomCard(context, quality, duration),
                                    const SizedBox(height: 100),
                                  ],
                                ),
                              ),
                            ),
                            _buildGenerateButton(context),
                            const SizedBox(height: 24),
                          ],
                        ),
                      );
                    },
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: AppColors.white.withValues(alpha: 0.1),
          shape: const CircleBorder(),
          child: InkWell(
            onTap: () => context.pop(),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: const SizedBox(
              width: 36,
              height: 36,
              child: Icon(
                Icons.arrow_back_rounded,
                color: AppColors.white,
                size: 20,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 36), // Balanced spacing
      ],
    );
  }

  Widget _buildTopCard(BuildContext context, String? selectedPhotoPath, String templateId) {
    return Hero(
      tag: 'template-hero-$templateId',
      child: Container(
        height: 450,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.onSurface,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: selectedPhotoPath != null
              ? (selectedPhotoPath.startsWith('assets/')
                  ? Image.asset(selectedPhotoPath, fit: BoxFit.cover)
                  : Image.file(
                      File(selectedPhotoPath),
                      fit: BoxFit.cover,
                    ))
              : const Icon(
                  Icons.image,
                  size: 80,
                  color: AppColors.subText,
                ),
        ),
      ),
    );
  }

  Widget _buildBottomCard(
    BuildContext context,
    String quality,
    String duration,
  ) {
    return VideoSettingsCardWidget(
      selectedQuality: quality,
      selectedDuration: duration,
      onQualityChanged: (q) =>
          bloc.add(CreateFromTemplateEvent.selectQuality(q)),
      onDurationChanged: (d) =>
          bloc.add(CreateFromTemplateEvent.selectDuration(d)),
    );
  }

  Widget _buildGenerateButton(BuildContext context) {
    final t = context.t;

    return InkWell(
      onTap: () {
        bloc.add(const CreateFromTemplateEvent.startGenerating());
      },
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Ink(
        height: 56,
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.auto_awesome_rounded,
                color: AppColors.white,
                size: 24,
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
    );
  }
}
