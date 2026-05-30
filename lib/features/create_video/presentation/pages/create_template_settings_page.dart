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
              listener: (context, state) {
                state.mapOrNull(
                  ready: (readyState) {
                    if (readyState.isGenerating) {
                      context.pushNamed(
                        GeneratingPage.name,
                        queryParameters: {
                          // Tên video (sử dụng tiêu đề hoặc prompt người dùng chỉnh sửa)
                          'title': readyState.title,
                          // Đường dẫn ảnh người dùng đã chọn (cục bộ, sẽ được upload lên CDN tại GeneratingBloc)
                          'imageUrl': readyState.selectedPhotoPath ?? '',
                          // ID của template chủ đề được chọn (cung cấp làm themeId cho API)
                          'themeId': readyState.templateId,
                          // Loại chủ đề tạo video (Ví dụ: "TEMPLATE")
                          'themeType': readyState.themeType,
                          // ID tổ chức gốc quản lý template này (themeOrgId)
                          'themeOrgId': readyState.themeOrgId.toString(),
                          // Xác định có tạo video HD không (Chất lượng "Full HD" hoặc "HD" được ánh xạ thành true)
                          'isHd': (readyState.quality == 'Full HD' || readyState.quality == 'HD').toString(),
                          // Xác định độ dài video dài hơn (Thời lượng "10s" hoặc "15s" được ánh xạ thành true)
                          'isLongTime': (readyState.duration == '10s' || readyState.duration == '15s').toString(),
                        },
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
                                    _buildTopCard(context, selectedPhotoPath),
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

  Widget _buildTopCard(BuildContext context, String? selectedPhotoPath) {
    return Container(
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
