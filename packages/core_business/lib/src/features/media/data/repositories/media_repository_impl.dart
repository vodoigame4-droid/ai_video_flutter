import '../../../../core/config/app_config.dart';
import '../../../../core/resources/resource.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/utils/error_parser.dart';
import '../../domain/entities/media_entities.dart';
import '../../domain/repositories/media_repository.dart';
import '../datasources/media_remote_datasource.dart';
import '../models/media_models.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MediaRemoteDataSource _remoteDataSource;
  final AppConfig _appConfig;

  MediaRepositoryImpl({
    required MediaRemoteDataSource remoteDataSource,
    required AppConfig appConfig,
  })  : _remoteDataSource = remoteDataSource,
        _appConfig = appConfig;

  @override
  Future<Resource<List<HomeCategoryEntity>>> getHomeCategories() async {
    try {
      final models = await _remoteDataSource.getHomeCategories(
        appType: _appConfig.appType,
        version: _appConfig.appVersion,
      );
      final entities = models.map((e) => e.toEntity()).toList();
      return Resource.success(entities);
    } catch (e, stack) {
      LogUtils.e('MediaRepositoryImpl: getHomeCategories failed',
          error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<List<HomeCategoryEntity>>> getCategories() async {
    try {
      final models = await _remoteDataSource.getCategories(
        appType: _appConfig.appType,
        version: _appConfig.appVersion,
      );
      final entities = models.map((e) => e.toEntity()).toList();
      return Resource.success(entities);
    } catch (e, stack) {
      LogUtils.e('MediaRepositoryImpl: getCategories failed',
          error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<PaginatedListEntity<ThemeEntity>>> getThemes({
    String? categoryId,
    int? page,
    int? take,
    bool? isFeatured,
  }) async {
    try {
      final response = await _remoteDataSource.getThemes(
        appType: _appConfig.appType,
        version: _appConfig.appVersion,
        categoryId: categoryId,
        page: page,
        take: take,
        isFeatured: isFeatured,
      );
      final entities = PaginatedListEntity<ThemeEntity>(
        data: response.data.map((e) => e.toEntity()).toList(),
        meta: response.meta.toEntity(),
      );
      return Resource.success(entities);
    } catch (e, stack) {
      LogUtils.e('MediaRepositoryImpl: getThemes failed',
          error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<MediaEntity>> createTgv(CreateTgvRequestModel request) async {
    try {
      final model = await _remoteDataSource.createTgv(request);
      return Resource.success(model.toEntity());
    } catch (e, stack) {
      LogUtils.e('MediaRepositoryImpl: createTgv failed',
          error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<MediaEntity>> getMediaDetail(String id) async {
    try {
      final model = await _remoteDataSource.getMediaDetail(id);
      return Resource.success(model.toEntity());
    } catch (e, stack) {
      LogUtils.e('MediaRepositoryImpl: getMediaDetail failed',
          error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<PaginatedListEntity<MediaEntity>>> getHistory({
    int? page,
    int? take,
  }) async {
    try {
      final response = await _remoteDataSource.getHistory(
        page: page,
        take: take,
      );
      final entities = PaginatedListEntity<MediaEntity>(
        data: response.data.map((e) => e.toEntity()).toList(),
        meta: response.meta.toEntity(),
      );
      return Resource.success(entities);
    } catch (e, stack) {
      LogUtils.e('MediaRepositoryImpl: getHistory failed',
          error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<List<MediaStatusEntity>>> getMediaStatuses(
      List<String> ids) async {
    try {
      final models = await _remoteDataSource.getMediaStatuses(ids);
      final entities = models.map((e) => e.toEntity()).toList();
      return Resource.success(entities);
    } catch (e, stack) {
      LogUtils.e('MediaRepositoryImpl: getMediaStatuses failed',
          error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<void>> deleteMedia(String id) async {
    try {
      await _remoteDataSource.deleteMedia(id);
      return const Resource.success(null);
    } catch (e, stack) {
      LogUtils.e('MediaRepositoryImpl: deleteMedia failed',
          error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<String>> uploadImage(String filePath) async {
    try {
      final model = await _remoteDataSource.uploadImage(filePath);
      return Resource.success(model.url);
    } catch (e, stack) {
      LogUtils.e('MediaRepositoryImpl: uploadImage failed',
          error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<List<String>>> uploadImages(List<String> filePaths) async {
    try {
      final models = await _remoteDataSource.uploadImages(filePaths);
      final urls = models.map((e) => e.url).toList();
      return Resource.success(urls);
    } catch (e, stack) {
      LogUtils.e('MediaRepositoryImpl: uploadImages failed',
          error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }
}
