import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_trimmer/video_trimmer.dart';

part 'video_trim_event.freezed.dart';

@freezed
abstract class VideoTrimEvent with _$VideoTrimEvent {
  const factory VideoTrimEvent.loadVideo({
    required String videoPath,
    required Trimmer trimmer,
  }) = _LoadVideo;
  const factory VideoTrimEvent.saveVideo({
    required Trimmer trimmer,
    required double startValue,
    required double endValue,
  }) = _SaveVideo;
  const factory VideoTrimEvent.updatePlayback(bool isPlaying) = _UpdatePlayback;
  const factory VideoTrimEvent.updateRange(double startValue, double endValue) = _UpdateRange;
}
