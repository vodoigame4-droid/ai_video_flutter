import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/media_entities.dart';
import '../repositories/media_repository.dart';

class GetMediaStatusesUseCase implements UseCase<List<MediaStatusEntity>, List<String>> {
  final MediaRepository mediaRepository;

  GetMediaStatusesUseCase({required this.mediaRepository});

  @override
  Future<Resource<List<MediaStatusEntity>>> call(List<String> ids) {
    return mediaRepository.getMediaStatuses(ids);
  }
}
