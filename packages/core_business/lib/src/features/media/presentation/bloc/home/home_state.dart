import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core_business/src/core/resources/resource.dart';
import '../../../domain/entities/media_entities.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.ready({
    required Resource<List<HomeCategoryEntity>> categoriesState,
    required String selectedCategory,
    required Resource<List<ThemeEntity>> trendingVideosState,
    required Resource<List<ThemeEntity>> newVideosState,
    required String currentLocale,
  }) = _Ready;
  const factory HomeState.error({required String message}) = _Error;
}
