import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState.initial()) {
    on<OnboardingEvent>((event, emit) {
      event.when(
        init: () {
          emit(const OnboardingState.currentPage(index: 0, isCompleted: false));
        },
        pageChanged: (index) {
          emit(OnboardingState.currentPage(index: index, isCompleted: false));
        },
        nextPage: () {
          state.maybeWhen(
            currentPage: (index, isCompleted) {
              if (index < 4) {
                emit(OnboardingState.currentPage(index: index + 1, isCompleted: false));
              } else {
                emit(OnboardingState.currentPage(index: index, isCompleted: true));
              }
            },
            orElse: () {
              emit(const OnboardingState.currentPage(index: 0, isCompleted: false));
            },
          );
        },
      );
    });
  }
}
