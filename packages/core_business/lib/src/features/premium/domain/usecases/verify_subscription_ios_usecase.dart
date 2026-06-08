import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/iap_models.dart';
import '../repositories/iap_repository.dart';

/// UseCase xác thực giao dịch mua gói đăng ký thành viên (Subscription) trên hệ điều hành iOS.
///
/// UseCase này nhận vào [VerifySubscriptionIosRequestModel] chứa các thông tin:
/// - [productId]: ID của gói subscription đã mua trên App Store.
/// - [transactionId]: ID giao dịch (Transaction ID) do App Store cung cấp.
///
/// Kết quả trả về là một [Resource<void>] đại diện cho trạng thái xác thực từ server.
class VerifySubscriptionIosUseCase implements UseCase<void, VerifySubscriptionIosRequestModel> {
  final IapRepository iapRepository;

  VerifySubscriptionIosUseCase({required this.iapRepository});

  @override
  Future<Resource<void>> call(VerifySubscriptionIosRequestModel request) {
    return iapRepository.verifySubscriptionIos(request);
  }
}
