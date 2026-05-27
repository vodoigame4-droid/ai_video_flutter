import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_event.freezed.dart';

@freezed
abstract class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.init() = _Init;
  const factory OnboardingEvent.pageChanged(int index) = _PageChanged;
  const factory OnboardingEvent.nextPage() = _NextPage;
}
