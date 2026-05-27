import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/profile_repository.dart';

class DeleteUserVideoUseCase implements UseCase<bool, String> {
  final ProfileRepository repository;

  DeleteUserVideoUseCase(this.repository);

  @override
  Future<Resource<bool>> call(String id) {
    return repository.deleteUserVideo(id);
  }
}
