import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/iap_models.dart';
import '../repositories/iap_repository.dart';

/// UseCase khôi phục gói đăng ký thành viên (Subscription) trên hệ điều hành iOS.
///
/// UseCase này nhận vào [RestoreSubscriptionIosRequestModel] chứa các thông tin:
/// - [productId]: ID của gói subscription cần khôi phục trên App Store.
/// - [transactionId]: ID của giao dịch mua gốc (Original Transaction ID) do App Store cung cấp.
///
/// Kết quả trả về là một [Resource<void>] đại diện cho trạng thái xác thực khôi phục từ server.
class RestoreSubscriptionIosUseCase implements UseCase<void, RestoreSubscriptionIosRequestModel> {
  final IapRepository iapRepository;

  RestoreSubscriptionIosUseCase({required this.iapRepository});

  @override
  Future<Resource<void>> call(RestoreSubscriptionIosRequestModel request) {
    return iapRepository.restoreSubscriptionIos(request);
  }
}
