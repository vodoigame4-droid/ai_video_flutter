import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:network/network.dart';
import '../config/app_config.dart';
import '../utils/log_utils.dart';
import '../constants/storage_keys.dart';

/// Interceptor to handle automatic token refresh and background login on 401 errors.
class AuthRetryInterceptor extends QueuedInterceptor {
  final SharedPreferences _sharedPreferences;
  final AppConfig _appConfig;
  final Dio _authDio;

  AuthRetryInterceptor({
    required SharedPreferences sharedPreferences,
    required AppConfig appConfig,
  })  : _sharedPreferences = sharedPreferences,
        _appConfig = appConfig,
        _authDio = Dio() {
    _authDio.interceptors.add(LoggingInterceptor(
      logCallback: (msg) {
        final lines = msg.split('\n');
        if (msg.startsWith('📤') || msg.startsWith('-->')) {
          for (final line in lines) {
            LogUtils.d(line);
          }
        } else if (msg.startsWith('📥') || msg.startsWith('<--')) {
          for (final line in lines) {
            LogUtils.i(line);
          }
        } else if (msg.startsWith('🚨') || msg.startsWith('!!!')) {
          for (final line in lines) {
            LogUtils.e(line);
          }
        } else {
          for (final line in lines) {
            LogUtils.v(line);
          }
        }
      },
    ));
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final response = err.response;
    if (response == null || response.statusCode != 401) {
      return handler.next(err);
    }

    final requestPath = err.requestOptions.path;
    // Skip retrying for login or refresh requests to avoid infinite loops
    if (requestPath.contains('/auth/login') || requestPath.contains('/auth/refresh')) {
      return handler.next(err);
    }

    LogUtils.d('AuthRetryInterceptor: 401 Unauthorized detected for $requestPath. Attempting to refresh token...');

    try {
      // 1. Try to refresh the token using refresh token
      final refreshSuccess = await _attemptRefresh(err.requestOptions.baseUrl);
      if (refreshSuccess) {
        LogUtils.d('AuthRetryInterceptor: Token refreshed successfully. Retrying original request: $requestPath');
        final retriedResponse = await _retryRequest(err.requestOptions);
        return handler.resolve(retriedResponse);
      }

      LogUtils.d('AuthRetryInterceptor: Token refresh failed. Attempting background login...');

      // 2. Try background login using deviceId
      final loginSuccess = await _attemptLogin(err.requestOptions.baseUrl);
      if (loginSuccess) {
        LogUtils.d('AuthRetryInterceptor: Background login successful. Retrying original request: $requestPath');
        final retriedResponse = await _retryRequest(err.requestOptions);
        return handler.resolve(retriedResponse);
      }
    } catch (e) {
      LogUtils.e('AuthRetryInterceptor: Background refresh/login failed with error', error: e);
      return handler.next(DioException(
        requestOptions: err.requestOptions,
        error: 'Authentication auto-recovery failed: $e',
        type: DioExceptionType.badResponse,
        response: err.response,
      ));
    }

    LogUtils.e('AuthRetryInterceptor: Both token refresh and background login failed. Rejecting request.');
    return handler.next(err);
  }

  Future<bool> _attemptRefresh(String baseUrl) async {
    final refreshToken = _sharedPreferences.getString(StorageKeys.authRefreshToken);
    if (refreshToken == null || refreshToken.isEmpty) {
      return false;
    }

    try {
      final response = await _authDio.post(
        '$baseUrl/auth/refresh',
        data: {'refreshToken': refreshToken},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        final dataMap = data['data'] as Map<String, dynamic>?;
        if (dataMap != null) {
          final newAccessToken = dataMap['accessToken'] as String?;
          final newRefreshToken = dataMap['refreshToken'] as String?;
          if (newAccessToken != null && newRefreshToken != null) {
            await _sharedPreferences.setString(StorageKeys.authAccessToken, newAccessToken);
            await _sharedPreferences.setString(StorageKeys.authRefreshToken, newRefreshToken);
            return true;
          }
        }
      }
    } catch (e) {
      LogUtils.e('AuthRetryInterceptor: Token refresh API error', error: e);
    }
    return false;
  }

  Future<bool> _attemptLogin(String baseUrl) async {
    final deviceId = _sharedPreferences.getString(StorageKeys.deviceId);
    if (deviceId == null || deviceId.isEmpty) {
      return false;
    }
    final refCode = _sharedPreferences.getString(StorageKeys.refCode);

    try {
      final response = await _authDio.post(
        '$baseUrl/auth/login',
        data: {
          'deviceId': deviceId,
          'app': _appConfig.appType,
          'appVersion': _appConfig.appVersion,
          'refCode': refCode,
          'appType': _appConfig.appTypeName,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        final dataMap = data['data'] as Map<String, dynamic>?;
        if (dataMap != null) {
          final newAccessToken = dataMap['accessToken'] as String?;
          final newRefreshToken = dataMap['refreshToken'] as String?;
          if (newAccessToken != null && newRefreshToken != null) {
            await _sharedPreferences.setString(StorageKeys.authAccessToken, newAccessToken);
            await _sharedPreferences.setString(StorageKeys.authRefreshToken, newRefreshToken);
            return true;
          }
        }
      }
    } catch (e) {
      LogUtils.e('AuthRetryInterceptor: Background login API error', error: e);
    }
    return false;
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
    final accessToken = _sharedPreferences.getString(StorageKeys.authAccessToken);
    final headers = Map<String, dynamic>.from(requestOptions.headers);
    if (accessToken != null && accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    return _authDio.request(
      '${requestOptions.baseUrl}${requestOptions.path}',
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: headers,
        contentType: requestOptions.contentType,
      ),
    );
  }
}
