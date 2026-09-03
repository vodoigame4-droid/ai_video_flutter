import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class UpdateReviewerUseCase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  UpdateReviewerUseCase({required this.authRepository});

  @override
  Future<Resource<void>> call(NoParams params) {
    return authRepository.updateReviewer();
  }
}
