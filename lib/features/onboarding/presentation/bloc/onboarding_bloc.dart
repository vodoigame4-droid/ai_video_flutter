import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/core_business.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/services/remote_config_service.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final CompleteOnboardingUseCase completeOnboardingUseCase;

  OnboardingBloc({required this.completeOnboardingUseCase})
    : super(const OnboardingState.initial()) {
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
            emit(
              OnboardingState.ready(
                images: images,
                index: 0,
                isCompleted: false,
              ),
            );
            return;
          }

          emit(const OnboardingState.loading());
          final urls = sl<RemoteConfigService>().getOnboardingUrls();
          final List<String> images = [];
          for (int i = 0; i < 5; i++) {
            if (i < urls.length && urls[i].isNotEmpty) {
              images.add(urls[i]);
            } else {
              images.add(fallbackImages[i]);
            }
          }
          emit(
            OnboardingState.ready(images: images, index: 0, isCompleted: false),
          );
        },
        pageChanged: (index) async {
          state.maybeWhen(
            ready: (images, currentIndex, isCompleted) {
              emit(
                OnboardingState.ready(
                  images: images,
                  index: index,
                  isCompleted: false,
                ),
              );
            },
            orElse: () {},
          );
        },
        nextPage: () async {
          await state.maybeWhen(
            ready: (images, index, isCompleted) async {
              if (index < 4) {
                emit(
                  OnboardingState.ready(
                    images: images,
                    index: index + 1,
                    isCompleted: false,
                  ),
                );
              } else {
                unawaited(completeOnboardingUseCase(NoParams()));
                emit(
                  OnboardingState.ready(
                    images: images,
                    index: index,
                    isCompleted: true,
                  ),
                );
              }
            },
            orElse: () {},
          );
        },
      );
    });
  }
}
