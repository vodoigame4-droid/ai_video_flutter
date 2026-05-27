import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  Timer? _timer;

  SplashBloc() : super(const SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      await event.when(
        init: () async {
          emit(const SplashState.loading(0));
          _timer?.cancel();
          int progress = 0;
          _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
            progress += 2;
            if (progress >= 100) {
              progress = 100;
              timer.cancel();
              add(const SplashEvent.progressUpdated(100));
            } else {
              add(SplashEvent.progressUpdated(progress));
            }
          });
        },
        progressUpdated: (percent) {
          if (percent >= 100) {
            emit(const SplashState.success());
          } else {
            emit(SplashState.loading(percent));
          }
        },
      );
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
