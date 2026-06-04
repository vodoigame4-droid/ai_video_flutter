import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/daily_login_repository.dart';

class CheckInUseCase implements UseCase<int, bool> {
  final DailyLoginRepository dailyLoginRepository;

  CheckInUseCase({required this.dailyLoginRepository});

  @override
  Future<Resource<int>> call(bool ignoreReward) {
    return dailyLoginRepository.checkIn(ignoreReward: ignoreReward);
  }
}
