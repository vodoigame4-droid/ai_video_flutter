import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:core_business/core_business.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final LoginUseCase loginUseCase;
  final SharedPreferences sharedPreferences;
  final NotificationRepository notificationRepository;
  Timer? _timer;
  bool _isLoginCompleted = false;
  int _progress = 0;

  SplashBloc({
    required this.loginUseCase,
    required this.sharedPreferences,
    required this.notificationRepository,
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

  Future<void> _performBackgroundLogin() async {
    try {
      final token = sharedPreferences.getString(StorageKeys.authAccessToken);
      String? deviceId = sharedPreferences.getString(StorageKeys.deviceId);
      if (deviceId == null || deviceId.isEmpty) {
        deviceId = const Uuid().v4();
        await sharedPreferences.setString(StorageKeys.deviceId, deviceId);
      }
      
      if (token == null || token.isEmpty) {
        await loginUseCase(LoginParams(deviceId: deviceId));
      }

      // Request notification permission and subscribe to topics
      final isGranted = await notificationRepository.requestPermission();
      if (isGranted) {
        await notificationRepository.subscribeToTopic('all');
        await notificationRepository.subscribeToTopic(deviceId);
      }
    } catch (_) {
      // Gracefully continue to allow app usage even if network fails/offline
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
