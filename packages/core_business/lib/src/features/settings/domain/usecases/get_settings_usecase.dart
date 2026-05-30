import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/storage_keys.dart';

class GetSettingsUseCase implements UseCase<String, NoParams> {
  final SharedPreferences sharedPreferences;

  GetSettingsUseCase({required this.sharedPreferences});

  @override
  Future<Resource<String>> call(NoParams params) async {
    try {
      final savedLocaleCode = sharedPreferences.getString(StorageKeys.selectedLocale) ?? 'en';
      return Resource.success(savedLocaleCode);
    } catch (e) {
      return const Resource.error(message: 'Failed to get settings');
    }
  }
}
