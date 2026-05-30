import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/storage_keys.dart';

class SaveSettingsUseCase implements UseCase<void, String> {
  final SharedPreferences sharedPreferences;

  SaveSettingsUseCase({required this.sharedPreferences});

  @override
  Future<Resource<void>> call(String languageCode) async {
    try {
      await sharedPreferences.setString(StorageKeys.selectedLocale, languageCode);
      return const Resource.success(null);
    } catch (e) {
      return const Resource.error(message: 'Failed to save settings');
    }
  }
}
