// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iap_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyProductRequestModel _$VerifyProductRequestModelFromJson(
  Map<String, dynamic> json,
) => _VerifyProductRequestModel(
  productId: json['productId'] as String,
  purchaseToken: json['purchaseToken'] as String,
);

Map<String, dynamic> _$VerifyProductRequestModelToJson(
  _VerifyProductRequestModel instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'purchaseToken': instance.purchaseToken,
};

_VerifySubscriptionRequestModel _$VerifySubscriptionRequestModelFromJson(
  Map<String, dynamic> json,
) => _VerifySubscriptionRequestModel(
  productId: json['productId'] as String,
  purchaseToken: json['purchaseToken'] as String,
);

Map<String, dynamic> _$VerifySubscriptionRequestModelToJson(
  _VerifySubscriptionRequestModel instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'purchaseToken': instance.purchaseToken,
};

_RestoreSubscriptionRequestModel _$RestoreSubscriptionRequestModelFromJson(
  Map<String, dynamic> json,
) => _RestoreSubscriptionRequestModel(
  productId: json['productId'] as String,
  purchaseToken: json['purchaseToken'] as String,
);

Map<String, dynamic> _$RestoreSubscriptionRequestModelToJson(
  _RestoreSubscriptionRequestModel instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'purchaseToken': instance.purchaseToken,
};

_VerifyProductIosRequestModel _$VerifyProductIosRequestModelFromJson(
  Map<String, dynamic> json,
) => _VerifyProductIosRequestModel(
  productId: json['productId'] as String,
  transactionId: json['transactionId'] as String,
);

Map<String, dynamic> _$VerifyProductIosRequestModelToJson(
  _VerifyProductIosRequestModel instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'transactionId': instance.transactionId,
};

_VerifySubscriptionIosRequestModel _$VerifySubscriptionIosRequestModelFromJson(
  Map<String, dynamic> json,
) => _VerifySubscriptionIosRequestModel(
  productId: json['productId'] as String,
  transactionId: json['transactionId'] as String,
);

Map<String, dynamic> _$VerifySubscriptionIosRequestModelToJson(
  _VerifySubscriptionIosRequestModel instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'transactionId': instance.transactionId,
};

_RestoreSubscriptionIosRequestModel
_$RestoreSubscriptionIosRequestModelFromJson(Map<String, dynamic> json) =>
    _RestoreSubscriptionIosRequestModel(
      productId: json['productId'] as String,
      transactionId: json['transactionId'] as String,
    );

Map<String, dynamic> _$RestoreSubscriptionIosRequestModelToJson(
  _RestoreSubscriptionIosRequestModel instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'transactionId': instance.transactionId,
};

_GoogleWebhookRequestModel _$GoogleWebhookRequestModelFromJson(
  Map<String, dynamic> json,
) => _GoogleWebhookRequestModel(
  message: GoogleWebhookMessageModel.fromJson(
    json['message'] as Map<String, dynamic>,
  ),
  subscription: json['subscription'] as String,
);

Map<String, dynamic> _$GoogleWebhookRequestModelToJson(
  _GoogleWebhookRequestModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'subscription': instance.subscription,
};

_GoogleWebhookMessageModel _$GoogleWebhookMessageModelFromJson(
  Map<String, dynamic> json,
) => _GoogleWebhookMessageModel(
  data: json['data'] as String,
  messageId: json['messageId'] as String,
  publishTime: json['publishTime'] as String,
);

Map<String, dynamic> _$GoogleWebhookMessageModelToJson(
  _GoogleWebhookMessageModel instance,
) => <String, dynamic>{
  'data': instance.data,
  'messageId': instance.messageId,
  'publishTime': instance.publishTime,
};

_AppleWebhookRequestModel _$AppleWebhookRequestModelFromJson(
  Map<String, dynamic> json,
) => _AppleWebhookRequestModel(signedPayload: json['signedPayload'] as String);

Map<String, dynamic> _$AppleWebhookRequestModelToJson(
  _AppleWebhookRequestModel instance,
) => <String, dynamic>{'signedPayload': instance.signedPayload};
