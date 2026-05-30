import 'dart:convert';
import 'package:dio/dio.dart';

/// An interceptor that logs HTTP requests, responses, and errors.
/// Uses a custom log callback to output logs, avoiding direct print statements.
class LoggingInterceptor extends Interceptor {
  final void Function(String message)? logCallback;

  LoggingInterceptor({this.logCallback});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _log('--> ${options.method} ${options.uri}');
    if (options.headers.isNotEmpty) {
      _log('Headers:\n${_formatMap(options.headers)}');
    }
    if (options.data != null) {
      _log('Body:\n${_formatData(options.data)}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _log('<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri}');
    if (response.data != null) {
      _log('Response Body:\n${_formatData(response.data)}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _log('!!! Network Error: ${err.message}');
    if (err.response != null) {
      _log('Status code: ${err.response?.statusCode}');
      _log('Error response:\n${_formatData(err.response?.data)}');
    }
    super.onError(err, handler);
  }

  String _formatMap(Map<dynamic, dynamic> map) {
    try {
      final lines = <String>[];
      map.forEach((key, value) {
        lines.add('  $key: $value');
      });
      return lines.join('\n');
    } catch (_) {
      return map.toString();
    }
  }

  String _formatData(dynamic data) {
    if (data == null) return '';
    try {
      if (data is Map || data is List) {
        const encoder = JsonEncoder.withIndent('  ');
        return encoder.convert(data);
      }
      return data.toString();
    } catch (_) {
      return data.toString();
    }
  }

  void _log(String message) {
    if (logCallback != null) {
      logCallback!(message);
    }
  }
}

