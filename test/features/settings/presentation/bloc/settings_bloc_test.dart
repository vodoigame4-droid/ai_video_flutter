import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_video_flutter/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:ai_video_flutter/features/settings/presentation/bloc/settings_event.dart';
import 'package:ai_video_flutter/features/settings/presentation/bloc/settings_state.dart';
import 'package:ai_video_flutter/i18n/strings.g.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockPrefs;
  late SettingsBloc settingsBloc;

  setUp(() {
    mockPrefs = MockSharedPreferences();
    // Return values for sharedPreferences methods
    when(() => mockPrefs.getString('selected_locale')).thenReturn(null);
    when(() => mockPrefs.setString(any(), any())).thenAnswer((_) async => true);
    
    settingsBloc = SettingsBloc(sharedPreferences: mockPrefs);
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
        const SettingsState.ready(currentLocale: AppLocale.en),
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
        const SettingsState.ready(currentLocale: AppLocale.vi),
      ],
    );

    blocTest<SettingsBloc, SettingsState>(
      'emits [loading, ready] and saves locale to SharedPreferences on changeLanguage',
      setUp: () async {
        await AppLocale.vi.build();
      },
      build: () => settingsBloc,
      act: (bloc) => bloc.add(const SettingsEvent.changeLanguage(AppLocale.vi)),
      expect: () => [
        const SettingsState.loading(),
        const SettingsState.ready(currentLocale: AppLocale.vi),
      ],
      verify: (_) {
        verify(() => mockPrefs.setString('selected_locale', 'vi')).called(1);
      },
    );
  });
}
