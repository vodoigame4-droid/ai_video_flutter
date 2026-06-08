import '../../../../core/resources/resource.dart';
import '../../data/models/iap_models.dart';

abstract class IapRepository {
  Future<Resource<void>> verifyProductAndroid(VerifyProductRequestModel request);
  Future<Resource<void>> verifySubscriptionAndroid(VerifySubscriptionRequestModel request);
  Future<Resource<void>> restoreSubscriptionAndroid(RestoreSubscriptionRequestModel request);
  Future<Resource<void>> verifyProductIos(VerifyProductIosRequestModel request);
  Future<Resource<void>> verifySubscriptionIos(VerifySubscriptionIosRequestModel request);
  Future<Resource<void>> restoreSubscriptionIos(RestoreSubscriptionIosRequestModel request);
  Future<Resource<void>> googleWebhook(GoogleWebhookRequestModel request);
  Future<Resource<void>> appleWebhook(AppleWebhookRequestModel request);
}
