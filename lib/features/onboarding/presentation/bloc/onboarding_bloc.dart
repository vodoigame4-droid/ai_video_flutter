import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/core_business.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final CompleteOnboardingUseCase completeOnboardingUseCase;
  final GetOnboardingImagesUseCase getOnboardingImagesUseCase;

  OnboardingBloc({
    required this.completeOnboardingUseCase,
    required this.getOnboardingImagesUseCase,
  }) : super(const OnboardingState.initial()) {
    on<OnboardingEvent>((event, emit) async {
      await event.when(
        init: (preloadedImages) async {
          final fallbackImages = [
            'assets/images/ob_1.png',
            'assets/images/ob_2.png',
            'assets/images/ob_3.png',
            'assets/images/ob_4.png',
            'assets/images/ob_5.png',
          ];

          if (preloadedImages != null && preloadedImages.isNotEmpty) {
            final List<String> images = [];
            for (int i = 0; i < 5; i++) {
              if (i < preloadedImages.length && preloadedImages[i].isNotEmpty) {
                images.add(preloadedImages[i]);
              } else {
                images.add(fallbackImages[i]);
              }
            }
            emit(OnboardingState.ready(
              images: images,
              index: 0,
              isCompleted: false,
            ));
            return;
          }

          emit(const OnboardingState.loading());
          final result = await getOnboardingImagesUseCase(NoParams());
          result.when(
            initial: () {},
            loading: () {},
            success: (data) {
              final List<String> images = [];
              for (int i = 0; i < 5; i++) {
                if (i < data.length && data[i].isNotEmpty) {
                  images.add(data[i]);
                } else {
                  images.add(fallbackImages[i]);
                }
              }
              emit(OnboardingState.ready(
                images: images,
                index: 0,
                isCompleted: false,
              ));
            },
            empty: () {
              emit(OnboardingState.ready(
                images: fallbackImages,
                index: 0,
                isCompleted: false,
              ));
            },
            error: (failure) {
              LogUtils.e('Failed to fetch onboarding images: ${failure.toString()}');
              emit(OnboardingState.ready(
                images: fallbackImages,
                index: 0,
                isCompleted: false,
              ));
            },
          );
        },
        pageChanged: (index) async {
          state.maybeWhen(
            ready: (images, currentIndex, isCompleted) {
              emit(OnboardingState.ready(
                images: images,
                index: index,
                isCompleted: false,
              ));
            },
            orElse: () {},
          );
        },
        nextPage: () async {
          await state.maybeWhen(
            ready: (images, index, isCompleted) async {
              if (index < 4) {
                emit(OnboardingState.ready(
                  images: images,
                  index: index + 1,
                  isCompleted: false,
                ));
              } else {
                await completeOnboardingUseCase(NoParams());
                emit(OnboardingState.ready(
                  images: images,
                  index: index,
                  isCompleted: true,
                ));
              }
            },
            orElse: () {},
          );
        },
      );
    });
  }
}
