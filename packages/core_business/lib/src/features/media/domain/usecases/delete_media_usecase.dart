import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/media_repository.dart';

class DeleteMediaUseCase implements UseCase<void, String> {
  final MediaRepository mediaRepository;

  DeleteMediaUseCase({required this.mediaRepository});

  @override
  Future<Resource<void>> call(String id) {
    return mediaRepository.deleteMedia(id);
  }
}
