import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network() = _NetworkFailure;
  const factory Failure.timeout() = _TimeoutFailure;
  const factory Failure.server({required int statusCode, required String message}) = _ServerFailure;
  const factory Failure.unauthorized() = _UnauthorizedFailure;
  const factory Failure.business({required String code, required String message}) = _BusinessFailure;
  const factory Failure.unknown([String? message]) = _UnknownFailure;
}

extension FailureX on Failure {
  String toErrorCodeOrMessage() {
    return when(
      network: () => 'ER_NETWORK_ERROR',
      timeout: () => 'ER_TIMEOUT_ERROR',
      server: (statusCode, message) => 'ER_SERVER_ERROR',
      unauthorized: () => 'ER00001',
      business: (code, message) => code,
      unknown: (message) => message ?? 'ER_UNKNOWN_ERROR',
    );
  }
}
