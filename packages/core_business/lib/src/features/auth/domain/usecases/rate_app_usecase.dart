import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class RateAppUseCase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  RateAppUseCase({required this.authRepository});

  @override
  Future<Resource<void>> call(NoParams params) {
    return authRepository.rateApp();
  }
}
