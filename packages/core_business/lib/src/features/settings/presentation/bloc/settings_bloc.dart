import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/src/core/resources/resource.dart';
import '../../domain/usecases/get_settings_usecase.dart';
import '../../domain/usecases/save_settings_usecase.dart';
import '../../../../core/usecases/usecase.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetSettingsUseCase getSettingsUseCase;
  final SaveSettingsUseCase saveSettingsUseCase;

  SettingsBloc({
    required this.getSettingsUseCase,
    required this.saveSettingsUseCase,
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
    final result = await getSettingsUseCase(NoParams());
    result.when(
      initial: () {},
      loading: () {},
      empty: () => emit(const SettingsState.ready(currentLanguageCode: 'en')),
      success: (locale) => emit(SettingsState.ready(currentLanguageCode: locale)),
      error: (message) => emit(const SettingsState.ready(currentLanguageCode: 'en')),
    );
  }

  Future<void> _onChangeLanguage(String languageCode, Emitter<SettingsState> emit) async {
    emit(const SettingsState.loading());
    final result = await saveSettingsUseCase(languageCode);
    result.when(
      initial: () {},
      loading: () {},
      empty: () {},
      success: (_) => emit(SettingsState.ready(currentLanguageCode: languageCode)),
      error: (message) => emit(SettingsState.ready(currentLanguageCode: languageCode)),
    );
  }
}
