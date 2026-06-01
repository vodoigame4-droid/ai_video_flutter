import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/media_models.dart';
import '../entities/media_entities.dart';
import '../repositories/media_repository.dart';

class CreateTransitionVideoParams {
  final String firstImageUrl;
  final String secondImageUrl;
  final String name;
  final String prompt;
  final bool isHd;
  final bool isLongTime;

  CreateTransitionVideoParams({
    required this.firstImageUrl,
    required this.secondImageUrl,
    required this.name,
    required this.prompt,
    required this.isHd,
    required this.isLongTime,
  });
}

class CreateTransitionVideoUseCase implements UseCase<MediaEntity, CreateTransitionVideoParams> {
  final MediaRepository mediaRepository;

  CreateTransitionVideoUseCase({required this.mediaRepository});

  @override
  Future<Resource<MediaEntity>> call(CreateTransitionVideoParams params) {
    final request = CreateTgvRequestModel(
      imageUrl: '${params.firstImageUrl},${params.secondImageUrl}',
      name: params.name,
      prompt: params.prompt,
      themeId: '1',
      themeType: 'TEMPLATE',
      themeOrgId: 1,
      isHd: params.isHd,
      isLongTime: params.isLongTime,
      serviceType: 'TRANSITION_VIDEO',
    );
    return mediaRepository.createTgv(request);
  }
}
