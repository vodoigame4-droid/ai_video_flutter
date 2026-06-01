import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/core_business.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AutoLoginUseCase autoLoginUseCase;
  final GetOnboardingStatusUseCase getOnboardingStatusUseCase;
  Timer? _timer;
  bool _isLoginCompleted = false;
  int _progress = 0;

  SplashBloc({
    required this.autoLoginUseCase,
    required this.getOnboardingStatusUseCase,
  }) : super(const SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      await event.when(
        init: () async {
          _progress = 0;
          _isLoginCompleted = false;
          emit(const SplashState.loading(0));

          // 1. Start background login process
          _performBackgroundLogin();

          // 2. Start progress animation timer
          _timer?.cancel();
          _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
            _progress += 2;
            
            if (_progress >= 100) {
              if (_isLoginCompleted) {
                _progress = 100;
                timer.cancel();
                add(const SplashEvent.progressUpdated(100));
              } else {
                // Hold at 99% until background login completes
                _progress = 99;
                add(const SplashEvent.progressUpdated(99));
              }
            } else {
              add(SplashEvent.progressUpdated(_progress));
            }
          });
        },
        progressUpdated: (percent) async {
          if (percent >= 100) {
            final onboardingResult = await getOnboardingStatusUseCase(NoParams());
            final isOnboardingCompleted = onboardingResult.maybeWhen(
              success: (data) => data,
              orElse: () => false,
            );
            emit(SplashState.success(isOnboardingCompleted: isOnboardingCompleted));
          } else {
            emit(SplashState.loading(percent));
          }
        },
      );
    });
  }

  Future<void> _performBackgroundLogin() async {
    try {
      await autoLoginUseCase(NoParams());
    } catch (e, stack) {
      LogUtils.e('SplashBloc: Background login failed', error: e, stackTrace: stack);
    } finally {
      _isLoginCompleted = true;
      if (_progress >= 99) {
        _timer?.cancel();
        _timer = null;
        add(const SplashEvent.progressUpdated(100));
      }
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
