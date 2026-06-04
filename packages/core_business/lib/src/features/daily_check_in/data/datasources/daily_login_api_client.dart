import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/base_response.dart';
import '../models/daily_login_models.dart';

part 'daily_login_api_client.g.dart';

@RestApi()
abstract class DailyLoginApiClient {
  factory DailyLoginApiClient(Dio dio, {String baseUrl}) = _DailyLoginApiClient;

  @GET('/task/daily-login')
  Future<BaseResponse<DailyLoginResponseModel>> getDailyLoginStatus();

  @POST('/task/daily-login')
  Future<BaseResponse<DailyCheckInResponseModel>> checkIn(
    @Body() DailyCheckInRequestModel request,
  );
}
