import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/iap_models.dart';
import '../repositories/iap_repository.dart';

/// UseCase khôi phục gói đăng ký thành viên (Subscription) trên hệ điều hành Android.
///
/// UseCase này nhận vào [RestoreSubscriptionRequestModel] chứa các thông tin:
/// - [productId]: ID của gói subscription cần khôi phục.
/// - [purchaseToken]: Purchase token được cung cấp bởi Google Play Store.
///
/// Kết quả trả về là một [Resource<void>] đại diện cho trạng thái xác thực khôi phục từ server.
class RestoreSubscriptionAndroidUseCase implements UseCase<void, RestoreSubscriptionRequestModel> {
  final IapRepository iapRepository;

  RestoreSubscriptionAndroidUseCase({required this.iapRepository});

  @override
  Future<Resource<void>> call(RestoreSubscriptionRequestModel request) {
    return iapRepository.restoreSubscriptionAndroid(request);
  }
}
