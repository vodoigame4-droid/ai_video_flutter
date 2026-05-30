import '../models/auth_models.dart';
import '../models/user_model.dart';
import 'auth_api_client.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel request);
  Future<LoginResponseModel> refresh(RefreshRequestModel request);
  Future<UserModel> getProfile();
  Future<UserModel> updateProfile(UpdateUserRequestModel request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiClient _apiClient;

  AuthRemoteDataSourceImpl({required AuthApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    final response = await _apiClient.login(request);
    return response.data;
  }

  @override
  Future<LoginResponseModel> refresh(RefreshRequestModel request) async {
    final response = await _apiClient.refresh(request);
    return response.data;
  }

  @override
  Future<UserModel> getProfile() async {
    final response = await _apiClient.getProfile();
    return response.data;
  }

  @override
  Future<UserModel> updateProfile(UpdateUserRequestModel request) async {
    final response = await _apiClient.updateProfile(request);
    return response.data;
  }
}
