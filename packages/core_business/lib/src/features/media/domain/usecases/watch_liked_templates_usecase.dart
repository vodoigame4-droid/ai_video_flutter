import '../entities/media_entities.dart';
import '../repositories/liked_templates_repository.dart';

class WatchLikedTemplatesUseCase {
  final LikedTemplatesRepository _repository;

  WatchLikedTemplatesUseCase(this._repository);

  Stream<List<ThemeEntity>> call() {
    return _repository.watchLikedTemplates();
  }
}
