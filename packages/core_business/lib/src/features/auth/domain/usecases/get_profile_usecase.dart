import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class GetProfileUseCase implements UseCase<UserEntity, NoParams> {
  final AuthRepository authRepository;

  GetProfileUseCase({required this.authRepository});

  @override
  Future<Resource<UserEntity>> call(NoParams params) {
    return authRepository.getProfile();
  }
}
