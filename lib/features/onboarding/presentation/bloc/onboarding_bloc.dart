import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/core_business.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final CompleteOnboardingUseCase completeOnboardingUseCase;

  OnboardingBloc({required this.completeOnboardingUseCase}) : super(const OnboardingState.initial()) {
    on<OnboardingEvent>((event, emit) async {
      await event.when(
        init: () async {
          emit(const OnboardingState.currentPage(index: 0, isCompleted: false));
        },
        pageChanged: (index) async {
          emit(OnboardingState.currentPage(index: index, isCompleted: false));
        },
        nextPage: () async {
          await state.maybeWhen(
            currentPage: (index, isCompleted) async {
              if (index < 4) {
                emit(OnboardingState.currentPage(index: index + 1, isCompleted: false));
              } else {
                await completeOnboardingUseCase(NoParams());
                emit(OnboardingState.currentPage(index: index, isCompleted: true));
              }
            },
            orElse: () async {
              emit(const OnboardingState.currentPage(index: 0, isCompleted: false));
            },
          );
        },
      );
    });
  }
}
