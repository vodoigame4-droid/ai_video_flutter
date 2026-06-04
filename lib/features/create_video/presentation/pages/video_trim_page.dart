import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_trimmer/video_trimmer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../i18n/strings.g.dart';
import 'package:core_business/core_business.dart';
import '../../../../core/extensions/context_failure_ext.dart';
import '../bloc/video_trim/video_trim_bloc.dart';
import '../bloc/video_trim/video_trim_event.dart';
import '../bloc/video_trim/video_trim_state.dart';

class VideoTrimPage extends StatefulWidget {
  static const String path = '/video-trim';
  static const String name = 'video-trim';

  final String videoPath;

  const VideoTrimPage({super.key, required this.videoPath});

  @override
  State<VideoTrimPage> createState() => _VideoTrimPageState();
}

class _VideoTrimPageState extends State<VideoTrimPage> {
  final Trimmer _trimmer = Trimmer();
  late final VideoTrimBloc _bloc;

  double _startValue = 0.0;
  double _endValue = 0.0;

  @override
  void initState() {
    super.initState();
    _bloc = VideoTrimBloc()
      ..add(
        VideoTrimEvent.loadVideo(
          videoPath: widget.videoPath,
          trimmer: _trimmer,
        ),
      );
  }

  @override
  void dispose() {
    _trimmer.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<VideoTrimBloc, VideoTrimState>(
        listener: (context, state) {
          state.whenOrNull(
            saveSuccess: (outputPath) {
              Navigator.pop(context, outputPath);
            },
            failure: (message) {
              context.handleFailure(Failure.business(code: message, message: ''));
            },
          );
        },
        builder: (context, state) {
          final t = context.t;

          final isLoading = state.maybeWhen(
            ready: (isPlaying, start, end) => false,
            saving: () => false,
            orElse: () => true,
          );
          final isSaving = state.maybeWhen(
            saving: () => true,
            orElse: () => false,
          );
          final isPlaying = state.maybeWhen(
            ready: (playing, start, end) => playing,
            orElse: () => false,
          );

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                t.create.trim_title,
                style:
                    context.textTheme.titleMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ) ??
                    const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: VideoViewer(trimmer: _trimmer),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.surface,
                          border: Border(
                            top: BorderSide(
                              color: AppColors.border,
                              width: 1.0,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 24,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TrimViewer(
                              trimmer: _trimmer,
                              viewerHeight: 50.0,
                              viewerWidth:
                                  MediaQuery.of(context).size.width - 32,
                              maxVideoLength: const Duration(seconds: 10),
                              onChangeStart: (value) {
                                _startValue = value;
                              },
                              onChangeEnd: (value) {
                                _endValue = value;
                              },
                              onChangePlaybackState: (value) {
                                if (!_bloc.isClosed) {
                                  _bloc.add(
                                    VideoTrimEvent.updatePlayback(value),
                                  );
                                }
                              },
                              // Premium styling config
                              showDuration: true,
                              durationTextStyle: const TextStyle(
                                color: AppColors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                              durationStyle: DurationStyle.FORMAT_MM_SS,
                              editorProperties: const TrimEditorProperties(
                                borderPaintColor: AppColors.primary,
                                circlePaintColor: AppColors.primary,
                                scrubberPaintColor: AppColors.white,
                                borderWidth: 3.0,
                                borderRadius: 8.0,
                                circleSize: 6.0,
                                circleSizeOnDrag: 9.0,
                              ),
                              areaProperties: const TrimAreaProperties(
                                thumbnailQuality: 30,
                                borderRadius: 8.0,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    isPlaying
                                        ? Icons.pause_circle_filled_rounded
                                        : Icons.play_circle_fill_rounded,
                                    size: 48,
                                    color: AppColors.primary,
                                  ),
                                  onPressed: () async {
                                    final playbackState = await _trimmer
                                        .videoPlaybackControl(
                                          startValue: _startValue,
                                          endValue: _endValue,
                                        );
                                    if (!_bloc.isClosed) {
                                      _bloc.add(
                                        VideoTrimEvent.updatePlayback(
                                          playbackState,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                             GradientButton(
                               width: double.infinity,
                               height: 56,
                               label: t.create.trim_save,
                               onPressed: () {
                                 if (!_bloc.isClosed) {
                                   _bloc.add(
                                     VideoTrimEvent.saveVideo(
                                       trimmer: _trimmer,
                                       startValue: _startValue,
                                       endValue: _endValue,
                                     ),
                                   );
                                 }
                               },
                             ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (isLoading)
                  Container(
                    color: AppColors.background,
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                if (isSaving)
                  Container(
                    color: AppColors.black.withValues(alpha: 0.7),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            t.create.trimming_loading,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
