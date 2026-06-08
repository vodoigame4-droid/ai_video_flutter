import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/iap_models.dart';
import '../repositories/iap_repository.dart';

/// UseCase xác thực giao dịch mua gói Credit (Consumable Product) trên hệ điều hành iOS.
///
/// UseCase này nhận vào [VerifyProductIosRequestModel] chứa các thông tin:
/// - [productId]: ID của gói credit đã mua trên App Store.
/// - [transactionId]: ID giao dịch (Transaction ID) do App Store cung cấp.
///
/// Kết quả trả về là một [Resource<void>] đại diện cho trạng thái xác thực từ server.
class VerifyProductIosUseCase implements UseCase<void, VerifyProductIosRequestModel> {
  final IapRepository iapRepository;

  VerifyProductIosUseCase({required this.iapRepository});

  @override
  Future<Resource<void>> call(VerifyProductIosRequestModel request) {
    return iapRepository.verifyProductIos(request);
  }
}
