import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
abstract class LoginRequestModel with _$LoginRequestModel {
  const factory LoginRequestModel({
    required String deviceId,
    required String app,
    required String appVersion,
    required String? refCode,
    required String appType,
  }) = _LoginRequestModel;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    required String accessToken,
    required int tokenExpires,
    required String refreshToken,
    @Default(0) int refreshTokenExpires,
    required UserModel user,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

@freezed
abstract class RefreshRequestModel with _$RefreshRequestModel {
  const factory RefreshRequestModel({
    required String refreshToken,
  }) = _RefreshRequestModel;

  factory RefreshRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class UpdateUserRequestModel with _$UpdateUserRequestModel {
  const factory UpdateUserRequestModel({
    required String? name,
    required String? email,
    required String? avatarUrl,
  }) = _UpdateUserRequestModel;

  factory UpdateUserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
