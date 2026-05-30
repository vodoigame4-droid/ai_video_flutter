import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/base_response.dart';
import '../models/iap_models.dart';

part 'iap_api_client.g.dart';

@RestApi()
abstract class IapApiClient {
  factory IapApiClient(Dio dio, {String baseUrl}) = _IapApiClient;

  @POST('/iap/verify/product')
  Future<BaseResponse<void>> verifyProduct(
    @Body() VerifyProductRequestModel request,
  );

  @POST('/iap/verify/subscription')
  Future<BaseResponse<void>> verifySubscription(
    @Body() VerifySubscriptionRequestModel request,
  );

  @POST('/iap/restore/subscription')
  Future<BaseResponse<void>> restoreSubscription(
    @Body() RestoreSubscriptionRequestModel request,
  );

  @POST('/iap/verify/product/ios')
  Future<BaseResponse<void>> verifyProductIos(
    @Body() VerifyProductIosRequestModel request,
  );

  @POST('/iap/verify/subscription/ios')
  Future<BaseResponse<void>> verifySubscriptionIos(
    @Body() VerifySubscriptionIosRequestModel request,
  );

  @POST('/iap/restore/subscription/ios')
  Future<BaseResponse<void>> restoreSubscriptionIos(
    @Body() RestoreSubscriptionIosRequestModel request,
  );

  @POST('/iap/google')
  Future<BaseResponse<void>> googleWebhook(
    @Body() GoogleWebhookRequestModel request,
  );

  @POST('/iap/apple')
  Future<BaseResponse<void>> appleWebhook(
    @Body() AppleWebhookRequestModel request,
  );
}
