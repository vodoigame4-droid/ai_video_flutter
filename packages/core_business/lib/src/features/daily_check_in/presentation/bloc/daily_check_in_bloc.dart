import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/resource.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../auth/domain/usecases/get_profile_usecase.dart';
import '../../domain/usecases/get_daily_login_status_usecase.dart';
import '../../domain/usecases/check_in_usecase.dart';
import 'daily_check_in_event.dart';
import 'daily_check_in_state.dart';

class DailyCheckInBloc extends Bloc<DailyCheckInEvent, DailyCheckInState> {
  final GetDailyLoginStatusUseCase getDailyLoginStatusUseCase;
  final CheckInUseCase checkInUseCase;
  final GetProfileUseCase getProfileUseCase;

  DailyCheckInBloc({
    required this.getDailyLoginStatusUseCase,
    required this.checkInUseCase,
    required this.getProfileUseCase,
  }) : super(const DailyCheckInState.initial()) {
    on<DailyCheckInEvent>((event, emit) async {
      await event.when(
        init: () async {
          emit(const DailyCheckInState.loading());
          LogUtils.d('DailyCheckInBloc: Fetching daily check-in status');

          final result = await getDailyLoginStatusUseCase(NoParams());

          result.when(
            initial: () {},
            loading: () {},
            empty: () {
              emit(const DailyCheckInState.error(message: 'No daily login status available'));
            },
            success: (entity) {
              final isCheckedIn = _checkIsToday(entity.lastLoginAt);
              emit(DailyCheckInState.ready(
                dailyLoginEntity: entity,
                isCheckedInToday: isCheckedIn,
                checkInStatus: const Resource.initial(),
              ));
            },
            error: (failure) {
              LogUtils.e('DailyCheckInBloc: Fetch status failed: ${failure.toErrorCodeOrMessage()}');
              emit(DailyCheckInState.error(message: failure.toErrorCodeOrMessage()));
            },
          );
        },
        checkIn: (ignoreReward) async {
          final readyState = state.mapOrNull(ready: (r) => r);
          if (readyState == null) return;

          emit(readyState.copyWith(checkInStatus: const Resource.loading()));
          LogUtils.d('DailyCheckInBloc: Performing daily check-in');

          final result = await checkInUseCase(ignoreReward);

          await result.when(
            initial: () {},
            loading: () {},
            empty: () {},
            success: (credits) async {
              LogUtils.i('DailyCheckInBloc: Check-in success. Reward credits: $credits');

              // Refresh user profile/credits in background
              try {
                await getProfileUseCase(NoParams());
              } catch (e) {
                LogUtils.w('DailyCheckInBloc: Background getProfile failed: $e');
              }

              // Fetch updated daily check-in status
              final freshResult = await getDailyLoginStatusUseCase(NoParams());

              freshResult.maybeWhen(
                success: (freshEntity) {
                  final isCheckedIn = _checkIsToday(freshEntity.lastLoginAt);
                  emit(DailyCheckInState.ready(
                    dailyLoginEntity: freshEntity,
                    isCheckedInToday: isCheckedIn,
                    checkInStatus: Resource.success(credits),
                  ));
                },
                orElse: () {
                  // Fallback: manually update locally
                  final updatedEntity = readyState.dailyLoginEntity.copyWith(
                    currentStreak: readyState.dailyLoginEntity.currentStreak + 1,
                    lastLoginAt: DateTime.now().toUtc().toIso8601String(),
                  );
                  emit(DailyCheckInState.ready(
                    dailyLoginEntity: updatedEntity,
                    isCheckedInToday: true,
                    checkInStatus: Resource.success(credits),
                  ));
                },
              );
            },
            error: (failure) {
              LogUtils.e('DailyCheckInBloc: Check-in failed: ${failure.toErrorCodeOrMessage()}');
              emit(readyState.copyWith(
                checkInStatus: Resource.error(failure),
              ));
            },
          );
        },
      );
    });
  }

  bool _checkIsToday(String? lastLoginAtString) {
    if (lastLoginAtString == null) return false;
    
    DateTime? lastLoginAt = DateTime.tryParse(lastLoginAtString);
    if (lastLoginAt == null) {
      final parsedInt = int.tryParse(lastLoginAtString);
      if (parsedInt != null) {
        if (parsedInt < 9999999999) {
          lastLoginAt = DateTime.fromMillisecondsSinceEpoch(parsedInt * 1000);
        } else {
          lastLoginAt = DateTime.fromMillisecondsSinceEpoch(parsedInt);
        }
      }
    }

    if (lastLoginAt == null) return false;
    final now = DateTime.now();
    final lastLoginLocal = lastLoginAt.toLocal();
    return lastLoginLocal.year == now.year &&
        lastLoginLocal.month == now.month &&
        lastLoginLocal.day == now.day;
  }
}
