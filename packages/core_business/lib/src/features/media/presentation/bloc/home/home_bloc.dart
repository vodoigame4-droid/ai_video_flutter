import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/src/core/resources/resource.dart';
import 'package:core_business/src/core/utils/log_utils.dart';
import 'package:core_business/src/core/usecases/usecase.dart';
import '../../../domain/entities/media_entities.dart';
import '../../../domain/usecases/get_home_categories_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeCategoriesUseCase getHomeCategoriesUseCase;

  HomeBloc({required this.getHomeCategoriesUseCase}) : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        init: () async {
          emit(const HomeState.loading());
          LogUtils.d('HomeBloc: Init fetching home categories');

          final result = await getHomeCategoriesUseCase(NoParams());

          result.when(
            initial: () {},
            loading: () {},
            empty: () {
              emit(HomeState.ready(
                categoriesState: const Resource.empty(),
                selectedCategory: 'All',
                trendingVideosState: const Resource.success([]),
                newVideosState: const Resource.success([]),
                currentLocale: 'en',
              ));
            },
            success: (categories) {
              // Extract "Trending" and "New" themes
              final trendingCategory = categories.firstWhere(
                (c) => c.name.toLowerCase() == 'trending',
                orElse: () => categories.isNotEmpty
                    ? categories.first
                    : const HomeCategoryEntity(id: '0', name: 'Trending', theme: []),
              );
              
              final newCategory = categories.firstWhere(
                (c) => c.name.toLowerCase() == 'new' || c.name.toLowerCase() == 'popular',
                orElse: () => categories.length > 1
                    ? categories[1]
                    : (categories.isNotEmpty ? categories.first : const HomeCategoryEntity(id: '0', name: 'New', theme: [])),
              );

              final trendingThemes = trendingCategory.theme ?? [];
              final newThemes = newCategory.theme ?? [];

              emit(HomeState.ready(
                categoriesState: Resource.success(categories),
                selectedCategory: 'All',
                trendingVideosState: Resource.success(trendingThemes),
                newVideosState: Resource.success(newThemes),
                currentLocale: 'en',
              ));
            },
            error: (message) {
              LogUtils.e('HomeBloc: Fetch categories failed: $message');
              emit(HomeState.error(message: message));
            },
          );
        },
        selectCategory: (category) {
          state.mapOrNull(
            ready: (readyState) {
              emit(readyState.copyWith(selectedCategory: category));
            },
          );
        },
        changeLanguage: (localeCode) {
          state.mapOrNull(
            ready: (readyState) {
              emit(readyState.copyWith(currentLocale: localeCode));
            },
          );
        },
      );
    });
  }
}
