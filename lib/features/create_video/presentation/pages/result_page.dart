import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:media_kit_video/media_kit_video.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/gradient_border_container.dart';
import '../../../../i18n/strings.g.dart';
import '../bloc/result_bloc.dart';
import '../bloc/result_event.dart';
import '../bloc/result_state.dart';
import 'generating_page.dart';

class ResultPage extends StatefulWidget {
  static const String path = '/result';
  static const String name = 'result';

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
  late final VideoController _controller;

  @override
  void initState() {
    super.initState();
    _bloc = ResultBloc()
      ..add(ResultEvent.init(
        videoId: widget.videoId,
        title: widget.title,
        imageUrl: widget.imageUrl.isEmpty ? null : widget.imageUrl,
        videoUrl: widget.videoUrl,
        createdAt: widget.createdAt,
      ));
    _controller = VideoController(_bloc.player);
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocProvider.value(
      value: _bloc,
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

                    // Page Title
                    Text(
                      t.result.title,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ) ?? const TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),

                    // Report/Flag button
                    Material(
                      color: Colors.transparent,
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
                ),

                const SizedBox(height: 12),

                // Subtitle/Info row: Spark icon + Video title status info
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                      blendMode: BlendMode.srcIn,
                      child: const Icon(
                        Icons.auto_awesome_rounded,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      t.result.ready_message(title: widget.title),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.subText,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
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
                        ready: (videoId, title, imageUrl, videoUrl, createdAt, isPlaying, isMuted, isBuffering) {
                          return ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Video render screen
                                Positioned.fill(
                                  child: Container(
                                    color: AppColors.onSurface,
                                    child: Video(
                                      controller: _controller,
                                      fill: AppColors.black,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                // Thumbnail placeholder shown when not playing or loading
                                if (!isPlaying && imageUrl != null)
                                  Positioned.fill(
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                // Large Center Play/Pause toggle
                                if (!isPlaying || isBuffering)
                                  GestureDetector(
                                    onTap: () => _bloc.add(const ResultEvent.togglePlay()),
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.black.withValues(alpha: 0.25),
                                      ),
                                      child: isBuffering
                                          ? const Padding(
                                              padding: EdgeInsets.all(24.0),
                                              child: CircularProgressIndicator(
                                                strokeWidth: 3,
                                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                                              ),
                                            )
                                          : const Icon(
                                              Icons.play_arrow_rounded,
                                              color: AppColors.white,
                                              size: 40,
                                            ),
                                    ),
                                  ),

                                // Top-Left: Volume/Loudspeaker Toggle Button
                                Positioned(
                                  top: 16,
                                  left: 16,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                      child: Material(
                                        color: AppColors.black.withValues(alpha: 0.1),
                                        shape: const CircleBorder(),
                                        child: InkWell(
                                          onTap: () => _bloc.add(const ResultEvent.toggleMute()),
                                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                                          child: SizedBox(
                                            width: 42,
                                            height: 42,
                                            child: Icon(
                                              isMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
                                              color: AppColors.white,
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // Bottom Glassmorphic Overlay: Original image thumbnail + title + datetime info
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
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                                    child: Row(
                                      children: [
                                        // Original Thumbnail preview
                                        if (imageUrl != null)
                                          ClipRRect(
                                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                                            child: Image.network(
                                              imageUrl,
                                              width: 50,
                                              height: 54,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        else
                                          Container(
                                            width: 50,
                                            height: 54,
                                            decoration: const BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.all(Radius.circular(4)),
                                            ),
                                            child: const Icon(Icons.image, color: Colors.white24, size: 20),
                                          ),
                                        const SizedBox(width: 16),

                                        // Titles and Meta information
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                title,
                                                style: context.textTheme.titleLarge?.copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ) ?? const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.calendar_today_outlined,
                                                    size: 12,
                                                    color: AppColors.subText,
                                                  ),
                                                  const SizedBox(width: 6),
                                                  Text(
                                                    createdAt,
                                                    style: context.textTheme.bodySmall?.copyWith(
                                                      color: AppColors.subText,
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

                                // Right-Side Controls: Share and Download stack
                                Positioned(
                                  right: 16,
                                  bottom: 120,
                                  child: Column(
                                    children: [
                                      // Share Action Button
                                      Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                              child: Material(
                                                color: AppColors.black.withValues(alpha: 0.1),
                                                shape: const CircleBorder(),
                                                child: InkWell(
                                                  onTap: () {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      const SnackBar(content: Text("Video link copied to share")),
                                                    );
                                                  },
                                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                                  child: const SizedBox(
                                                    width: 42,
                                                    height: 42,
                                                    child: Icon(
                                                      Icons.share_rounded,
                                                      color: AppColors.white,
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
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 24),

                                      // Download Action Button
                                      Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                              child: Material(
                                                color: AppColors.black.withValues(alpha: 0.1),
                                                shape: const CircleBorder(),
                                                child: InkWell(
                                                  onTap: () {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      const SnackBar(content: Text("Video saved to gallery")),
                                                    );
                                                  },
                                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                                  child: const SizedBox(
                                                    width: 42,
                                                    height: 42,
                                                    child: Icon(
                                                      Icons.download_rounded,
                                                      color: AppColors.white,
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
                                              fontWeight: FontWeight.normal,
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
                          );
                        },
                        orElse: () => const Center(child: CircularProgressIndicator()),
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
                              const Icon(
                                Icons.refresh_rounded,
                                color: AppColors.white,
                                size: 24,
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

                    // Create Another Video Button (Border outline + black background)
                    InkWell(
                      onTap: () {
                        // Pops back to CreateVideoPage since Generating replaced itself
                        context.pop();
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      child: GradientBorderContainer(
                        borderRadius: const BorderRadius.all(Radius.circular(100)),
                        borderWidth: 1.2,
                        gradient: AppColors.borderGradient,
                        backgroundColor: AppColors.onSurface,
                        child: SizedBox(
                          height: 56,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ShaderMask(
                                  shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                                  blendMode: BlendMode.srcIn,
                                  child: const Icon(
                                    Icons.auto_awesome,
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  t.result.create_another,
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
                    ),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
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
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                          child: Container(
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.1),
                              borderRadius: const BorderRadius.all(Radius.circular(100)),
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
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                          child: Ink(
                            height: 48,
                            decoration: const BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
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
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
