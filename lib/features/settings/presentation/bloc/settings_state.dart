import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../i18n/strings.g.dart';

part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.ready({
    required AppLocale currentLocale,
  }) = _Ready;
}
