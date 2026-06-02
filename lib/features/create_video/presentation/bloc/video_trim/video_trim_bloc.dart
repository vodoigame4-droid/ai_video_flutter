import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_trimmer/video_trimmer.dart';
import '../../../../../core/utils/log_utils.dart';
import 'video_trim_event.dart';
import 'video_trim_state.dart';

class VideoTrimBloc extends Bloc<VideoTrimEvent, VideoTrimState> {
  VideoTrimBloc() : super(const VideoTrimState.initial()) {
    on<VideoTrimEvent>((event, emit) async {
      await event.when(
        loadVideo: (videoPath, trimmer) async {
          LogUtils.d("VideoTrimBloc: Loading video: $videoPath");
          emit(const VideoTrimState.loading());
          try {
            await trimmer.loadVideo(videoFile: File(videoPath));
            emit(const VideoTrimState.ready(
              isPlaying: false,
              startValue: 0.0,
              endValue: 0.0,
            ));
          } catch (e, stack) {
            LogUtils.e("VideoTrimBloc: Error loading video", error: e, stackTrace: stack);
            emit(VideoTrimState.failure(message: e.toString()));
          }
        },
        updatePlayback: (isPlaying) {
          state.mapOrNull(
            ready: (readyState) {
              emit(readyState.copyWith(isPlaying: isPlaying));
            },
          );
        },
        updateRange: (startValue, endValue) {
          state.mapOrNull(
            ready: (readyState) {
              emit(readyState.copyWith(startValue: startValue, endValue: endValue));
            },
          );
        },
        saveVideo: (trimmer, startValue, endValue) async {
          LogUtils.d("VideoTrimBloc: Saving trimmed video from $startValue to $endValue");
          emit(const VideoTrimState.saving());
          
          final completer = Completer<String?>();
          try {
            await trimmer.saveTrimmedVideo(
              startValue: startValue,
              endValue: endValue,
              storageDir: StorageDir.temporaryDirectory,
              onSave: (outputPath) {
                if (!completer.isCompleted) {
                  completer.complete(outputPath);
                }
              },
            );
            
            final outputPath = await completer.future;
            if (outputPath != null && outputPath.isNotEmpty) {
              LogUtils.i("VideoTrimBloc: Saved trimmed video to $outputPath");
              emit(VideoTrimState.saveSuccess(outputPath: outputPath));
            } else {
              LogUtils.e("VideoTrimBloc: Saving video returned null/empty path");
              emit(const VideoTrimState.failure(message: "Failed to save trimmed video"));
            }
          } catch (e, stack) {
            LogUtils.e("VideoTrimBloc: Error saving video", error: e, stackTrace: stack);
            emit(VideoTrimState.failure(message: e.toString()));
          }
        },
      );
    });
  }
}
