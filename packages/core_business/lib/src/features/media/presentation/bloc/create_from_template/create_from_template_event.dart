import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_from_template_event.freezed.dart';

@freezed
abstract class CreateFromTemplateEvent with _$CreateFromTemplateEvent {
  const factory CreateFromTemplateEvent.init({
    required String templateId,
    required String title,
    required String videoUrl,
    required String imageUrl,
    required String themeType,
    required int themeOrgId,
  }) = _Init;

  const factory CreateFromTemplateEvent.selectPhoto(String path) = _SelectPhoto;
  const factory CreateFromTemplateEvent.removePhoto() = _RemovePhoto;
  const factory CreateFromTemplateEvent.selectQuality(String quality) = _SelectQuality;
  const factory CreateFromTemplateEvent.selectDuration(String duration) = _SelectDuration;
  const factory CreateFromTemplateEvent.startGenerating() = _StartGenerating;
}
