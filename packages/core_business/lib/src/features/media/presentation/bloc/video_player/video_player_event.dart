import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_player_event.freezed.dart';

@freezed
abstract class VideoPlayerEvent with _$VideoPlayerEvent {
  const factory VideoPlayerEvent.init({required String url}) = _Init;
  const factory VideoPlayerEvent.togglePlay() = _TogglePlay;
  const factory VideoPlayerEvent.toggleMute() = _ToggleMute;
  const factory VideoPlayerEvent.seek(Duration position) = _Seek;
  const factory VideoPlayerEvent.updatePosition(Duration position) = _UpdatePosition;
  const factory VideoPlayerEvent.updateDuration(Duration duration) = _UpdateDuration;
  const factory VideoPlayerEvent.updateBuffering(bool isBuffering) = _UpdateBuffering;
}
