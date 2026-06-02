import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_trim_state.freezed.dart';

@freezed
abstract class VideoTrimState with _$VideoTrimState {
  const factory VideoTrimState.initial() = _Initial;
  const factory VideoTrimState.loading() = _Loading;
  const factory VideoTrimState.ready({
    required bool isPlaying,
    required double startValue,
    required double endValue,
  }) = _Ready;
  const factory VideoTrimState.saving() = _Saving;
  const factory VideoTrimState.saveSuccess({required String outputPath}) = _SaveSuccess;
  const factory VideoTrimState.failure({required String message}) = _Failure;
}
