import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/resources/resource.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/constants/storage_keys.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/auth_models.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final SharedPreferences _sharedPreferences;
  final AppConfig _appConfig;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required SharedPreferences sharedPreferences,
    required AppConfig appConfig,
  })  : _remoteDataSource = remoteDataSource,
        _sharedPreferences = sharedPreferences,
        _appConfig = appConfig;

  @override
  Future<Resource<UserEntity>> login(String deviceId, String? refCode) async {
    try {
      final request = LoginRequestModel(
        deviceId: deviceId,
        app: _appConfig.appType,
        appVersion: _appConfig.appVersion,
        refCode: refCode,
        appType: _appConfig.appTypeName,
      );
      final response = await _remoteDataSource.login(request);
      await _saveTokens(response.accessToken, response.refreshToken);
      return Resource.success(response.user.toEntity());
    } catch (e, stack) {
      LogUtils.e('AuthRepositoryImpl: login failed', error: e, stackTrace: stack);
      return Resource.error(message: e.toString());
    }
  }

  @override
  Future<Resource<UserEntity>> refresh(RefreshRequestModel request) async {
    try {
      final response = await _remoteDataSource.refresh(request);
      await _saveTokens(response.accessToken, response.refreshToken);
      return Resource.success(response.user.toEntity());
    } catch (e, stack) {
      LogUtils.e('AuthRepositoryImpl: refresh failed', error: e, stackTrace: stack);
      return Resource.error(message: e.toString());
    }
  }

  @override
  Future<Resource<UserEntity>> getProfile() async {
    try {
      final userModel = await _remoteDataSource.getProfile();
      return Resource.success(userModel.toEntity());
    } catch (e, stack) {
      LogUtils.e('AuthRepositoryImpl: getProfile failed', error: e, stackTrace: stack);
      return Resource.error(message: e.toString());
    }
  }

  @override
  Future<Resource<UserEntity>> updateProfile(UpdateUserRequestModel request) async {
    try {
      final userModel = await _remoteDataSource.updateProfile(request);
      return Resource.success(userModel.toEntity());
    } catch (e, stack) {
      LogUtils.e('AuthRepositoryImpl: updateProfile failed', error: e, stackTrace: stack);
      return Resource.error(message: e.toString());
    }
  }

  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    await _sharedPreferences.setString(StorageKeys.authAccessToken, accessToken);
    await _sharedPreferences.setString(StorageKeys.authRefreshToken, refreshToken);
  }
}
