import 'dart:io';
import 'package:dio/dio.dart';

/// Base exception class for all network errors.
abstract class NetworkException implements Exception {
  final String message;
  final int? statusCode;

  const NetworkException(this.message, {this.statusCode});

  @override
  String toString() => '$runtimeType: $message (status: $statusCode)';
}

/// Thrown when there is no internet connection or server is unreachable.
class NoInternetException extends NetworkException {
  const NoInternetException([super.message = 'No internet connection']);
}

/// Thrown when request times out.
class TimeoutException extends NetworkException {
  const TimeoutException([super.message = 'Connection timeout']);
}

/// Thrown for 401 status codes.
class UnauthorizedException extends NetworkException {
  const UnauthorizedException([super.message = 'Unauthorized access'])
      : super(statusCode: 401);
}

/// Thrown for 403 status codes.
class ForbiddenException extends NetworkException {
  const ForbiddenException([super.message = 'Access forbidden'])
      : super(statusCode: 403);
}

/// Thrown for 404 status codes.
class NotFoundException extends NetworkException {
  const NotFoundException([super.message = 'Resource not found'])
      : super(statusCode: 404);
}

/// Thrown for 5xx status codes.
class ServerException extends NetworkException {
  const ServerException(super.message, {super.statusCode});
}

/// Unknown or unhandled network errors.
class UnknownException extends NetworkException {
  const UnknownException([super.message = 'An unexpected network error occurred']);
}

/// Helper method to convert a [DioException] to our domain [NetworkException].
NetworkException parseDioException(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return const TimeoutException('Network timeout. Please try again.');
    case DioExceptionType.connectionError:
      return const NoInternetException('Cannot connect to server. Please check your internet connection.');
    case DioExceptionType.badResponse:
      final statusCode = error.response?.statusCode;
      final statusMessage = error.response?.statusMessage ?? 'Server response error';
      final responseData = error.response?.data;
      
      String message = statusMessage;
      if (responseData is Map && responseData.containsKey('message')) {
        message = responseData['message'].toString();
      } else if (responseData is Map && responseData.containsKey('error')) {
        message = responseData['error'].toString();
      }

      if (statusCode == 401) {
        return UnauthorizedException(message);
      } else if (statusCode == 403) {
        return ForbiddenException(message);
      } else if (statusCode == 404) {
        return NotFoundException(message);
      } else if (statusCode != null && statusCode >= 500) {
        return ServerException(message, statusCode: statusCode);
      }
      return ServerException(message, statusCode: statusCode);
    case DioExceptionType.cancel:
      return const UnknownException('Request was cancelled.');
    case DioExceptionType.unknown:
    default:
      if (error.error is SocketException) {
        return const NoInternetException('No internet connection.');
      }
      return UnknownException(error.message ?? 'An unexpected network error occurred');
  }
}
