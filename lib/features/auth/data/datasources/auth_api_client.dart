import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/base_response.dart';
import '../models/auth_models.dart';
import '../models/user_model.dart';

part 'auth_api_client.g.dart';

@RestApi()
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio, {String baseUrl}) = _AuthApiClient;

  @POST('/auth/login')
  Future<BaseResponse<LoginResponseModel>> login(
    @Body() LoginRequestModel request,
  );

  @POST('/auth/refresh')
  Future<BaseResponse<LoginResponseModel>> refresh(
    @Body() RefreshRequestModel request,
  );

  @GET('/user/me')
  Future<BaseResponse<UserModel>> getProfile();

  @PUT('/user/me')
  Future<BaseResponse<UserModel>> updateProfile(
    @Body() UpdateUserRequestModel request,
  );
}
