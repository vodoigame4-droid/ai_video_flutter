import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/resources/resource.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.ready({
    required Resource<List<String>> categoriesState,
    required String selectedCategory,
    required Resource<List<String>> trendingVideosState,
    required Resource<List<String>> newVideosState,
    required String currentLocale,
  }) = _Ready;
  const factory HomeState.error({required String message}) = _Error;
}
