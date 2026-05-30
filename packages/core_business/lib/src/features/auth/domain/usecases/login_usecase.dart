import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginParams {
  final String deviceId;
  final String? refCode;

  LoginParams({required this.deviceId, this.refCode});
}

class LoginUseCase implements UseCase<UserEntity, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<Resource<UserEntity>> call(LoginParams params) {
    return authRepository.login(params.deviceId, params.refCode);
  }
}
