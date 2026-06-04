import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial() = _Initial;
  const factory OnboardingState.loading() = _Loading;
  const factory OnboardingState.ready({
    required List<String> images,
    required int index,
    required bool isCompleted,
  }) = _Ready;
  const factory OnboardingState.error({required String message}) = _Error;
}
