import 'dart:io';
import 'dart:ui';
import 'package:ai_video_flutter/core/widgets/app_svg_icon.dart';
import 'package:ai_video_flutter/core/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_heart_button.dart';
import '../../../../core/widgets/smooth_video_player_widget.dart';
import '../../../../core/widgets/report_bottom_sheet.dart';
import '../../../../core/widgets/app_confirm_dialog.dart';
import '../../../../i18n/strings.g.dart';
import '../../../../gen/assets.gen.dart';
import 'package:ai_video_flutter/core/permission/app_permission_handler.dart';
import 'package:core_business/core_business.dart';
import '../widgets/upload_bottom_sheet_widget.dart';
import 'create_template_settings_page.dart';

class CreateFromTemplatePage extends StatefulWidget {
  static const String path = '/create-from-template';
  static const String name = 'create_from_template';

  final String templateId;
  final String title;
  final String videoUrl;
  final String imageUrl;
  final String themeType;
  final int themeOrgId;

  const CreateFromTemplatePage({
    super.key,
    required this.templateId,
    required this.title,
    required this.videoUrl,
    required this.imageUrl,
    required this.themeType,
    required this.themeOrgId,
  });

  @override
  State<CreateFromTemplatePage> createState() => _CreateFromTemplatePageState();
}

class _CreateFromTemplatePageState extends State<CreateFromTemplatePage> {
  late final CreateFromTemplateBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc =
        CreateFromTemplateBloc(
          isTemplateLikedUseCase: sl(),
          toggleLikeTemplateUseCase: sl(),
          templateId: widget.templateId,
          title: widget.title,
          videoUrl: widget.videoUrl,
          imageUrl: widget.imageUrl,
          themeType: widget.themeType,
          themeOrgId: widget.themeOrgId,
        )..add(
          CreateFromTemplateEvent.init(
            templateId: widget.templateId,
            title: widget.title,
            videoUrl: widget.videoUrl,
            imageUrl: widget.imageUrl,
            themeType: widget.themeType,
            themeOrgId: widget.themeOrgId,
          ),
        );
  }

  Future<bool> _onWillPop() async {
    bool canPop = false;
    await _bloc.state.mapOrNull(
      ready: (readyState) async {
        if (readyState.selectedPhotoPath != null) {
          final result = await _showLeaveDialog(context);
          if (result == true) {
            canPop = true;
          }
        } else {
          canPop = true;
        }
      },
    );
    final isNotReady = _bloc.state.maybeMap(
      ready: (_) => false,
      orElse: () => true,
    );
    return canPop || isNotReady;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: BlocBuilder<CreateFromTemplateBloc, CreateFromTemplateState>(
              builder: (context, state) {
                return state.when(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (msg) => Center(
                    child: Text(msg, style: context.appTheme.errorTextStyle),
                  ),
                  ready:
                      (
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
                        return Column(
                          children: [
                            const SizedBox(height: 8),
                            _buildHeader(context, title),
                            const SizedBox(height: 12),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: _buildTopCard(
                                  context,
                                  imageUrl,
                                  isLiked,
                                  selectedPhotoPath,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: _buildBottomCard(
                                context,
                                selectedPhotoPath,
                              ),
                            ),
                            const SizedBox(height: 32),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: _buildContinueButton(
                                context,
                                selectedPhotoPath,
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        );
                      },
                );
              },
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
          color: AppColors.white.withValues(alpha: 0.0),
          shape: const CircleBorder(),
          child: InkWell(
            onTap: () async {
              if (await _onWillPop()) {
                if (context.mounted) context.pop();
              }
            },
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
        ReportTriggerWidget(
          child: Material(
            color: AppColors.white.withValues(alpha: 0.0),
            shape: const CircleBorder(),
            child: InkWell(
              onTap: null,
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: SizedBox(
                width: 36,
                height: 36,
                child: Center(
                  child: AppSvgIcon(
                    assetName: Assets.icons.icReport,
                    color: AppColors.white,
                    width: 16,
                    height: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopCard(
    BuildContext context,
    String defaultImageUrl,
    bool isLiked,
    String? selectedPhotoPath,
  ) {
    final t = context.t;
    final int hash = widget.title.hashCode;
    final double views =
        ((hash % 90) + 10) / 10; // Matches resolvedViews in VideoCard
    final double percentage = ((hash % 30) + 15) / 100.0; // 15% to 44% of views
    final double baseLikes = views * percentage;
    final String likesCountStr = '${baseLikes.toStringAsFixed(1)}K';

    return Hero(
      tag: selectedPhotoPath == null
          ? 'template-hero-${widget.templateId}'
          : 'template-video-hero-${widget.templateId}',
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 450,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.onSurface,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: SmoothVideoPlayerWidget(
                    videoUrl: widget.videoUrl,
                    imageUrl: widget.imageUrl,
                    showPlayPauseButton: true,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 120,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.black.withValues(alpha: 0.95),
                          AppColors.black.withValues(alpha: 0.6),
                          AppColors.black.withValues(alpha: 0.0),
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 20.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.auto_awesome_rounded,
                          color: AppColors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            t.create.tap_upload,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Material(
                          color: Colors.transparent,
                          shape: const CircleBorder(),
                          child: InkWell(
                            onTap: () => _showTipsBottomSheet(context),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Center(
                                child: AppSvgIcon(
                                  assetName: Assets.icons.icNotice,
                                  width: 16,
                                  height: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 120,
                  right: 16,
                  child: Column(
                    children: [
                      AppHeartButton(
                        isLiked: isLiked,
                        onTap: () {
                          _bloc.add(const CreateFromTemplateEvent.toggleLike());
                        },
                      ),
                      const SizedBox(height: 4),
                      Text(
                        likesCountStr,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomCard(BuildContext context, String? selectedPhotoPath) {
    final t = context.t;

    return Hero(
      tag: selectedPhotoPath != null
          ? 'template-hero-${widget.templateId}'
          : 'upload-photo-hero-${widget.templateId}',
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () => _showUploadBottomSheet(context),
          child: Container(
            height: 152,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.onSurface,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (selectedPhotoPath != null) ...[
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 132,
                          height: 152,
                          child: selectedPhotoPath.startsWith('assets/')
                              ? Image.asset(
                                  selectedPhotoPath,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(selectedPhotoPath),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 14,
                      right: 14,
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                          child: Material(
                            color: const Color(0x99979797),
                            child: InkWell(
                              onTap: () => _bloc.add(
                                const CreateFromTemplateEvent.removePhoto(),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                              child: const SizedBox(
                                width: 20,
                                height: 20,
                                child: Icon(
                                  Icons.close_rounded,
                                  color: AppColors.white,
                                  size: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ] else ...[
                    Container(
                      width: double.infinity,
                      height: 152,
                      decoration: BoxDecoration(
                        color: Color(0xFF171717),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_image_add.svg',
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              t.create.tap_to_upload_photo,
                              textAlign: TextAlign.center,
                              style: context.textTheme.bodySmall?.copyWith(
                                color: AppColors.subText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context, String? selectedPhotoPath) {
    final t = context.t;
    final isEnabled = selectedPhotoPath != null;

    return GradientButton(
      label: t.common.generate,
      width: double.infinity,
      isEnabled: isEnabled,
      leadingIcon: Icon(
        Icons.auto_awesome_rounded,
        color: isEnabled
            ? AppColors.white
            : AppColors.white.withValues(alpha: 0.4),
        size: 24,
      ),
      onPressed: () {
        context.pushNamed(CreateTemplateSettingsPage.name, extra: _bloc);
      },
    );
  }

  Future<bool?> _showLeaveDialog(BuildContext context) {
    final t = context.t;
    return AppConfirmDialog.show<bool>(
      context: context,
      title: t.leave_dialog.title,
      description: t.leave_dialog.desc,
      cancelLabel: t.common.stay,
      confirmLabel: t.common.leave,
      onConfirm: () => Navigator.pop(context, true),
      onCancel: () => Navigator.pop(context, false),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    if (source == ImageSource.camera) {
      final hasPermission =
          await AppPermissionHandler.checkAndRequestCameraPermission(context);
      if (!mounted) return;
      if (!hasPermission) {
        LogUtils.w(
          'CreateFromTemplatePage: Camera permission denied. Aborting image selection.',
        );
        return;
      }
    }
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        if (mounted) {
          final croppedPath = await _cropImage(context, image.path);
          if (croppedPath != null) {
            _bloc.add(CreateFromTemplateEvent.selectPhoto(croppedPath));
          }
        }
      }
    } catch (e, stack) {
      LogUtils.e(
        'CreateFromTemplatePage: Error picking image',
        error: e,
        stackTrace: stack,
      );
    }
  }

  Future<String?> _cropImage(BuildContext context, String sourcePath) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: sourcePath,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: context.t.tips_sheet.title,
            toolbarColor: AppColors.surface,
            toolbarWidgetColor: AppColors.white,
            activeControlsWidgetColor: AppColors.primary,
            cropFrameColor: AppColors.primary,
            cropGridColor: AppColors.primary,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio3x2,
            ],
          ),
          IOSUiSettings(
            title: context.t.tips_sheet.title,
            aspectRatioLockEnabled: false,
            resetAspectRatioEnabled: true,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio3x2,
            ],
          ),
        ],
      );
      return croppedFile?.path;
    } catch (e, stack) {
      LogUtils.e(
        'CreateFromTemplatePage: Error cropping image',
        error: e,
        stackTrace: stack,
      );
      return null;
    }
  }

  void _showUploadBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.onSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return UploadBottomSheetWidget(onImageSourceSelected: _pickImage);
      },
    );
  }

  void _showTipsBottomSheet(BuildContext context) {
    final t = context.t;
    final goodMockPhotos = [
      Assets.images.imgOnePerson.path,
      Assets.images.imgClearFace.path,
      Assets.images.imgHalfBody.path,
    ];
    final badMockPhotos = [
      Assets.images.imgHidenPage.path,
      Assets.images.imgMultiplePeople.path,
      Assets.images.imgBluring.path,
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.onSurface,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.82,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        t.tips_sheet.title,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppColors.white.withValues(alpha: 0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close_rounded,
                            color: AppColors.white,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.icGreenTick,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        t.tips_sheet.use_photos,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTipItem(
                          path: goodMockPhotos[0],
                          label: t.tips_sheet.one_person,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildTipItem(
                          path: goodMockPhotos[1],
                          label: t.tips_sheet.clear_face,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildTipItem(
                          path: goodMockPhotos[2],
                          label: t.tips_sheet.half_body,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.icRedTick,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        t.tips_sheet.avoid_photos,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTipItem(
                          path: badMockPhotos[0],
                          label: t.tips_sheet.hidden_face,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildTipItem(
                          path: badMockPhotos[1],
                          label: t.tips_sheet.multiple_people,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildTipItem(
                          path: badMockPhotos[2],
                          label: t.tips_sheet.blurry_photo,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: Ink(
                      height: 56,
                      decoration: const BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Center(
                        child: Text(
                          t.tips_sheet.button_got_it,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTipItem({
    required String path,
    required String label,
  }) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 3 / 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            child: Image.asset(path, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
