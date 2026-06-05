import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/media_repository.dart';

class GetBannersUseCase implements UseCase<List<String>, NoParams> {
  final MediaRepository mediaRepository;

  GetBannersUseCase({required this.mediaRepository});

  @override
  Future<Resource<List<String>>> call(NoParams params) {
    return mediaRepository.getBanners();
  }
}
