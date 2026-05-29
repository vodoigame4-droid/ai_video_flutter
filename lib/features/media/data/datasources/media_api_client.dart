import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/base_response.dart';
import '../models/media_models.dart';

part 'media_api_client.g.dart';

@RestApi()
abstract class MediaApiClient {
  factory MediaApiClient(Dio dio, {String baseUrl}) = _MediaApiClient;

  @GET('/media/home/tgv')
  Future<BaseResponse<List<HomeCategoryModel>>> getHomeCategories(
    @Header('apptype') String appType,
    @Header('version') String version,
  );

  @GET('/media/category')
  Future<BaseResponse<List<HomeCategoryModel>>> getCategories(
    @Header('apptype') String appType,
    @Header('version') String version,
  );

  @GET('/media/theme')
  Future<BaseResponse<PaginatedListModel<ThemeModel>>> getThemes(
    @Header('apptype') String appType,
    @Header('version') String version,
    @Query('categoryId') String? categoryId,
    @Query('page') int? page,
    @Query('take') int? take,
    @Query('isFeatured') bool? isFeatured,
  );

  @POST('/media/tgv')
  Future<BaseResponse<MediaModel>> createTgv(
    @Body() CreateTgvRequestModel request,
  );

  @GET('/media/detail/{id}')
  Future<BaseResponse<MediaModel>> getMediaDetail(
    @Path('id') String id,
  );

  @GET('/media/history')
  Future<BaseResponse<PaginatedListModel<MediaModel>>> getHistory(
    @Query('page') int? page,
    @Query('take') int? take,
  );

  @GET('/media/status')
  Future<BaseResponse<List<MediaStatusModel>>> getMediaStatuses(
    @Query('ids') String ids, // Comma-separated list of UUIDs
  );

  @DELETE('/media/{id}')
  Future<BaseResponse<void>> deleteMedia(
    @Path('id') String id,
  );

  @POST('/file/upload/image')
  @MultiPart()
  Future<BaseResponse<UploadResponseModel>> uploadImage(
    @Part() MultipartFile file,
  );

  @POST('/file/upload/images')
  @MultiPart()
  Future<BaseResponse<List<UploadResponseModel>>> uploadImages(
    @Part() List<MultipartFile> files,
  );
}
