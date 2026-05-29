import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_event.freezed.dart';

@freezed
abstract class ResultEvent with _$ResultEvent {
  const factory ResultEvent.init({
    required String videoId,
    required String title,
    required String? imageUrl,
    required String videoUrl,
    required String createdAt,
  }) = _Init;

  const factory ResultEvent.togglePlay() = _TogglePlay;
  const factory ResultEvent.toggleMute() = _ToggleMute;
  const factory ResultEvent.updatePlaying(bool isPlaying) = _UpdatePlaying;
  const factory ResultEvent.updateBuffering(bool isBuffering) = _UpdateBuffering;
  const factory ResultEvent.changeExtendPrompt(String prompt) = _ChangeExtendPrompt;
  const factory ResultEvent.clearExtendPrompt() = _ClearPrompt;
  const factory ResultEvent.useInspireMe() = _UseInspireMe;
  const factory ResultEvent.changeExtendQuality(String quality) = _ChangeExtendQuality;
  const factory ResultEvent.changeExtendDuration(String duration) = _ChangeExtendDuration;
  const factory ResultEvent.deleteVideo() = _DeleteVideo;
}
