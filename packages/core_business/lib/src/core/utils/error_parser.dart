import 'package:dio/dio.dart';

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
