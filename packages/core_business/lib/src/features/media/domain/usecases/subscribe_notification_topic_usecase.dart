import '../../../../core/resources/resource.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/notification_repository.dart';

class SubscribeNotificationTopicUseCase implements UseCase<void, String> {
  final NotificationRepository notificationRepository;

  SubscribeNotificationTopicUseCase({required this.notificationRepository});

  @override
  Future<Resource<void>> call(String topic) async {
    try {
      await notificationRepository.subscribeToTopic(topic);
      return const Resource.success(null);
    } catch (e) {
      return Resource.error(Failure.unknown(e.toString()));
    }
  }
}
