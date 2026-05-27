import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.init() = _Init;
  const factory HomeEvent.selectCategory(String category) = _SelectCategory;
  const factory HomeEvent.changeLanguage(String localeCode) = _ChangeLanguage;
}
