import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class UpdateReviewerUseCase implements UseCase<UserEntity, NoParams> {
  final AuthRepository authRepository;

  UpdateReviewerUseCase({required this.authRepository});

  @override
  Future<Resource<UserEntity>> call(NoParams params) {
    return authRepository.updateReviewer();
  }
}
