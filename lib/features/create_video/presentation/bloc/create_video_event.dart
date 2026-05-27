import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_video_event.freezed.dart';

@freezed
abstract class CreateVideoEvent with _$CreateVideoEvent {
  const factory CreateVideoEvent.init(int initialTab) = _Init;
  const factory CreateVideoEvent.changeTab(int tabIndex) = _ChangeTab;
  const factory CreateVideoEvent.updatePrompt(String prompt) = _UpdatePrompt;
  const factory CreateVideoEvent.inspireMe() = _InspireMe;
  const factory CreateVideoEvent.clearPrompt() = _ClearPrompt;
  const factory CreateVideoEvent.selectMedia(int slotIndex, String mediaPath) = _SelectMedia;
  const factory CreateVideoEvent.removeMedia(int slotIndex) = _RemoveMedia;
  const factory CreateVideoEvent.selectQuality(String quality) = _SelectQuality;
  const factory CreateVideoEvent.selectDuration(String duration) = _SelectDuration;
  const factory CreateVideoEvent.generateVideo() = _GenerateVideo;
}
