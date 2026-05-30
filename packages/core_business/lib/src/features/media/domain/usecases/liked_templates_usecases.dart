import '../entities/media_entities.dart';
import '../repositories/liked_templates_repository.dart';

class GetLikedTemplatesUseCase {
  final LikedTemplatesRepository _repository;

  GetLikedTemplatesUseCase(this._repository);

  Future<List<ThemeEntity>> call() {
    return _repository.getLikedTemplates();
  }
}

class IsTemplateLikedUseCase {
  final LikedTemplatesRepository _repository;

  IsTemplateLikedUseCase(this._repository);

  Future<bool> call(String id) {
    return _repository.isTemplateLiked(id);
  }
}

class ToggleLikeTemplateUseCase {
  final LikedTemplatesRepository _repository;

  ToggleLikeTemplateUseCase(this._repository);

  Future<void> call(ThemeEntity theme) {
    return _repository.toggleLikeTemplate(theme);
  }
}
