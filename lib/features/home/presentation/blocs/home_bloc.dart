import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/resource.dart';
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
          emit(HomeState.ready(
            categoriesState: const Resource.success(['All', 'Anime', 'Epic Morph', 'Toy Box', 'Trending', 'New']),
            selectedCategory: 'All',
            trendingVideosState: const Resource.success([
              'Selfie Aquaman',
              'Cyberpunk Girl',
              'Robot Dance',
              'Neon Forest'
            ]),
            newVideosState: const Resource.success([
              'Sunset Drive',
              'Glitch City',
              'Astronaut Moon',
              'Epic Waves'
            ]),
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
