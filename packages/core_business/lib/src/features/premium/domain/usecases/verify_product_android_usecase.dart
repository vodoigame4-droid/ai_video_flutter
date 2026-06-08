import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/iap_models.dart';
import '../repositories/iap_repository.dart';

class VerifyProductUseCase implements UseCase<void, VerifyProductRequestModel> {
  final IapRepository iapRepository;

  VerifyProductUseCase({required this.iapRepository});

  @override
  Future<Resource<void>> call(VerifyProductRequestModel request) {
    return iapRepository.verifyProduct(request);
  }
}
