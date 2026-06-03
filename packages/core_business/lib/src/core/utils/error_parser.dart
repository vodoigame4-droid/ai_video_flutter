import 'package:dio/dio.dart';
import 'package:network/network.dart';
import '../errors/failure.dart';

/// Parses exception and extracts backend error code or message.
String parseRepositoryError(dynamic e) {
  if (e is DioException) {
    try {
      final responseData = e.response?.data;
      if (responseData is Map) {
        if (responseData.containsKey('errorCode') && responseData['errorCode'] != null) {
          return responseData['errorCode'].toString();
        }
        if (responseData.containsKey('message') && responseData['message'] != null) {
          return responseData['message'].toString();
        }
      }
    } catch (_) {}
  }
  return e.toString();
}

/// Parses dynamic exception and maps it to a structured [Failure] object.
Failure parseRepositoryErrorToFailure(dynamic e) {
  if (e is NetworkException) {
    if (e is NoInternetException) return const Failure.network();
    if (e is TimeoutException) return const Failure.timeout();
    if (e is UnauthorizedException) return const Failure.unauthorized();
    if (e is ServerException) {
      return Failure.server(statusCode: e.statusCode ?? 500, message: e.message);
    }
  }

  // Fallback check for business error codes (ERXXXXX)
  String? businessCode;
  String? message;

  if (e is DioException) {
    try {
      final responseData = e.response?.data;
      if (responseData is Map) {
        if (responseData.containsKey('errorCode') && responseData['errorCode'] != null) {
          businessCode = responseData['errorCode'].toString();
        }
        if (responseData.containsKey('message') && responseData['message'] != null) {
          message = responseData['message'].toString();
        }
      }
    } catch (_) {}
  }

  if (businessCode == null) {
    final errorStr = e.toString();
    final regExp = RegExp(r'ER\d{3,6}');
    final match = regExp.firstMatch(errorStr);
    if (match != null) {
      businessCode = match.group(0);
      message = errorStr;
    }
  }

  if (businessCode != null) {
    return Failure.business(code: businessCode, message: message ?? 'Business exception');
  }

  return Failure.unknown(e.toString());
}
