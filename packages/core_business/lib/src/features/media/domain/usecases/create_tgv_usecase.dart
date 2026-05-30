import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/media_models.dart';
import '../entities/media_entities.dart';
import '../repositories/media_repository.dart';

class CreateTgvUseCase implements UseCase<MediaEntity, CreateTgvRequestModel> {
  final MediaRepository mediaRepository;

  CreateTgvUseCase({required this.mediaRepository});

  @override
  Future<Resource<MediaEntity>> call(CreateTgvRequestModel request) {
    return mediaRepository.createTgv(request);
  }
}
