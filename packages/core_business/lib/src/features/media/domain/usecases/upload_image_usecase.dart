import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/media_repository.dart';

class UploadImageUseCase implements UseCase<String, String> {
  final MediaRepository mediaRepository;

  UploadImageUseCase({required this.mediaRepository});

  @override
  Future<Resource<String>> call(String filePath) {
    return mediaRepository.uploadImage(filePath);
  }
}
