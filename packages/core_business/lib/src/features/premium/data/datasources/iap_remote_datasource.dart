import '../models/iap_models.dart';
import 'iap_api_client.dart';

abstract class IapRemoteDataSource {
  Future<void> verifyProduct(VerifyProductRequestModel request);
  Future<void> verifySubscription(VerifySubscriptionRequestModel request);
  Future<void> restoreSubscription(RestoreSubscriptionRequestModel request);
  Future<void> verifyProductIos(VerifyProductIosRequestModel request);
  Future<void> verifySubscriptionIos(VerifySubscriptionIosRequestModel request);
  Future<void> restoreSubscriptionIos(RestoreSubscriptionIosRequestModel request);
  Future<void> googleWebhook(GoogleWebhookRequestModel request);
  Future<void> appleWebhook(AppleWebhookRequestModel request);
}

class IapRemoteDataSourceImpl implements IapRemoteDataSource {
  final IapApiClient _apiClient;

  IapRemoteDataSourceImpl({required IapApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<void> verifyProduct(VerifyProductRequestModel request) async {
    await _apiClient.verifyProduct(request);
  }

  @override
  Future<void> verifySubscription(VerifySubscriptionRequestModel request) async {
    await _apiClient.verifySubscription(request);
  }

  @override
  Future<void> restoreSubscription(RestoreSubscriptionRequestModel request) async {
    await _apiClient.restoreSubscription(request);
  }

  @override
  Future<void> verifyProductIos(VerifyProductIosRequestModel request) async {
    await _apiClient.verifyProductIos(request);
  }

  @override
  Future<void> verifySubscriptionIos(VerifySubscriptionIosRequestModel request) async {
    await _apiClient.verifySubscriptionIos(request);
  }

  @override
  Future<void> restoreSubscriptionIos(RestoreSubscriptionIosRequestModel request) async {
    await _apiClient.restoreSubscriptionIos(request);
  }

  @override
  Future<void> googleWebhook(GoogleWebhookRequestModel request) async {
    await _apiClient.googleWebhook(request);
  }

  @override
  Future<void> appleWebhook(AppleWebhookRequestModel request) async {
    await _apiClient.appleWebhook(request);
  }
}
