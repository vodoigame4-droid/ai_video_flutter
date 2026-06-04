import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/media_repository.dart';

class GetOnboardingImagesUseCase implements UseCase<List<String>, NoParams> {
  final MediaRepository mediaRepository;

  GetOnboardingImagesUseCase({required this.mediaRepository});

  @override
  Future<Resource<List<String>>> call(NoParams params) {
    return mediaRepository.getOnboardingImages();
  }
}
