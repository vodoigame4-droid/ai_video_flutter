import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        init: () async {
          emit(const HomeState.loading());
          // Giả lập thời gian load dữ liệu từ API
          await Future.delayed(const Duration(milliseconds: 600));
          emit(const HomeState.loaded(
            categories: ['All', 'Anime', 'Epic Morph', 'Toy Box', 'Trending', 'New'],
            selectedCategory: 'All',
            trendingVideos: [
              'Selfie Aquaman',
              'Cyberpunk Girl',
              'Robot Dance',
              'Neon Forest'
            ],
            newVideos: [
              'Sunset Drive',
              'Glitch City',
              'Astronaut Moon',
              'Epic Waves'
            ],
            currentLocale: 'en',
          ));
        },
        selectCategory: (category) {
          state.mapOrNull(
            loaded: (loadedState) {
              emit(loadedState.copyWith(selectedCategory: category));
            },
          );
        },
        changeLanguage: (localeCode) {
          state.mapOrNull(
            loaded: (loadedState) {
              emit(loadedState.copyWith(currentLocale: localeCode));
            },
          );
        },
      );
    });
  }
}
