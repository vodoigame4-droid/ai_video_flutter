import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/media_models.dart';
import '../entities/media_entities.dart';
import '../repositories/media_repository.dart';

class CreateItvDualSourceParams {
  final List<String> imageUrls;
  final String name;
  final String prompt;
  final bool isHd;
  final bool isLongTime;

  CreateItvDualSourceParams({
    required this.imageUrls,
    required this.name,
    required this.prompt,
    required this.isHd,
    required this.isLongTime,
  });
}

class CreateItvDualSourceUseCase implements UseCase<MediaEntity, CreateItvDualSourceParams> {
  final MediaRepository mediaRepository;

  CreateItvDualSourceUseCase({required this.mediaRepository});

  @override
  Future<Resource<MediaEntity>> call(CreateItvDualSourceParams params) {
    final request = CreateTgvRequestModel(
      imageUrl: params.imageUrls.join(','),
      name: params.name,
      prompt: params.prompt,
      themeId: '1',
      themeType: 'TEMPLATE',
      themeOrgId: 1,
      isHd: params.isHd,
      isLongTime: params.isLongTime,
      serviceType: 'ITV_DUAL_SOURCE',
    );
    return mediaRepository.createTgv(request);
  }
}
