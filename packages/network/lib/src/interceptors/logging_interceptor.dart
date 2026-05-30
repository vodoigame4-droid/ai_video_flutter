import 'dart:convert';
import 'package:dio/dio.dart';

/// An interceptor that logs HTTP requests, responses, and errors.
/// Uses a custom log callback to output logs, avoiding direct print statements.
class LoggingInterceptor extends Interceptor {
  final void Function(String message)? logCallback;

  LoggingInterceptor({this.logCallback});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra['startTime'] = DateTime.now().millisecondsSinceEpoch;

    final buffer = StringBuffer();
    buffer.writeln('📤 --> ${options.method} ${options.uri}');
    
    // Headers
    buffer.writeln('Headers:');
    if (options.headers.isNotEmpty) {
      options.headers.forEach((key, value) {
        buffer.writeln('  $key: $value');
      });
    } else {
      buffer.writeln('  (none)');
    }

    // Query Parameters
    buffer.writeln('Query Parameters:');
    if (options.queryParameters.isNotEmpty) {
      options.queryParameters.forEach((key, value) {
        buffer.writeln('  $key: $value');
      });
    } else {
      buffer.writeln('  (none)');
    }

    // Body
    if (options.data != null) {
      buffer.writeln('Body:');
      buffer.writeln(_formatData(options.data));
    }

    _log(buffer.toString().trimRight());
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final buffer = StringBuffer();
    final startTime = response.requestOptions.extra['startTime'] as int?;
    final durationSuffix = startTime != null 
        ? ' (${DateTime.now().millisecondsSinceEpoch - startTime}ms)'
        : '';

    buffer.writeln('📥 <-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri}$durationSuffix');
    
    // Response Headers
    buffer.writeln('Headers:');
    if (response.headers.map.isNotEmpty) {
      response.headers.map.forEach((key, values) {
        buffer.writeln('  $key: ${values.join(', ')}');
      });
    } else {
      buffer.writeln('  (none)');
    }

    // Response Body
    if (response.data != null) {
      buffer.writeln('Response Body:');
      buffer.writeln(_formatData(response.data));
    }

    _log(buffer.toString().trimRight());
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final buffer = StringBuffer();
    final startTime = err.requestOptions.extra['startTime'] as int?;
    final durationSuffix = startTime != null 
        ? ' (${DateTime.now().millisecondsSinceEpoch - startTime}ms)'
        : '';

    buffer.writeln('🚨 !!! Network Error: ${err.message}$durationSuffix');
    buffer.writeln('Request: ${err.requestOptions.method} ${err.requestOptions.uri}');
    
    if (err.response != null) {
      final response = err.response!;
      buffer.writeln('Status code: ${response.statusCode}');
      buffer.writeln('Headers:');
      if (response.headers.map.isNotEmpty) {
        response.headers.map.forEach((key, values) {
          buffer.writeln('  $key: ${values.join(', ')}');
        });
      } else {
        buffer.writeln('  (none)');
      }
      if (response.data != null) {
        buffer.writeln('Error Response Body:');
        buffer.writeln(_formatData(response.data));
      }
    }
    
    _log(buffer.toString().trimRight());
    super.onError(err, handler);
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

