import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/watch_profile_usecase.dart';
import '../../../domain/usecases/get_profile_usecase.dart';
import '../../../domain/entities/user_entity.dart';
import 'credit_badge_event.dart';
import 'credit_badge_state.dart';

class CreditBadgeBloc extends Bloc<CreditBadgeEvent, CreditBadgeState> {
  final WatchProfileUseCase _watchProfileUseCase;
  final GetProfileUseCase _getProfileUseCase;
  StreamSubscription? _profileSubscription;

  CreditBadgeBloc({
    required WatchProfileUseCase watchProfileUseCase,
    required GetProfileUseCase getProfileUseCase,
  })  : _watchProfileUseCase = watchProfileUseCase,
        _getProfileUseCase = getProfileUseCase,
        super(const CreditBadgeState.initial()) {
    on<CreditBadgeEvent>((event, emit) async {
      await event.when(
        started: () => _onStarted(emit),
        profileUpdated: (user) => _onProfileUpdated(user, emit),
      );
    });
  }

  Future<void> _onStarted(Emitter<CreditBadgeState> emit) async {
    emit(const CreditBadgeState.loading());
    
    _profileSubscription?.cancel();
    _profileSubscription = _watchProfileUseCase().listen(
      (user) => add(CreditBadgeEvent.profileUpdated(user)),
      onError: (error) {
        // Stream subscription handles errors by doing nothing or emitting error state.
      },
    );

    // Call API to fetch/update the stream with the latest data
    await _getProfileUseCase(NoParams());
  }

  Future<void> _onProfileUpdated(UserEntity user, Emitter<CreditBadgeState> emit) async {
    emit(CreditBadgeState.ready(
      isPro: user.isVip,
      credits: user.credits,
    ));
  }

  @override
  Future<void> close() {
    _profileSubscription?.cancel();
    return super.close();
  }
}
