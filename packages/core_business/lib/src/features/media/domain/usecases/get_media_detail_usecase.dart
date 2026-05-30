import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/media_entities.dart';
import '../repositories/media_repository.dart';

class GetMediaDetailUseCase implements UseCase<MediaEntity, String> {
  final MediaRepository mediaRepository;

  GetMediaDetailUseCase({required this.mediaRepository});

  @override
  Future<Resource<MediaEntity>> call(String id) {
    return mediaRepository.getMediaDetail(id);
  }
}
