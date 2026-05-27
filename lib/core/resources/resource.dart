import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';

@freezed
sealed class Resource<T> with _$Resource<T> {
  const factory Resource.initial() = _Initial<T>;
  const factory Resource.loading() = _Loading<T>;
  const factory Resource.success(T data) = _Success<T>;
  const factory Resource.empty() = _Empty<T>;
  const factory Resource.error({required String message}) = _Error<T>;
}
