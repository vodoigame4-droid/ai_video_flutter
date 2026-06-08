import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/iap_models.dart';
import '../repositories/iap_repository.dart';

/// UseCase xác thực giao dịch mua gói đăng ký thành viên (Subscription) trên hệ điều hành Android (Google Play Store).
///
/// UseCase này nhận vào [VerifySubscriptionRequestModel] chứa các thông tin:
/// - [productId]: ID của gói subscription.
/// - [purchaseToken]: Purchase token được cung cấp bởi Google Play Store.
///
/// Kết quả trả về là một [Resource<void>] đại diện cho trạng thái xác thực từ server.
class VerifySubscriptionAndroidUseCase implements UseCase<void, VerifySubscriptionRequestModel> {
  final IapRepository iapRepository;

  VerifySubscriptionAndroidUseCase({required this.iapRepository});

  @override
  Future<Resource<void>> call(VerifySubscriptionRequestModel request) {
    return iapRepository.verifySubscriptionAndroid(request);
  }
}
