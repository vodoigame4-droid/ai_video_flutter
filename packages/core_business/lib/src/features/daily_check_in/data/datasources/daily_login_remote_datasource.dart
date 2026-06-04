import '../models/daily_login_models.dart';
import 'daily_login_api_client.dart';

abstract class DailyLoginRemoteDataSource {
  Future<DailyLoginResponseModel> getDailyLoginStatus();
  Future<DailyCheckInResponseModel> checkIn(DailyCheckInRequestModel request);
}

class DailyLoginRemoteDataSourceImpl implements DailyLoginRemoteDataSource {
  final DailyLoginApiClient _apiClient;

  DailyLoginRemoteDataSourceImpl({required DailyLoginApiClient apiClient})
      : _apiClient = apiClient;

  @override
  Future<DailyLoginResponseModel> getDailyLoginStatus() async {
    final response = await _apiClient.getDailyLoginStatus();
    return response.data;
  }

  @override
  Future<DailyCheckInResponseModel> checkIn(DailyCheckInRequestModel request) async {
    final response = await _apiClient.checkIn(request);
    return response.data;
  }
}
