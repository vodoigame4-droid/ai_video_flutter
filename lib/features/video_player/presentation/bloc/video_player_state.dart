import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_player_state.freezed.dart';

@freezed
abstract class VideoPlayerState with _$VideoPlayerState {
  const factory VideoPlayerState.initial() = _Initial;
  const factory VideoPlayerState.loading() = _Loading;
  const factory VideoPlayerState.ready({
    required String videoPath,
    required bool isPlaying,
    required bool isMuted,
    required bool isBuffering,
    required Duration position,
    required Duration duration,
  }) = _Ready;
  const factory VideoPlayerState.error({required String message}) = _Error;
}
