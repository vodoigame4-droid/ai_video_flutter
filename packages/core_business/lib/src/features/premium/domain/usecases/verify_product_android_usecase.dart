import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/iap_models.dart';
import '../repositories/iap_repository.dart';

/// UseCase xác thực giao dịch mua gói Credit (Consumable Product) trên hệ điều hành Android (Google Play Store).
///
/// UseCase này nhận vào [VerifyProductRequestModel] chứa các thông tin:
/// - [productId]: ID của gói credit đã mua.
/// - [purchaseToken]: Purchase token được cung cấp bởi Google Play Store.
///
/// Kết quả trả về là một [Resource<void>] đại diện cho trạng thái xác thực từ server.
class VerifyProductAndroidUseCase implements UseCase<void, VerifyProductRequestModel> {
  final IapRepository iapRepository;

  VerifyProductAndroidUseCase({required this.iapRepository});

  @override
  Future<Resource<void>> call(VerifyProductRequestModel request) {
    return iapRepository.verifyProductAndroid(request);
  }
}
