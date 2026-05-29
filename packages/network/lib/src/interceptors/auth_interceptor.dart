import 'package:dio/dio.dart';

/// A function type that retrieves the authorization token asynchronously.
typedef TokenProvider = Future<String?> Function();

/// Interceptor to automatically attach Authorization headers to requests.
class AuthInterceptor extends Interceptor {
  final TokenProvider _tokenProvider;

  AuthInterceptor({required TokenProvider tokenProvider}) : _tokenProvider = tokenProvider;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // If the request already has an Authorization header, skip adding a new one
    if (options.headers.containsKey('Authorization')) {
      return handler.next(options);
    }

    try {
      final token = await _tokenProvider();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (_) {
      // In case fetching the token fails, we proceed with the request anyway
    }

    return handler.next(options);
  }
}
