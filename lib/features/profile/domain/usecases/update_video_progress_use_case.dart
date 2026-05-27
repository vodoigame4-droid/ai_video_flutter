import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/profile_repository.dart';

class UpdateVideoProgressParams {
  final String id;
  final double progress;
  final String status;

  UpdateVideoProgressParams({
    required this.id,
    required this.progress,
    required this.status,
  });
}

class UpdateVideoProgressUseCase implements UseCase<void, UpdateVideoProgressParams> {
  final ProfileRepository repository;

  UpdateVideoProgressUseCase(this.repository);

  @override
  Future<Resource<void>> call(UpdateVideoProgressParams params) {
    return repository.updateVideoProgress(params.id, params.progress, params.status);
  }
}
