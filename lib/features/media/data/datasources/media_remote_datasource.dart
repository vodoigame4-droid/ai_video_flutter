import 'package:dio/dio.dart';
import '../models/media_models.dart';
import 'media_api_client.dart';
import 'package:path/path.dart' as p;

abstract class MediaRemoteDataSource {
  Future<List<HomeCategoryModel>> getHomeCategories({
    required String appType,
    required String version,
  });

  Future<List<HomeCategoryModel>> getCategories({
    required String appType,
    required String version,
  });

  Future<PaginatedListModel<ThemeModel>> getThemes({
    required String appType,
    required String version,
    String? categoryId,
    int? page,
    int? take,
    bool? isFeatured,
  });

  Future<MediaModel> createTgv(CreateTgvRequestModel request);

  Future<MediaModel> getMediaDetail(String id);

  Future<PaginatedListModel<MediaModel>> getHistory({int? page, int? take});

  Future<List<MediaStatusModel>> getMediaStatuses(List<String> ids);

  Future<void> deleteMedia(String id);

  Future<UploadResponseModel> uploadImage(String filePath);

  Future<List<UploadResponseModel>> uploadImages(List<String> filePaths);
}

class MediaRemoteDataSourceImpl implements MediaRemoteDataSource {
  final MediaApiClient _apiClient;

  MediaRemoteDataSourceImpl({required MediaApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<List<HomeCategoryModel>> getHomeCategories({
    required String appType,
    required String version,
  }) async {
    final response = await _apiClient.getHomeCategories(appType, version);
    return response.data;
  }

  @override
  Future<List<HomeCategoryModel>> getCategories({
    required String appType,
    required String version,
  }) async {
    final response = await _apiClient.getCategories(appType, version);
    return response.data;
  }

  @override
  Future<PaginatedListModel<ThemeModel>> getThemes({
    required String appType,
    required String version,
    String? categoryId,
    int? page,
    int? take,
    bool? isFeatured,
  }) async {
    final response = await _apiClient.getThemes(
      appType,
      version,
      categoryId,
      page,
      take,
      isFeatured,
    );
    return response.data;
  }

  @override
  Future<MediaModel> createTgv(CreateTgvRequestModel request) async {
    final response = await _apiClient.createTgv(request);
    return response.data;
  }

  @override
  Future<MediaModel> getMediaDetail(String id) async {
    final response = await _apiClient.getMediaDetail(id);
    return response.data;
  }

  @override
  Future<PaginatedListModel<MediaModel>> getHistory({int? page, int? take}) async {
    final response = await _apiClient.getHistory(page, take);
    return response.data;
  }

  @override
  Future<List<MediaStatusModel>> getMediaStatuses(List<String> ids) async {
    final idsStr = ids.join(',');
    final response = await _apiClient.getMediaStatuses(idsStr);
    return response.data;
  }

  @override
  Future<void> deleteMedia(String id) async {
    await _apiClient.deleteMedia(id);
  }

  @override
  Future<UploadResponseModel> uploadImage(String filePath) async {
    final file = await MultipartFile.fromFile(
      filePath,
      filename: p.basename(filePath),
    );
    final response = await _apiClient.uploadImage(file);
    return response.data;
  }

  @override
  Future<List<UploadResponseModel>> uploadImages(List<String> filePaths) async {
    final files = <MultipartFile>[];
    for (final path in filePaths) {
      files.add(await MultipartFile.fromFile(
        path,
        filename: p.basename(path),
      ));
    }
    final response = await _apiClient.uploadImages(files);
    return response.data;
  }
}
