import '../../../../core/resources/resource.dart';
import '../../../../core/utils/error_parser.dart';
import '../../../../core/utils/log_utils.dart';
import '../../domain/entities/daily_login_entity.dart';
import '../../domain/repositories/daily_login_repository.dart';
import '../datasources/daily_login_remote_datasource.dart';
import '../models/daily_login_models.dart';

class DailyLoginRepositoryImpl implements DailyLoginRepository {
  final DailyLoginRemoteDataSource _remoteDataSource;

  DailyLoginRepositoryImpl({required DailyLoginRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Resource<DailyLoginEntity>> getDailyLoginStatus() async {
    try {
      final model = await _remoteDataSource.getDailyLoginStatus();
      return Resource.success(model.toEntity());
    } catch (e, stack) {
      LogUtils.e('DailyLoginRepositoryImpl: getDailyLoginStatus failed', error: e, stackTrace: stack);
      return Resource.error(parseRepositoryErrorToFailure(e));
    }
  }

  @override
  Future<Resource<int>> checkIn({required bool ignoreReward}) async {
    try {
      final request = DailyCheckInRequestModel(ignoreReward: ignoreReward);
      final model = await _remoteDataSource.checkIn(request);
      return Resource.success(model.rewardCredits);
    } catch (e, stack) {
      LogUtils.e('DailyLoginRepositoryImpl: checkIn failed', error: e, stackTrace: stack);
      return Resource.error(parseRepositoryErrorToFailure(e));
    }
  }
}
