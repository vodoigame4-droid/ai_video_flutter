import '../../../../core/resources/resource.dart';
import '../../data/models/media_models.dart';
import '../entities/media_entities.dart';

abstract class MediaRepository {
  Future<Resource<List<HomeCategoryEntity>>> getHomeCategories({
    required String appType,
    required String version,
  });

  Future<Resource<List<HomeCategoryEntity>>> getCategories({
    required String appType,
    required String version,
  });

  Future<Resource<PaginatedListEntity<ThemeEntity>>> getThemes({
    required String appType,
    required String version,
    String? categoryId,
    int? page,
    int? take,
    bool? isFeatured,
  });

  Future<Resource<MediaEntity>> createTgv(CreateTgvRequestModel request);

  Future<Resource<MediaEntity>> getMediaDetail(String id);

  Future<Resource<PaginatedListEntity<MediaEntity>>> getHistory({
    int? page,
    int? take,
  });

  Future<Resource<List<MediaStatusEntity>>> getMediaStatuses(List<String> ids);

  Future<Resource<void>> deleteMedia(String id);

  Future<Resource<String>> uploadImage(String filePath);

  Future<Resource<List<String>>> uploadImages(List<String> filePaths);
}
