import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/constants/storage_keys.dart';

class CompleteOnboardingUseCase implements UseCase<void, NoParams> {
  final SharedPreferences sharedPreferences;

  CompleteOnboardingUseCase({required this.sharedPreferences});

  @override
  Future<Resource<void>> call(NoParams params) async {
    try {
      await sharedPreferences.setBool(StorageKeys.isOnboardingCompleted, true);
      return const Resource.success(null);
    } catch (e) {
      return const Resource.error(message: 'Failed to complete onboarding');
    }
  }
}
