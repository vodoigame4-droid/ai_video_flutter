import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferences sharedPreferences;

  SettingsBloc({
    required this.sharedPreferences,
  }) : super(const SettingsState.initial()) {
    on<SettingsEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeLanguage: (languageCode) => _onChangeLanguage(languageCode, emit),
      );
    });
  }

  Future<void> _onInit(Emitter<SettingsState> emit) async {
    emit(const SettingsState.loading());
    final savedLocaleCode = sharedPreferences.getString('selected_locale') ?? 'en';
    emit(SettingsState.ready(currentLanguageCode: savedLocaleCode));
  }

  Future<void> _onChangeLanguage(String languageCode, Emitter<SettingsState> emit) async {
    emit(const SettingsState.loading());
    
    // Persist locale code
    await sharedPreferences.setString('selected_locale', languageCode);

    emit(SettingsState.ready(currentLanguageCode: languageCode));
  }
}
