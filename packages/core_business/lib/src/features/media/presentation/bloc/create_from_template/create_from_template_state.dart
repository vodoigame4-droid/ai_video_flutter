import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_from_template_state.freezed.dart';

@freezed
abstract class CreateFromTemplateState with _$CreateFromTemplateState {
  const factory CreateFromTemplateState.initial() = _Initial;
  const factory CreateFromTemplateState.loading() = _Loading;
  
  const factory CreateFromTemplateState.ready({
    required String templateId,
    required String title,
    required String videoUrl,
    required String imageUrl,
    String? selectedPhotoPath,
    required bool showSettings,
    required String quality,
    required String duration,
    required bool isGenerating,
    @Default(false) bool isSuccess,
  }) = _Ready;

  const factory CreateFromTemplateState.error({required String message}) = _Error;
}
