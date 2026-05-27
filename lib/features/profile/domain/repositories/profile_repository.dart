import '../../../../core/resources/resource.dart';
import '../entities/user_video_entity.dart';

abstract class ProfileRepository {
  Future<Resource<List<UserVideoEntity>>> getUserVideos();
  Future<Resource<bool>> deleteUserVideo(String id);
  Future<Resource<void>> updateVideoProgress(String id, double progress, String status);
}
