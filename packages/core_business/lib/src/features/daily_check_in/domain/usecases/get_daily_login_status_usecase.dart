import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/daily_login_entity.dart';
import '../repositories/daily_login_repository.dart';

class GetDailyLoginStatusUseCase implements UseCase<DailyLoginEntity, NoParams> {
  final DailyLoginRepository dailyLoginRepository;

  GetDailyLoginStatusUseCase({required this.dailyLoginRepository});

  @override
  Future<Resource<DailyLoginEntity>> call(NoParams params) {
    return dailyLoginRepository.getDailyLoginStatus();
  }
}
