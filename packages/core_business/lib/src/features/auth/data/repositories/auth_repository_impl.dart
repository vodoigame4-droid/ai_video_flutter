import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/resources/resource.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/utils/error_parser.dart';
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

  final StreamController<UserEntity> _userController = StreamController<UserEntity>.broadcast();
  UserEntity? _cachedUser;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required SharedPreferences sharedPreferences,
    required AppConfig appConfig,
  })  : _remoteDataSource = remoteDataSource,
        _sharedPreferences = sharedPreferences,
        _appConfig = appConfig;

  @override
  Stream<UserEntity> watchProfile() async* {
    if (_cachedUser != null) {
      yield _cachedUser!;
    }
    yield* _userController.stream;
  }

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
      final user = response.user.toEntity();
      _cachedUser = user;
      _userController.add(user);
      return Resource.success(user);
    } catch (e, stack) {
      LogUtils.e('AuthRepositoryImpl: login failed', error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<UserEntity>> refresh(RefreshRequestModel request) async {
    try {
      final response = await _remoteDataSource.refresh(request);
      await _saveTokens(response.accessToken, response.refreshToken);
      final user = response.user.toEntity();
      _cachedUser = user;
      _userController.add(user);
      return Resource.success(user);
    } catch (e, stack) {
      LogUtils.e('AuthRepositoryImpl: refresh failed', error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<UserEntity>> getProfile() async {
    try {
      final userModel = await _remoteDataSource.getProfile();
      final user = userModel.toEntity();
      _cachedUser = user;
      _userController.add(user);
      return Resource.success(user);
    } catch (e, stack) {
      LogUtils.e('AuthRepositoryImpl: getProfile failed', error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<UserEntity>> updateProfile(UpdateUserRequestModel request) async {
    try {
      final userModel = await _remoteDataSource.updateProfile(request);
      final user = userModel.toEntity();
      _cachedUser = user;
      _userController.add(user);
      return Resource.success(user);
    } catch (e, stack) {
      LogUtils.e('AuthRepositoryImpl: updateProfile failed', error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    await _sharedPreferences.setString(StorageKeys.authAccessToken, accessToken);
    await _sharedPreferences.setString(StorageKeys.authRefreshToken, refreshToken);
  }
}
