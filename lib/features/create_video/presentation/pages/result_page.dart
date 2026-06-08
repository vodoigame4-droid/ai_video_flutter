import 'dart:io';
import 'dart:ui';
import 'package:ai_video_flutter/core/widgets/app_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/smooth_video_player_widget.dart';
import '../../../../core/widgets/report_bottom_sheet.dart';
import '../../../../core/widgets/app_confirm_dialog.dart';
import '../../../../i18n/strings.g.dart';
import '../../../../gen/assets.gen.dart';
import 'package:core_business/core_business.dart';
import '../../../../core/extensions/context_failure_ext.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../core/utils/rating_prompt_manager.dart';
import 'package:ai_video_flutter/core/permission/app_permission_handler.dart';
import '../widgets/extend_video_bottom_sheet.dart';
import 'generating_page.dart';

class ResultPageArgs {
  final String videoId;
  final String title;
  final String imageUrl;
  final String videoUrl;
  final String createdAt;
  final String serviceType;
  final String? videoUrlSrc;
  final String themeId;
  final String themeType;
  final int themeOrgId;
  final bool isHd;
  final bool isLongTime;
  final bool fromGeneration;

  const ResultPageArgs({
    required this.videoId,
    required this.title,
    required this.imageUrl,
    required this.videoUrl,
    required this.createdAt,
    this.serviceType = 'IMAGE_TO_VIDEO',
    this.videoUrlSrc,
    this.themeId = '1',
    this.themeType = 'TEMPLATE',
    this.themeOrgId = 1,
    this.isHd = false,
    this.isLongTime = false,
    this.fromGeneration = false,
  });
}

class ResultPage extends StatefulWidget {
  static const String path = '/result';
  static const String name = 'result';

  static void push(
    BuildContext context,
    ResultPageArgs args, {
    bool replace = false,
  }) {
    final encodedImageUrl = Uri.encodeComponent(args.imageUrl);
    final encodedVideoUrl = Uri.encodeComponent(args.videoUrl);
    final encodedVideoUrlSrc = args.videoUrlSrc != null ? Uri.encodeComponent(args.videoUrlSrc!) : '';
    final params = {
      'videoId': args.videoId,
      'title': args.title,
      'imageUrl': encodedImageUrl,
      'videoUrl': encodedVideoUrl,
      'createdAt': args.createdAt,
      'serviceType': args.serviceType,
      if (encodedVideoUrlSrc.isNotEmpty) 'videoUrlSrc': encodedVideoUrlSrc,
      'themeId': args.themeId,
      'themeType': args.themeType,
      'themeOrgId': args.themeOrgId.toString(),
      'isHd': args.isHd.toString(),
      'isLongTime': args.isLongTime.toString(),
      'fromGeneration': args.fromGeneration.toString(),
    };
    if (replace) {
      context.replaceNamed(name, queryParameters: params, extra: args);
    } else {
      context.pushNamed(name, queryParameters: params, extra: args);
    }
  }

  final String videoId;
  final String title;
  final String imageUrl;
  final String videoUrl;
  final String createdAt;
  final String serviceType;
  final String? videoUrlSrc;
  final String themeId;
  final String themeType;
  final int themeOrgId;
  final bool isHd;
  final bool isLongTime;
  final bool fromGeneration;

  const ResultPage({
    super.key,
    required this.videoId,
    required this.title,
    required this.imageUrl,
    required this.videoUrl,
    required this.createdAt,
    required this.serviceType,
    this.videoUrlSrc,
    required this.themeId,
    required this.themeType,
    required this.themeOrgId,
    required this.isHd,
    required this.isLongTime,
    this.fromGeneration = false,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late final ResultBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<ResultBloc>()
      ..add(
        ResultEvent.init(
          videoId: widget.videoId,
          title: widget.title,
          imageUrl: widget.imageUrl.isEmpty ? null : widget.imageUrl,
          videoUrl: widget.videoUrl,
          createdAt: widget.createdAt,
        ),
      );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      LogUtils.d('ResultPage: PostFrameCallback triggered. videoId=${widget.videoId}, fromGeneration=${widget.fromGeneration}');
      final isPending = await RatingPromptManager.checkAndRemovePendingVideo(widget.videoId);
      LogUtils.d('ResultPage: isPending=$isPending');
      if (widget.fromGeneration || isPending) {
        if (mounted) {
          LogUtils.d('ResultPage: Triggering rating prompt...');
          RatingPromptManager.checkAndPromptRating(context);
        }
      } else {
        LogUtils.d('ResultPage: Rating prompt condition not met (fromGeneration=${widget.fromGeneration}, isPending=$isPending).');
      }
    });
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    // Dynamically split the ready message to color the title with a gradient.
    final readyMsg = t.result.ready_message(title: widget.title);
    final parts = readyMsg.split(widget.title);
    final prefix = parts.isNotEmpty ? parts[0] : '';
    final suffix = parts.length > 1 ? parts[1] : '';

    return BlocProvider.value(
      value: _bloc,
      child: BlocListener<ResultBloc, ResultState>(
        listenWhen: (previous, current) => current.maybeMap(
          ready: (s) => true,
          orElse: () => false,
        ),
        listener: (context, state) {
          state.mapOrNull(
            ready: (s) {
              if (s.isDeleted) {
                AppToast.showSuccess(t.report_dialog.success);
                context.pop();
              } else if (s.downloadSuccess) {
                AppToast.showSuccess(t.result.download_success);
                _bloc.add(const ResultEvent.resetDownloadShareStatus());
              } else if (s.shareSuccess) {
                AppToast.showSuccess(t.result.share_success);
                _bloc.add(const ResultEvent.resetDownloadShareStatus());
              } else if (s.downloadErrorMessage != null) {
                context.handleFailure(Failure.business(code: s.downloadErrorMessage!, message: ''));
                _bloc.add(const ResultEvent.resetDownloadShareStatus());
              } else if (s.shareErrorMessage != null) {
                context.handleFailure(Failure.business(code: s.shareErrorMessage!, message: ''));
                _bloc.add(const ResultEvent.resetDownloadShareStatus());
              }
            },
          );
        },
        child: Scaffold(
          backgroundColor: AppColors.black,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 8),

                  // Header row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button
                      Material(
                        color: AppColors.white.withValues(alpha: 0.0),
                        shape: const CircleBorder(),
                        child: InkWell(
                          onTap: () => context.pop(),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
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

                      // Page Title
                      Text(
                        t.result.title,
                        style:
                            context.textTheme.titleMedium?.copyWith(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ) ??
                            const TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),

                      // Report/Flag button
                      ReportTriggerWidget(
                        child: Material(
                          color: Colors.transparent,
                          shape: const CircleBorder(),
                          child: InkWell(
                            onTap: null,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
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
                  ),

                  const SizedBox(height: 12),

                  // Subtitle/Info row: Spark icon + Video title status info (Embedded as WidgetSpan to prevent Row overflow)
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.subText,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: ShaderMask(
                            shaderCallback: (bounds) =>
                                AppColors.primaryGradient.createShader(bounds),
                            blendMode: BlendMode.srcIn,
                            child: const Padding(
                              padding: EdgeInsets.only(right: 6.0),
                              child: Icon(Icons.auto_awesome_rounded, size: 16),
                            ),
                          ),
                        ),
                        TextSpan(text: prefix),
                        TextSpan(
                          text: widget.title,
                          style: context.textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = AppColors.primaryGradient.createShader(
                                const Rect.fromLTWH(0.0, 0.0, 300.0, 24.0),
                              ),
                          ),
                        ),
                        TextSpan(text: suffix),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Video Container Card
                  Expanded(
                    child: Hero(
                      tag: widget.fromGeneration
                          ? 'template-hero-${widget.themeId}'
                          : 'user-video-hero-${widget.videoId}',
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: SizedBox.expand(
                          child: BlocBuilder<ResultBloc, ResultState>(
                            bloc: _bloc,
                            builder: (context, state) {
                              return state.maybeWhen(
                                ready: (
                                  videoId,
                                  title,
                                  imageUrl,
                                  videoUrl,
                                  createdAt,
                                  isPlaying,
                                  isMuted,
                                  isBuffering,
                                  extendPrompt,
                                  extendQuality,
                                  extendDuration,
                                  inspireMeCount,
                                  isGeneratingExtended,
                                  isDeleted,
                                  isDownloading,
                                  isSharing,
                                  downloadErrorMessage,
                                  shareErrorMessage,
                                  downloadSuccess,
                                  shareSuccess,
                                  isVip,
                                ) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                        // 1. Reusable smooth video player
                                        Positioned.fill(
                                          child: SmoothVideoPlayerWidget(
                                            videoUrl: videoUrl,
                                            imageUrl: imageUrl,
                                            externalPlayer: _bloc.player,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                          ),
                                        ),

                                        // 2. Bottom Glassmorphic Overlay: Original image thumbnail + title + datetime info
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
                                                  AppColors.black.withValues(
                                                    alpha: 0.8,
                                                  ),
                                                  AppColors.black.withValues(
                                                    alpha: 0.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                              vertical: 16.0,
                                            ),
                                            child: Row(
                                              children: [
                                                // Original Thumbnail preview
                                                if (imageUrl != null)
                                                  ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                          Radius.circular(4),
                                                        ),
                                                    child: Image.network(
                                                      imageUrl,
                                                      width: 50,
                                                      height: 54,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context, error, stackTrace) {
                                                        return Container(
                                                          width: 50,
                                                          height: 54,
                                                          decoration: const BoxDecoration(
                                                            color: Colors.grey,
                                                            borderRadius: BorderRadius.all(
                                                              Radius.circular(4),
                                                            ),
                                                          ),
                                                          child: const Icon(
                                                            Icons.image_not_supported_outlined,
                                                            color: Colors.white24,
                                                            size: 20,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                else
                                                  Container(
                                                    width: 50,
                                                    height: 54,
                                                    decoration:
                                                        const BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                Radius.circular(
                                                                  4,
                                                                ),
                                                              ),
                                                        ),
                                                    child: const Icon(
                                                      Icons.image,
                                                      color: Colors.white24,
                                                      size: 20,
                                                    ),
                                                  ),
                                                const SizedBox(width: 16),

                                                // Titles and Meta information
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        title,
                                                        style:
                                                            context
                                                                .textTheme
                                                                .titleLarge
                                                                ?.copyWith(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ) ??
                                                            const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                            ),
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .calendar_today_outlined,
                                                            size: 12,
                                                            color:
                                                                AppColors.subText,
                                                          ),
                                                          const SizedBox(
                                                            width: 6,
                                                          ),
                                                          Text(
                                                            createdAt,
                                                            style: context
                                                                .textTheme
                                                                .bodySmall
                                                                ?.copyWith(
                                                                  color: AppColors
                                                                      .subText,
                                                                  fontSize: 12,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // 3. Right-Side Controls: Share, Download, and Delete stack
                                        Positioned(
                                          right: 16,
                                          bottom: 76,
                                          child: Column(
                                            children: [
                                              // Share Action Button
                                              Column(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          100,
                                                        ),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 4,
                                                        sigmaY: 4,
                                                      ),
                                                      child: Material(
                                                        color: AppColors.black
                                                            .withValues(
                                                              alpha: 0.1,
                                                            ),
                                                        shape:
                                                            const CircleBorder(),
                                                        child: InkWell(
                                                          onTap: isSharing
                                                              ? null
                                                              : () {
                                                                  _bloc.add(const ResultEvent.shareVideo());
                                                                },
                                                          borderRadius:
                                                              const BorderRadius.all(
                                                                Radius.circular(
                                                                  100,
                                                                ),
                                                              ),
                                                          child: SizedBox(
                                                            width: 42,
                                                            height: 42,
                                                            child: isSharing
                                                                ? const Padding(
                                                                    padding: EdgeInsets.all(11),
                                                                    child: CircularProgressIndicator(
                                                                      strokeWidth: 2,
                                                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                                                    ),
                                                                  )
                                                                  : Center(
                                                                      child: AppSvgIcon(
                                                                        assetName: Assets.icons.icShare,
                                                                        color: AppColors.white,
                                                                        width: 18,
                                                                        height: 18,
                                                                      ),
                                                                    ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    t.result.share,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              const SizedBox(height: 30),

                                              // Download Action Button
                                              Column(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          100,
                                                        ),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 4,
                                                        sigmaY: 4,
                                                      ),
                                                      child: Material(
                                                        color: AppColors.black
                                                            .withValues(
                                                              alpha: 0.1,
                                                            ),
                                                        shape:
                                                            const CircleBorder(),
                                                        child: InkWell(
                                                          onTap: isDownloading
                                                              ? null
                                                              : () async {
                                                                  final hasPermission = await AppPermissionHandler.checkAndRequestPhotosPermission(context);
                                                                  if (!context.mounted) return;
                                                                  if (hasPermission) {
                                                                    _bloc.add(const ResultEvent.downloadVideo());
                                                                  }
                                                                },
                                                          borderRadius:
                                                              const BorderRadius.all(
                                                                Radius.circular(
                                                                  100,
                                                                ),
                                                              ),
                                                          child: SizedBox(
                                                            width: 42,
                                                            height: 42,
                                                            child: isDownloading
                                                                ? const Padding(
                                                                    padding: EdgeInsets.all(11),
                                                                    child: CircularProgressIndicator(
                                                                      strokeWidth: 2,
                                                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                                                    ),
                                                                  )
                                                                  : Center(
                                                                      child: AppSvgIcon(
                                                                        assetName: Assets.icons.icDownload,
                                                                        color: AppColors.white,
                                                                        width: 18,
                                                                        height: 18,
                                                                      ),
                                                                    ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    t.result.download,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              const SizedBox(height: 30),

                                              // Delete Action Button
                                              Column(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          100,
                                                        ),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 4,
                                                        sigmaY: 4,
                                                      ),
                                                      child: Material(
                                                        color: AppColors.black
                                                            .withValues(
                                                              alpha: 0.1,
                                                            ),
                                                        shape:
                                                            const CircleBorder(),
                                                        child: InkWell(
                                                          onTap: () =>
                                                              _showDeleteConfirmationDialog(
                                                                context,
                                                              ),
                                                          borderRadius:
                                                              const BorderRadius.all(
                                                                Radius.circular(
                                                                  100,
                                                                ),
                                                              ),
                                                          child: SizedBox(
                                                            width: 42,
                                                            height: 42,
                                                            child: Center(
                                                              child: AppSvgIcon(
                                                                assetName: Assets.icons.icDelete,
                                                                color: AppColors.white,
                                                                width: 18,
                                                                height: 18,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    t.result.delete,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                orElse: () {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      if (widget.imageUrl.isNotEmpty)
                                        Positioned.fill(
                                          child: widget.imageUrl.startsWith('http')
                                              ? Image.network(widget.imageUrl, fit: BoxFit.cover)
                                              : (widget.imageUrl.startsWith('assets/')
                                                  ? Image.asset(widget.imageUrl, fit: BoxFit.cover)
                                                  : Image.file(File(widget.imageUrl), fit: BoxFit.cover)),
                                        ),
                                      const Center(
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Bottom Action buttons
                  Column(
                    children: [
                      // Regenerate Button (Gradient fill)
                      InkWell(
                        onTap: () {
                          // Replace current route with GeneratingPage again to re-run generation
                          context.replaceNamed(
                            GeneratingPage.name,
                            queryParameters: {
                              'title': widget.title,
                              'imageUrl': widget.imageUrl,
                              'themeId': widget.themeId,
                              'themeType': widget.themeType,
                              'themeOrgId': widget.themeOrgId.toString(),
                              'isHd': widget.isHd.toString(),
                              'isLongTime': widget.isLongTime.toString(),
                              'serviceType': widget.serviceType,
                              if (widget.videoUrlSrc != null) 'videoUrl': widget.videoUrlSrc,
                            },
                          );
                        },
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        child: Ink(
                          height: 56,
                          decoration: BoxDecoration(
                            gradient: context.appTheme.primaryGradient,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppSvgIcon(
                                  width: 22,
                                  height: 22,
                                  assetName: 'assets/icons/ic_regenerate.svg',
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  t.result.regenerate,
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

                      const SizedBox(height: 12),

                      // Extend Video Button (Border outline + on-surface background)
                      InkWell(
                        onTap: () => _showExtendBottomSheet(context),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppColors.onSurface,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                            border: GradientBoxBorder(
                              gradient: context.appTheme.primaryGradient,
                              width: 1.2,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Center(
                                  child: AppSvgIcon(
                                    width: 22,
                                    height: 22,
                                    assetName: Assets.icons.icExtend,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  t.result.extend_video,
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

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    final t = context.t;
    AppConfirmDialog.show(
      context: context,
      title: t.profile.deleteTitle,
      description: t.profile.deleteDesc,
      cancelLabel: t.profile.cancel,
      confirmLabel: t.profile.delete,
      onConfirm: () {
        Navigator.pop(context);
        _bloc.add(const ResultEvent.deleteVideo());
      },
    );
  }

  void _showExtendBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.onSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (sheetContext) {
        return ExtendVideoBottomSheet(
          resultBloc: _bloc,
          videoTitle: widget.title,
          videoImageUrl: widget.imageUrl,
        );
      },
    );
  }
}
