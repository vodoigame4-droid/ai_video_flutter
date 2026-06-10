import 'dart:async';
import 'package:dio/dio.dart';
import '../utils/log_utils.dart';

/// Interceptor to automatically retry requests that fail due to a connection, send, or receive timeout.
class TimeoutRetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final Duration retryInterval;

  TimeoutRetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.retryInterval = const Duration(seconds: 1),
  });

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final isTimeout = err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout;

    if (!isTimeout) {
      return handler.next(err);
    }

    final requestOptions = err.requestOptions;
    
    // Store/retrieve retry attempt count in request's extra map
    final extra = Map<String, dynamic>.from(requestOptions.extra);
    final retryCount = (extra['timeoutRetryCount'] as int?) ?? 0;

    if (retryCount >= maxRetries) {
      LogUtils.e(
        'TimeoutRetryInterceptor: Max retries ($maxRetries) reached for [${requestOptions.method}] ${requestOptions.path}. Failing request.',
        error: err,
      );
      return handler.next(err);
    }

    final nextRetryCount = retryCount + 1;
    extra['timeoutRetryCount'] = nextRetryCount;
    requestOptions.extra = extra;

    LogUtils.w(
      'TimeoutRetryInterceptor: Timeout detected for [${requestOptions.method}] ${requestOptions.path} (${err.type}). '
      'Retrying attempt $nextRetryCount/$maxRetries after ${retryInterval.inSeconds}s...',
    );

    await Future.delayed(retryInterval);

    try {
      // Re-request using the provided Dio instance
      final response = await dio.request(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        cancelToken: requestOptions.cancelToken,
        options: Options(
          method: requestOptions.method,
          headers: requestOptions.headers,
          extra: requestOptions.extra,
          responseType: requestOptions.responseType,
          contentType: requestOptions.contentType,
          validateStatus: requestOptions.validateStatus,
          receiveTimeout: requestOptions.receiveTimeout,
          sendTimeout: requestOptions.sendTimeout,
        ),
        onSendProgress: requestOptions.onSendProgress,
        onReceiveProgress: requestOptions.onReceiveProgress,
      );
      return handler.resolve(response);
    } on DioException catch (retryErr) {
      // The onError will be recursively triggered for retryErr, which increments retryCount.
      // So we do not need to call handler.next here; the recursive onError call will handle it.
    } catch (e) {
      // For any non-DioException errors during retry, forward them
      return handler.next(DioException(
        requestOptions: requestOptions,
        error: e,
      ));
    }
  }
}
