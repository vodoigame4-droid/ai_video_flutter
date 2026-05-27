import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/resources/resource.dart';
import '../../domain/entities/template_entity.dart';

part 'templates_state.freezed.dart';

@freezed
abstract class TemplatesState with _$TemplatesState {
  const factory TemplatesState.initial() = _Initial;
  const factory TemplatesState.loading() = _Loading;
  const factory TemplatesState.ready({
    required Resource<List<String>> categoriesState,
    required String selectedCategory,
    required Resource<List<TemplateEntity>> templatesState,
  }) = _Ready;
  const factory TemplatesState.error({required String message}) = _Error;
}
