import '../../../../core/resources/resource.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/utils/error_parser.dart';
import '../../domain/repositories/iap_repository.dart';
import '../datasources/iap_remote_datasource.dart';
import '../models/iap_models.dart';

class IapRepositoryImpl implements IapRepository {
  final IapRemoteDataSource _remoteDataSource;

  IapRepositoryImpl({required IapRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Resource<void>> verifyProduct(VerifyProductRequestModel request) async {
    try {
      await _remoteDataSource.verifyProduct(request);
      return const Resource.success(null);
    } catch (e, stack) {
      LogUtils.e('IapRepositoryImpl: verifyProduct failed', error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<void>> verifySubscription(VerifySubscriptionRequestModel request) async {
    try {
      await _remoteDataSource.verifySubscription(request);
      return const Resource.success(null);
    } catch (e, stack) {
      LogUtils.e('IapRepositoryImpl: verifySubscription failed', error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<void>> restoreSubscription(RestoreSubscriptionRequestModel request) async {
    try {
      await _remoteDataSource.restoreSubscription(request);
      return const Resource.success(null);
    } catch (e, stack) {
      LogUtils.e('IapRepositoryImpl: restoreSubscription failed', error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<void>> verifyProductIos(VerifyProductIosRequestModel request) async {
    try {
      await _remoteDataSource.verifyProductIos(request);
      return const Resource.success(null);
    } catch (e, stack) {
      LogUtils.e('IapRepositoryImpl: verifyProductIos failed', error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<void>> verifySubscriptionIos(VerifySubscriptionIosRequestModel request) async {
    try {
      await _remoteDataSource.verifySubscriptionIos(request);
      return const Resource.success(null);
    } catch (e, stack) {
      LogUtils.e('IapRepositoryImpl: verifySubscriptionIos failed', error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<void>> restoreSubscriptionIos(RestoreSubscriptionIosRequestModel request) async {
    try {
      await _remoteDataSource.restoreSubscriptionIos(request);
      return const Resource.success(null);
    } catch (e, stack) {
      LogUtils.e('IapRepositoryImpl: restoreSubscriptionIos failed', error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<void>> googleWebhook(GoogleWebhookRequestModel request) async {
    try {
      await _remoteDataSource.googleWebhook(request);
      return const Resource.success(null);
    } catch (e, stack) {
      LogUtils.e('IapRepositoryImpl: googleWebhook failed', error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }

  @override
  Future<Resource<void>> appleWebhook(AppleWebhookRequestModel request) async {
    try {
      await _remoteDataSource.appleWebhook(request);
      return const Resource.success(null);
    } catch (e, stack) {
      LogUtils.e('IapRepositoryImpl: appleWebhook failed', error: e, stackTrace: stack);
      return Resource.error(message: parseRepositoryError(e));
    }
  }
}
