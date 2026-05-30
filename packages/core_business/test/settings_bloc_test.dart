import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:core_business/core_business.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockPrefs;
  late SettingsBloc settingsBloc;

  setUp(() {
    mockPrefs = MockSharedPreferences();
    when(() => mockPrefs.getString('selected_locale')).thenReturn(null);
    when(() => mockPrefs.setString(any(), any())).thenAnswer((_) async => true);
    
    settingsBloc = SettingsBloc(
      getSettingsUseCase: GetSettingsUseCase(sharedPreferences: mockPrefs),
      saveSettingsUseCase: SaveSettingsUseCase(sharedPreferences: mockPrefs),
    );
  });

  tearDown(() {
    settingsBloc.close();
  });

  group('SettingsBloc Tests', () {
    test('initial state should be SettingsState.initial()', () {
      expect(settingsBloc.state, const SettingsState.initial());
    });

    blocTest<SettingsBloc, SettingsState>(
      'emits [loading, ready] with default locale (en) on init when no saved locale exists',
      build: () => settingsBloc,
      act: (bloc) => bloc.add(const SettingsEvent.init()),
      expect: () => [
        const SettingsState.loading(),
        const SettingsState.ready(currentLanguageCode: 'en'),
      ],
      verify: (_) {
        verify(() => mockPrefs.getString('selected_locale')).called(1);
      },
    );

    blocTest<SettingsBloc, SettingsState>(
      'emits [loading, ready] with saved locale on init when saved locale exists',
      setUp: () {
        when(() => mockPrefs.getString('selected_locale')).thenReturn('vi');
      },
      build: () => settingsBloc,
      act: (bloc) => bloc.add(const SettingsEvent.init()),
      expect: () => [
        const SettingsState.loading(),
        const SettingsState.ready(currentLanguageCode: 'vi'),
      ],
    );

    blocTest<SettingsBloc, SettingsState>(
      'emits [loading, ready] and saves locale to SharedPreferences on changeLanguage',
      build: () => settingsBloc,
      act: (bloc) => bloc.add(const SettingsEvent.changeLanguage('vi')),
      expect: () => [
        const SettingsState.loading(),
        const SettingsState.ready(currentLanguageCode: 'vi'),
      ],
      verify: (_) {
        verify(() => mockPrefs.setString('selected_locale', 'vi')).called(1);
      },
    );
  });
}
