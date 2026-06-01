import 'package:freezed_annotation/freezed_annotation.dart';

part 'generating_event.freezed.dart';

@freezed
abstract class GeneratingEvent with _$GeneratingEvent {
  const factory GeneratingEvent.startGenerating({
    required String title,
    required String? imageUrl,
    @Default('1') String themeId,
    @Default('TEMPLATE') String themeType,
    @Default(1) int themeOrgId,
    @Default(false) bool isHd,
    @Default(false) bool isLongTime,
    @Default('IMAGE_TO_VIDEO') String serviceType,
    String? videoUrl,
    String? prompt,
  }) = _StartGenerating;

  const factory GeneratingEvent.tickProgress() = _TickProgress;
  const factory GeneratingEvent.notifyComplete() = _NotifyComplete;
}
