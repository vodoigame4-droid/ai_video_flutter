import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core_business/src/core/resources/resource.dart';
import '../../../domain/entities/media_entities.dart';

part 'templates_state.freezed.dart';

@freezed
abstract class TemplatesState with _$TemplatesState {
  const factory TemplatesState.initial() = _Initial;
  const factory TemplatesState.loading() = _Loading;
  const factory TemplatesState.ready({
    required Resource<List<String>> categoriesState,
    required String selectedCategory,
    required Resource<List<ThemeEntity>> templatesState,
  }) = _Ready;
  const factory TemplatesState.error({required String message}) = _Error;
}
