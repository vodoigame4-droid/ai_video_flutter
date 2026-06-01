import 'package:flutter_udid/flutter_udid.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/resources/resource.dart';
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
      final storedDeviceId = sharedPreferences.getString(StorageKeys.deviceId);
      String? freshUdid;
      try {
        freshUdid = await FlutterUdid.udid;
      } catch (e) {
        freshUdid = 'ERROR: $e';
      }
      LogUtils.i('AutoLoginUseCase: Stored deviceId: $storedDeviceId | Fresh UDID: $freshUdid');

      final token = sharedPreferences.getString(StorageKeys.authAccessToken);
      deviceId = storedDeviceId;
      if (deviceId == null || deviceId.isEmpty) {
        try {
          deviceId = await FlutterUdid.udid;
        } catch (e, stack) {
          LogUtils.e('AutoLoginUseCase: Failed to get UDID, falling back to UUID', error: e, stackTrace: stack);
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
          error: (message) {
            LogUtils.e('AutoLoginUseCase: Login failed: $message');
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
          error: (message) {
            LogUtils.e('AutoLoginUseCase: GetProfile failed: $message');
          },
          orElse: () {},
        );
      }

      // Setup Notification topics
      try {
        final isGranted = await notificationRepository.requestPermission();
        if (isGranted) {
          await notificationRepository.subscribeToTopic('all');
          await notificationRepository.subscribeToTopic(deviceId);
        }
      } catch (e, stack) {
        LogUtils.e('AutoLoginUseCase: Notification setup failed', error: e, stackTrace: stack);
      }

      if (user != null) {
        return Resource.success(user!);
      } else {
        return const Resource.error(message: 'Auto login initialization failed');
      }
    } catch (e, stack) {
      LogUtils.e('AutoLoginUseCase: Unexpected error', error: e, stackTrace: stack);
      return Resource.error(message: e.toString());
    }
  }
}
