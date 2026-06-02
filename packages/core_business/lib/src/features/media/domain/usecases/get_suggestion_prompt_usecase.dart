import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/media_repository.dart';

class GetSuggestionPromptUseCase implements UseCase<String, String> {
  final MediaRepository mediaRepository;

  GetSuggestionPromptUseCase({required this.mediaRepository});

  @override
  Future<Resource<String>> call(String imageUrl) {
    return mediaRepository.getSuggestionPrompt(imageUrl);
  }
}
