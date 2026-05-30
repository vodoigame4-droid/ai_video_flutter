import 'dart:io';
import 'dart:ui';
import 'package:ai_video_flutter/core/widgets/app_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_play_button.dart';
import '../../../../core/widgets/app_heart_button.dart';
import '../../../../core/widgets/app_loudspeaker_button.dart';
import '../../../../i18n/strings.g.dart';
import '../../../../gen/assets.gen.dart';
import 'package:core_business/core_business.dart';
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
  late final Player _player;
  late final VideoController _videoController;

  @override
  void initState() {
    super.initState();
    _bloc = sl<CreateFromTemplateBloc>()
      ..add(
        CreateFromTemplateEvent.init(
          templateId: widget.templateId,
          title: widget.title,
          videoUrl: widget.videoUrl,
          imageUrl: widget.imageUrl,
          themeType: widget.themeType,
          themeOrgId: widget.themeOrgId,
        ),
      );
    _player = Player();
    _videoController = VideoController(_player);

    _initVideo();
  }

  Future<void> _initVideo() async {
    try {
      await _player.open(Media(widget.videoUrl));
      await _player.setPlaylistMode(PlaylistMode.loop);
      await _player.setVolume(100);
      await _player.play();
    } catch (e) {
      debugPrint("Error initializing template video: $e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
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
        child: AppBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: BlocBuilder<CreateFromTemplateBloc, CreateFromTemplateState>(
                builder: (context, state) {
                  return state.when(
                    initial: () =>
                        const Center(child: CircularProgressIndicator()),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (msg) => Center(
                      child: Text(
                        msg,
                        style: context.appTheme.errorTextStyle,
                      ),
                    ),
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            _buildHeader(context, title),
                            const SizedBox(height: 12),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    _buildTopCard(context, imageUrl),
                                    const SizedBox(height: 16),
                                    _buildBottomCard(context, selectedPhotoPath),
                                    const SizedBox(height: 100),
                                  ],
                                ),
                              ),
                            ),
                            _buildContinueButton(context, selectedPhotoPath),
                            const SizedBox(height: 24),
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

  Widget _buildHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: AppColors.white.withValues(alpha: 0.1),
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
        Material(
          color: AppColors.white.withValues(alpha: 0.1),
          shape: const CircleBorder(),
          child: InkWell(
            onTap: () => _showReportDialog(context),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: const SizedBox(
              width: 36,
              height: 36,
              child: Icon(
                Icons.flag_outlined,
                color: AppColors.white,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopCard(BuildContext context, String defaultImageUrl) {
    final t = context.t;

    return Container(
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
              child: Video(
                controller: _videoController,
                fill: AppColors.black,
                fit: BoxFit.cover,
                controls: NoVideoControls,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: StreamBuilder<double>(
                stream: _player.stream.volume,
                builder: (context, snapshot) {
                  final volume = snapshot.data ?? 100.0;
                  final isMuted = volume == 0.0;
                  return AppLoudspeakerButton(
                    isMuted: isMuted,
                    onTap: () => _player.setVolume(isMuted ? 100.0 : 0.0),
                  );
                },
              ),
            ),
            StreamBuilder<bool>(
              stream: _player.stream.playing,
              builder: (context, snapshot) {
                final isPlaying = snapshot.data ?? true;
                if (isPlaying) return const SizedBox.shrink();
                return AppPlayButton(
                  isPlaying: isPlaying,
                  onTap: () => _player.play(),
                );
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 88,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColors.black.withValues(alpha: 0.8),
                      AppColors.black.withValues(alpha: 0.0),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
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
                        child: const SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.info_outline_rounded,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 88,
              right: 16,
              child: Column(
                children: [
                  AppHeartButton(
                    isLiked: true,
                    onTap: () {
                      // Handle like/unlike template logic if needed
                    },
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "11.0K",
                    style: TextStyle(
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
    );
  }

  Widget _buildBottomCard(BuildContext context, String? selectedPhotoPath) {
    final t = context.t;

    return GestureDetector(
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
                          ? Image.asset(selectedPhotoPath, fit: BoxFit.cover)
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
                    color: AppColors.background,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                          t.create.tap_upload,
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
    );
  }

  Widget _buildContinueButton(BuildContext context, String? selectedPhotoPath) {
    final t = context.t;
    final isEnabled = selectedPhotoPath != null;

    return InkWell(
      onTap: isEnabled
          ? () {
              context.pushNamed(
                CreateTemplateSettingsPage.name,
                extra: _bloc,
              );
            }
          : null,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Ink(
        height: 56,
        decoration: BoxDecoration(
          gradient: isEnabled ? AppColors.primaryGradient : null,
          color: isEnabled ? null : AppColors.onSurface,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                t.onboarding.page2.button, // "Continue" translated text
                style: context.textTheme.labelLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isEnabled ? AppColors.white : AppColors.subText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showReportDialog(BuildContext context) {
    final t = context.t;
    showDialog(
      context: context,
      barrierColor: AppColors.black.withValues(alpha: 0.5),
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            backgroundColor: AppColors.onSurface,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(color: AppColors.secondary, width: 1.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    t.report_dialog.title,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    t.report_dialog.desc,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.subText,
                      fontSize: 15,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                          child: Container(
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Text(
                              t.report_dialog.cancel,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(t.report_dialog.success),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                          child: Ink(
                            height: 48,
                            decoration: const BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                t.report_dialog.submit,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> _showLeaveDialog(BuildContext context) {
    final t = context.t;
    return showDialog<bool>(
      context: context,
      barrierColor: AppColors.black.withValues(alpha: 0.5),
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            backgroundColor: AppColors.onSurface,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(color: AppColors.secondary, width: 1.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    t.leave_dialog.title,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    t.leave_dialog.desc,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.subText,
                      fontSize: 15,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => Navigator.pop(context, false),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                          child: Container(
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Text(
                              t.common.stay,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InkWell(
                          onTap: () => Navigator.pop(context, true),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                          child: Ink(
                            height: 48,
                            decoration: const BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                t.common.leave,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showUploadBottomSheet(BuildContext context) {
    final t = context.t;
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.onSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      t.create.select_upload_title,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close_rounded,
                        color: AppColors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _showMockPicker(context);
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.08),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          t.common.camera,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _showMockPicker(context);
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.08),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.image_outlined,
                          color: AppColors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          t.common.gallery,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMockPicker(BuildContext context) {
    final t = context.t;
    final mockAssets = [
      Assets.images.ob1.path,
      Assets.images.ob2.path,
      Assets.images.ob3.path,
      Assets.images.ob4.path,
      Assets.images.ob5.path,
      Assets.images.card1.path,
      Assets.images.card2.path,
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.onSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.create.select_mock_media,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  t.create.select_media_desc,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.subText,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: mockAssets.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final path = mockAssets[index];
                      final name = path
                          .split('/')
                          .last
                          .split('.')
                          .first
                          .toUpperCase();
                      return GestureDetector(
                        onTap: () {
                          _bloc.add(CreateFromTemplateEvent.selectPhoto(path));
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            border: Border.all(color: AppColors.lightBorder),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(11),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(path, fit: BoxFit.cover),
                                Container(
                                  color: AppColors.black.withValues(alpha: 0.3),
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    name,
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showTipsBottomSheet(BuildContext context) {
    final t = context.t;
    final goodMockPhotos = [
      Assets.images.ob1.path,
      Assets.images.ob2.path,
      Assets.images.card1.path,
    ];
    final badMockPhotos = [
      Assets.images.ob4.path,
      Assets.images.ob5.path,
      Assets.images.card2.path,
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
          initialChildSize: 0.85,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        t.tips_sheet.title,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.close_rounded,
                          color: AppColors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.primary,
                        size: 24,
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
                    children: List.generate(goodMockPhotos.length, (idx) {
                      final path = goodMockPhotos[idx];
                      String label = "";
                      if (idx == 0) label = t.tips_sheet.one_person;
                      if (idx == 1) label = t.tips_sheet.clear_face;
                      if (idx == 2) label = t.tips_sheet.half_body;

                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: idx == 2 ? 0 : 8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  border: Border.all(
                                    color: AppColors.lightBorder,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(11),
                                  ),
                                  child: Image.asset(path, fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                label,
                                style: const TextStyle(
                                  color: AppColors.subText,
                                  fontSize: 11,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Icon(
                        Icons.cancel_rounded,
                        color: AppColors.heart,
                        size: 24,
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
                    children: List.generate(badMockPhotos.length, (idx) {
                      final path = badMockPhotos[idx];
                      String label = "";
                      if (idx == 0) label = t.tips_sheet.hidden_face;
                      if (idx == 1) label = t.tips_sheet.multiple_people;
                      if (idx == 2) label = t.tips_sheet.blurry_photo;

                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: idx == 2 ? 0 : 8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  border: Border.all(
                                    color: AppColors.lightBorder,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(11),
                                  ),
                                  child: Image.asset(path, fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                label,
                                style: const TextStyle(
                                  color: AppColors.subText,
                                  fontSize: 11,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
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
}
