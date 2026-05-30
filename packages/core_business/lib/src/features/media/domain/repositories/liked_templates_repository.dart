import '../../domain/entities/media_entities.dart';

abstract class LikedTemplatesRepository {
  Future<List<ThemeEntity>> getLikedTemplates();
  Future<bool> isTemplateLiked(String id);
  Future<void> toggleLikeTemplate(ThemeEntity theme);
  Stream<List<ThemeEntity>> watchLikedTemplates();
}
