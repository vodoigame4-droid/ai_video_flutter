import 'package:flutter/foundation.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/resources/resource.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/constants/storage_keys.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';
import '../../../media/domain/repositories/notification_repository.dart';

class AutoLoginUseCase implements UseCase<UserEntity, NoParams> {
  final AuthRepository authRepository;
  final NotificationRepository notificationRepository;
  final SharedPreferences sharedPreferences;

  AutoLoginUseCase({
    required this.authRepository,
    required this.notificationRepository,
    required this.sharedPreferences,
  });

  @override
  Future<Resource<UserEntity>> call(NoParams params) async {
    String? deviceId;
    try {
      String? storedDeviceId = sharedPreferences.getString(
        StorageKeys.deviceId,
      );
      if (kDebugMode) {
        storedDeviceId = "3D350077-6339-409E-B7AD-4417A651B7ED-tgv";
      }

      String? freshUdid;
      try {
        freshUdid = await FlutterUdid.udid;
      } catch (e) {
        freshUdid = 'ERROR: $e';
      }
      LogUtils.i(
        'AutoLoginUseCase: Stored deviceId: $storedDeviceId | Fresh UDID: $freshUdid',
      );

      final token = sharedPreferences.getString(StorageKeys.authAccessToken);
      deviceId = storedDeviceId;
      if (deviceId == null || deviceId.isEmpty) {
        try {
          deviceId = await FlutterUdid.udid;
        } catch (e, stack) {
          LogUtils.e(
            'AutoLoginUseCase: Failed to get UDID, falling back to UUID',
            error: e,
            stackTrace: stack,
          );
          deviceId = const Uuid().v4();
        }
      }

      if (!deviceId.endsWith('-tgv')) {
        deviceId = '$deviceId-tgv';
        await sharedPreferences.setString(StorageKeys.deviceId, deviceId);
      }

      UserEntity? user;
      if (token == null || token.isEmpty) {
        final loginResult = await authRepository.login(deviceId, null);
        loginResult.maybeWhen(
          success: (data) {
            user = data;
          },
          error: (failure) {
            LogUtils.e('AutoLoginUseCase: Login failed: ${failure.toErrorCodeOrMessage()}');
          },
          orElse: () {},
        );
      } else {
        // Token exists, get profile instead to verify token and retrieve user details
        final profileResult = await authRepository.getProfile();
        profileResult.maybeWhen(
          success: (data) {
            user = data;
          },
          error: (failure) {
            LogUtils.e('AutoLoginUseCase: GetProfile failed: ${failure.toErrorCodeOrMessage()}');
          },
          orElse: () {},
        );
      }

      // Setup Notification topics in the background without blocking the login/app startup flow
      notificationRepository.requestPermission().then((isGranted) {
        if (isGranted && deviceId != null) {
          notificationRepository.subscribeToTopic('all');
          notificationRepository.subscribeToTopic(deviceId);
        }
      }).catchError((e, stack) {
        LogUtils.e(
          'AutoLoginUseCase: Notification setup failed',
          error: e,
          stackTrace: stack,
        );
      });

      if (user != null) {
        return Resource.success(user!);
      } else {
        return const Resource.error(
          Failure.unknown('Auto login initialization failed'),
        );
      }
    } catch (e, stack) {
      LogUtils.e(
        'AutoLoginUseCase: Unexpected error',
        error: e,
        stackTrace: stack,
      );
      return Resource.error(Failure.unknown(e.toString()));
    }
  }
}
