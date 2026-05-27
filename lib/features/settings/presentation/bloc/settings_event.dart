import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../i18n/strings.g.dart';

part 'settings_event.freezed.dart';

@freezed
abstract class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.init() = _Init;
  const factory SettingsEvent.changeLanguage(AppLocale locale) = _ChangeLanguage;
}
