import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/resources/resource.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/constants/storage_keys.dart';

class GetOnboardingStatusUseCase implements UseCase<bool, NoParams> {
  final SharedPreferences sharedPreferences;

  GetOnboardingStatusUseCase({required this.sharedPreferences});

  @override
  Future<Resource<bool>> call(NoParams params) async {
    try {
      final isCompleted = sharedPreferences.getBool(StorageKeys.isOnboardingCompleted) ?? false;
      return Resource.success(isCompleted);
    } catch (e) {
      return const Resource.error(Failure.unknown('Failed to read onboarding status'));
    }
  }
}
