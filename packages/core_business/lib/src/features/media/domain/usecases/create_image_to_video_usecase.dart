import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/media_models.dart';
import '../entities/media_entities.dart';
import '../repositories/media_repository.dart';

class CreateImageToVideoParams {
  final String imageUrl;
  final String name;
  final String prompt;
  final String themeId;
  final String themeType;
  final int themeOrgId;
  final bool isHd;
  final bool isLongTime;

  CreateImageToVideoParams({
    required this.imageUrl,
    required this.name,
    required this.prompt,
    required this.themeId,
    required this.themeType,
    required this.themeOrgId,
    required this.isHd,
    required this.isLongTime,
  });
}

class CreateImageToVideoUseCase implements UseCase<MediaEntity, CreateImageToVideoParams> {
  final MediaRepository mediaRepository;

  CreateImageToVideoUseCase({required this.mediaRepository});

  @override
  Future<Resource<MediaEntity>> call(CreateImageToVideoParams params) {
    final request = CreateTgvRequestModel(
      imageUrl: params.imageUrl,
      name: params.name,
      prompt: params.prompt,
      themeId: params.themeId,
      themeType: params.themeType,
      themeOrgId: params.themeOrgId,
      isHd: params.isHd,
      isLongTime: params.isLongTime,
      serviceType: 'IMAGE_TO_VIDEO',
    );
    return mediaRepository.createTgv(request);
  }
}
