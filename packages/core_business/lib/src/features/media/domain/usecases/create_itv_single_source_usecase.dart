import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/media_models.dart';
import '../entities/media_entities.dart';
import '../repositories/media_repository.dart';

class CreateItvSingleSourceParams {
  final String imageUrl;
  final String name;
  final String prompt;
  final bool isHd;
  final bool isLongTime;

  CreateItvSingleSourceParams({
    required this.imageUrl,
    required this.name,
    required this.prompt,
    required this.isHd,
    required this.isLongTime,
  });
}

class CreateItvSingleSourceUseCase implements UseCase<MediaEntity, CreateItvSingleSourceParams> {
  final MediaRepository mediaRepository;

  CreateItvSingleSourceUseCase({required this.mediaRepository});

  @override
  Future<Resource<MediaEntity>> call(CreateItvSingleSourceParams params) {
    final request = CreateTgvRequestModel(
      imageUrl: params.imageUrl,
      name: params.name,
      prompt: params.prompt,
      themeId: '1',
      themeType: 'TEMPLATE',
      themeOrgId: 1,
      isHd: params.isHd,
      isLongTime: params.isLongTime,
      serviceType: 'ITV_SINGLE_SOURCE',
    );
    return mediaRepository.createTgv(request);
  }
}
