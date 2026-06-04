import '../../../../core/resources/resource.dart';
import '../entities/daily_login_entity.dart';

abstract class DailyLoginRepository {
  Future<Resource<DailyLoginEntity>> getDailyLoginStatus();
  Future<Resource<int>> checkIn({required bool ignoreReward});
}
