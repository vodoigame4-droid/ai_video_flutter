import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/notification_repository.dart';

class RequestNotificationPermissionUseCase implements UseCase<bool, NoParams> {
  final NotificationRepository notificationRepository;

  RequestNotificationPermissionUseCase({required this.notificationRepository});

  @override
  Future<Resource<bool>> call(NoParams params) async {
    try {
      final isGranted = await notificationRepository.requestPermission();
      return Resource.success(isGranted);
    } catch (e) {
      return Resource.error(message: e.toString());
    }
  }
}
