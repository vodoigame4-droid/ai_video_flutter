import 'dart:ui';
import 'package:ai_video_flutter/core/widgets/app_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/smooth_video_player_widget.dart';
import '../../../../i18n/strings.g.dart';
import '../bloc/result_bloc.dart';
import '../bloc/result_event.dart';
import '../bloc/result_state.dart';
import '../widgets/extend_video_bottom_sheet.dart';
import 'generating_page.dart';

class ResultPage extends StatefulWidget {
  static const String path = '/result';
  static const String name = 'result';

  static void push(
    BuildContext context, {
    required String videoId,
    required String title,
    required String imageUrl,
    required String videoUrl,
    required String createdAt,
    bool replace = false,
  }) {
    final params = {
      'videoId': videoId,
      'title': title,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'createdAt': createdAt,
    };
    if (replace) {
      context.replaceNamed(name, queryParameters: params);
    } else {
      context.pushNamed(name, queryParameters: params);
    }
  }

  final String videoId;
  final String title;
  final String imageUrl;
  final String videoUrl;
  final String createdAt;

  const ResultPage({
    super.key,
    required this.videoId,
    required this.title,
    required this.imageUrl,
    required this.videoUrl,
    required this.createdAt,
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
        listenWhen: (previous, current) =>
            current.maybeMap(ready: (s) => s.isDeleted, orElse: () => false),
        listener: (context, state) {
          state.mapOrNull(
            ready: (s) {
              if (s.isDeleted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      t.report_dialog.success,
                    ), // Reuse reported/deleted success message or general success
                    duration: const Duration(seconds: 2),
                  ),
                );
                // Pop back to home/profile
                context.pop();
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
                        color: AppColors.white.withValues(alpha: 0.1),
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
                      Material(
                        color: Colors.transparent,
                        shape: const CircleBorder(),
                        child: InkWell(
                          onTap: () => _showReportDialog(context),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
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
                  ),

                  const SizedBox(height: 12),

                  // Subtitle/Info row: Spark icon + Video title status info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) =>
                            AppColors.primaryGradient.createShader(bounds),
                        blendMode: BlendMode.srcIn,
                        child: const Icon(Icons.auto_awesome_rounded, size: 16),
                      ),
                      const SizedBox(width: 6),
                      RichText(
                        text: TextSpan(
                          style: context.textTheme.bodySmall?.copyWith(
                            color: AppColors.subText,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(text: prefix),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: ShaderMask(
                                shaderCallback: (bounds) => AppColors
                                    .primaryGradient
                                    .createShader(bounds),
                                blendMode: BlendMode.srcIn,
                                child: Text(
                                  widget.title,
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: AppColors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            TextSpan(text: suffix),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Video Container Card
                  Expanded(
                    child: BlocBuilder<ResultBloc, ResultState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          ready:
                              (
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
                              ) {
                                return ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  child: SizedBox.expand(
                                    child: Stack(
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
                                                          onTap: () {
                                                            ScaffoldMessenger.of(
                                                              context,
                                                            ).showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  t.result.share_success,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          borderRadius:
                                                              const BorderRadius.all(
                                                                Radius.circular(
                                                                  100,
                                                                ),
                                                              ),
                                                          child: const SizedBox(
                                                            width: 42,
                                                            height: 42,
                                                            child: Icon(
                                                              Icons.share_rounded,
                                                              color:
                                                                  AppColors.white,
                                                              size: 20,
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
                                                          onTap: () {
                                                            ScaffoldMessenger.of(
                                                              context,
                                                            ).showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  t.result.download_success,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          borderRadius:
                                                              const BorderRadius.all(
                                                                Radius.circular(
                                                                  100,
                                                                ),
                                                              ),
                                                          child: const SizedBox(
                                                            width: 42,
                                                            height: 42,
                                                            child: Icon(
                                                              Icons
                                                                  .download_rounded,
                                                              color:
                                                                  AppColors.white,
                                                              size: 20,
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
                                                          child: const SizedBox(
                                                            width: 42,
                                                            height: 42,
                                                            child: Icon(
                                                              Icons
                                                                  .delete_outline_rounded,
                                                              color:
                                                                  AppColors.white,
                                                              size: 20,
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
                                    ),
                                  ),
                                );
                              },
                          orElse: () =>
                              const Center(child: CircularProgressIndicator()),
                        );
                      },
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
                            border: Border.all(
                              color: AppColors.secondary,
                              width: 1.2,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.open_in_full_rounded,
                                  color: AppColors.white,
                                  size: 22,
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
                    t.profile.deleteTitle,
                    style:
                        context.textTheme.titleMedium?.copyWith(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ) ??
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    t.profile.deleteDesc,
                    style:
                        context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.subText,
                          fontSize: 15,
                          height: 1.4,
                        ) ??
                        const TextStyle(
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
                              t.profile.cancel,
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
                            _bloc.add(const ResultEvent.deleteVideo());
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
                                t.profile.delete,
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
}
