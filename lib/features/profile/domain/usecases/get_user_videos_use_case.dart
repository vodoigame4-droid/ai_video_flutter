import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_video_entity.dart';
import '../repositories/profile_repository.dart';

class GetUserVideosUseCase implements UseCase<List<UserVideoEntity>, NoParams> {
  final ProfileRepository repository;

  GetUserVideosUseCase(this.repository);

  @override
  Future<Resource<List<UserVideoEntity>>> call(NoParams params) {
    return repository.getUserVideos();
  }
}
