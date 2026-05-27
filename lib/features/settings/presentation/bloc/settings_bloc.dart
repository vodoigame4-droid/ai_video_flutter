import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../i18n/strings.g.dart';
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
        changeLanguage: (locale) => _onChangeLanguage(locale, emit),
      );
    });
  }

  Future<void> _onInit(Emitter<SettingsState> emit) async {
    emit(const SettingsState.loading());
    final savedLocaleCode = sharedPreferences.getString('selected_locale');
    AppLocale currentLocale = AppLocale.en; // Default locale

    if (savedLocaleCode != null) {
      try {
        currentLocale = AppLocale.values.firstWhere(
          (locale) => locale.languageCode == savedLocaleCode,
        );
      } catch (_) {
        // Fallback to device locale or English
      }
    } else {
      // Use currently active locale from Slang
      currentLocale = LocaleSettings.currentLocale;
    }

    emit(SettingsState.ready(currentLocale: currentLocale));
  }

  Future<void> _onChangeLanguage(AppLocale locale, Emitter<SettingsState> emit) async {
    emit(const SettingsState.loading());
    
    // Set locale dynamically in Slang (using async to load deferred translations)
    await LocaleSettings.setLocale(locale);
    
    // Persist locale code
    await sharedPreferences.setString('selected_locale', locale.languageCode);

    emit(SettingsState.ready(currentLocale: locale));
  }
}
