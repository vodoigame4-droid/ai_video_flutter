import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

Object? _readStatusCode(Map json, String key) {
  return json['status'] ?? json['statusCode'] ?? 200;
}

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  @JsonKey(readValue: _readStatusCode)
  final int statusCode;
  
  @JsonKey(name: 'data')
  final T data;

  BaseResponse({required this.statusCode, required this.data});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}
