import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/media_repository.dart';

class UploadVideoUseCase implements UseCase<String, String> {
  final MediaRepository mediaRepository;

  UploadVideoUseCase({required this.mediaRepository});

  @override
  Future<Resource<String>> call(String filePath) {
    return mediaRepository.uploadVideo(filePath);
  }
}
