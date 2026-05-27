import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/template_entity.dart';

part 'template_model.freezed.dart';
part 'template_model.g.dart';

@freezed
abstract class TemplateModel with _$TemplateModel {
  const factory TemplateModel({
    required String id,
    required String title,
    required String imageUrl,
    required String viewsCount,
    required String badgeType,
  }) = _TemplateModel;

  factory TemplateModel.fromJson(Map<String, dynamic> json) =>
      _$TemplateModelFromJson(json);
}

extension TemplateModelX on TemplateModel {
  TemplateEntity toEntity() => TemplateEntity(
        id: id,
        title: title,
        imageUrl: imageUrl,
        viewsCount: viewsCount,
        badgeType: badgeType,
      );
}
