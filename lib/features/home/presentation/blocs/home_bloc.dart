import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/resource.dart';
import 'package:ai_video_flutter/features/templates/domain/usecases/get_templates_use_case.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTemplatesUseCase getTemplatesUseCase;

  HomeBloc({required this.getTemplatesUseCase}) : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        init: () async {
          emit(const HomeState.loading());
          
          final trendingVideosResult = await getTemplatesUseCase('Trending');
          final newVideosResult = await getTemplatesUseCase('New');
          
          emit(HomeState.ready(
            categoriesState: const Resource.success(['All', 'Anime', 'Epic Morph', 'Toy Box', 'Trending', 'New']),
            selectedCategory: 'All',
            trendingVideosState: trendingVideosResult,
            newVideosState: newVideosResult,
            currentLocale: 'en',
          ));
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

