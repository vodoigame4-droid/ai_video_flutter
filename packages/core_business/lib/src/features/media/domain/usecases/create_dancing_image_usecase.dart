import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/media_models.dart';
import '../entities/media_entities.dart';
import '../repositories/media_repository.dart';

class CreateDancingImageParams {
  final String imageUrl;
  final String videoUrl;
  final String name;
  final String prompt;
  final bool isHd;
  final bool isLongTime;

  CreateDancingImageParams({
    required this.imageUrl,
    required this.videoUrl,
    required this.name,
    required this.prompt,
    required this.isHd,
    required this.isLongTime,
  });
}

class CreateDancingImageUseCase implements UseCase<MediaEntity, CreateDancingImageParams> {
  final MediaRepository mediaRepository;

  CreateDancingImageUseCase({required this.mediaRepository});

  @override
  Future<Resource<MediaEntity>> call(CreateDancingImageParams params) {
    final request = CreateTgvRequestModel(
      imageUrl: params.imageUrl,
      videoUrl: params.videoUrl,
      name: params.name,
      prompt: params.prompt,
      themeId: '1',
      themeType: 'TEMPLATE',
      themeOrgId: 1,
      isHd: params.isHd,
      isLongTime: params.isLongTime,
      serviceType: 'DANCING_IMAGE',
    );
    return mediaRepository.createTgv(request);
  }
}
