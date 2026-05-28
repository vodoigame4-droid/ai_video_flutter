import 'package:freezed_annotation/freezed_annotation.dart';

part 'generating_event.freezed.dart';

@freezed
abstract class GeneratingEvent with _$GeneratingEvent {
  const factory GeneratingEvent.startGenerating({
    required String title,
    required String? imageUrl,
  }) = _StartGenerating;

  const factory GeneratingEvent.tickProgress() = _TickProgress;
  const factory GeneratingEvent.notifyComplete() = _NotifyComplete;
}
