import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:core_business/core_business.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final SharedPreferences sharedPreferences;

  OnboardingBloc({required this.sharedPreferences}) : super(const OnboardingState.initial()) {
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
                await sharedPreferences.setBool(StorageKeys.isOnboardingCompleted, true);
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
