import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/src/core/resources/resource.dart';
import 'package:core_business/src/core/errors/failure.dart';
import 'package:core_business/src/core/utils/log_utils.dart';
import 'package:core_business/src/core/usecases/usecase.dart';
import '../../../../auth/domain/usecases/get_profile_usecase.dart';
import '../../../domain/entities/media_entities.dart';
import '../../../domain/usecases/get_home_categories_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeCategoriesUseCase getHomeCategoriesUseCase;
  final GetProfileUseCase getProfileUseCase;

  HomeBloc({
    required this.getHomeCategoriesUseCase,
    required this.getProfileUseCase,
  }) : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        init: () async {
          emit(const HomeState.loading());
          LogUtils.d('HomeBloc: Init fetching home categories');
          await _fetchHomeData(emit, isRefresh: false);
        },
        refresh: (completer) async {
          LogUtils.d('HomeBloc: Refreshing home categories and profile');
          await _fetchHomeData(emit, isRefresh: true);
          completer?.complete();
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

  Future<void> _fetchHomeData(Emitter<HomeState> emit, {required bool isRefresh}) async {
    try {
      await getProfileUseCase(NoParams());
    } catch (e) {
      LogUtils.w('HomeBloc: Get profile warning during fetch: $e');
    }

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
          currentLocale: state.maybeWhen(ready: (_, __, ___, ____, loc) => loc, orElse: () => 'en'),
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

        final currentSelected = state.maybeWhen(
          ready: (_, selected, __, ___, ____) => selected,
          orElse: () => 'All',
        );
        final currentLocale = state.maybeWhen(
          ready: (_, __, ___, ____, loc) => loc,
          orElse: () => 'en',
        );

        emit(HomeState.ready(
          categoriesState: Resource.success(categories),
          selectedCategory: currentSelected,
          trendingVideosState: Resource.success(trendingThemes),
          newVideosState: Resource.success(newThemes),
          currentLocale: currentLocale,
        ));
      },
      error: (failure) {
        LogUtils.e('HomeBloc: Fetch categories failed: ${failure.toErrorCodeOrMessage()}');
        if (isRefresh) {
          state.mapOrNull(
            ready: (readyState) {
              emit(readyState.copyWith(categoriesState: Resource.error(failure)));
            },
          );
        } else {
          emit(HomeState.error(message: failure.toErrorCodeOrMessage()));
        }
      },
    );
  }
}

