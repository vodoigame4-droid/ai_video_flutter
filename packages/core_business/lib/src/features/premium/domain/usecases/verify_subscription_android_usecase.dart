import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/iap_models.dart';
import '../repositories/iap_repository.dart';

class VerifySubscriptionUseCase implements UseCase<void, VerifySubscriptionRequestModel> {
  final IapRepository iapRepository;

  VerifySubscriptionUseCase({required this.iapRepository});

  @override
  Future<Resource<void>> call(VerifySubscriptionRequestModel request) {
    return iapRepository.verifySubscription(request);
  }
}
