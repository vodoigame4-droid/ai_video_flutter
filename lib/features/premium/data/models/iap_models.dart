import 'package:freezed_annotation/freezed_annotation.dart';

part 'iap_models.freezed.dart';
part 'iap_models.g.dart';

@freezed
abstract class VerifyProductRequestModel with _$VerifyProductRequestModel {
  const factory VerifyProductRequestModel({
    required String productId,
    required String purchaseToken,
  }) = _VerifyProductRequestModel;

  factory VerifyProductRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyProductRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class VerifySubscriptionRequestModel with _$VerifySubscriptionRequestModel {
  const factory VerifySubscriptionRequestModel({
    required String productId,
    required String purchaseToken,
  }) = _VerifySubscriptionRequestModel;

  factory VerifySubscriptionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifySubscriptionRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class RestoreSubscriptionRequestModel with _$RestoreSubscriptionRequestModel {
  const factory RestoreSubscriptionRequestModel({
    required String productId,
    required String purchaseToken,
  }) = _RestoreSubscriptionRequestModel;

  factory RestoreSubscriptionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RestoreSubscriptionRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class VerifyProductIosRequestModel with _$VerifyProductIosRequestModel {
  const factory VerifyProductIosRequestModel({
    required String productId,
    required String transactionId,
  }) = _VerifyProductIosRequestModel;

  factory VerifyProductIosRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyProductIosRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class VerifySubscriptionIosRequestModel with _$VerifySubscriptionIosRequestModel {
  const factory VerifySubscriptionIosRequestModel({
    required String productId,
    required String transactionId,
  }) = _VerifySubscriptionIosRequestModel;

  factory VerifySubscriptionIosRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifySubscriptionIosRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class RestoreSubscriptionIosRequestModel with _$RestoreSubscriptionIosRequestModel {
  const factory RestoreSubscriptionIosRequestModel({
    required String productId,
    required String transactionId,
  }) = _RestoreSubscriptionIosRequestModel;

  factory RestoreSubscriptionIosRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RestoreSubscriptionIosRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class GoogleWebhookRequestModel with _$GoogleWebhookRequestModel {
  const factory GoogleWebhookRequestModel({
    required GoogleWebhookMessageModel message,
    required String subscription,
  }) = _GoogleWebhookRequestModel;

  factory GoogleWebhookRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GoogleWebhookRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class GoogleWebhookMessageModel with _$GoogleWebhookMessageModel {
  const factory GoogleWebhookMessageModel({
    required String data,
    required String messageId,
    required String publishTime,
  }) = _GoogleWebhookMessageModel;

  factory GoogleWebhookMessageModel.fromJson(Map<String, dynamic> json) =>
      _$GoogleWebhookMessageModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class AppleWebhookRequestModel with _$AppleWebhookRequestModel {
  const factory AppleWebhookRequestModel({
    required String signedPayload,
  }) = _AppleWebhookRequestModel;

  factory AppleWebhookRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AppleWebhookRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
