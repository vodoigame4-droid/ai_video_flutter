import '../../../../core/resources/resource.dart';
import '../../../../core/utils/log_utils.dart';
import '../../domain/entities/user_video_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_datasource.dart';
import '../models/user_video_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource localDataSource;

  ProfileRepositoryImpl(this.localDataSource);

  @override
  Future<Resource<List<UserVideoEntity>>> getUserVideos() async {
    try {
      final models = await localDataSource.getUserVideos();
      final entities = models.map((model) => model.toEntity()).toList();
      return Resource.success(entities);
    } catch (e, stack) {
      LogUtils.e('Error loading user videos', error: e, stackTrace: stack);
      return Resource.error(message: e.toString());
    }
  }

  @override
  Future<Resource<bool>> deleteUserVideo(String id) async {
    try {
      final success = await localDataSource.deleteUserVideo(id);
      return Resource.success(success);
    } catch (e, stack) {
      LogUtils.e('Error deleting user video', error: e, stackTrace: stack);
      return Resource.error(message: e.toString());
    }
  }

  @override
  Future<Resource<void>> updateVideoProgress(String id, double progress, String status) async {
    try {
      await localDataSource.updateVideoProgress(id, progress, status);
      return Resource.success(null);
    } catch (e, stack) {
      LogUtils.e('Error updating video progress', error: e, stackTrace: stack);
      return Resource.error(message: e.toString());
    }
  }

  @override
  Future<Resource<void>> addUserVideo(UserVideoEntity video) async {
    try {
      final model = UserVideoModel(
        id: video.id,
        title: video.title,
        imageUrl: video.imageUrl,
        status: video.status,
        progress: video.progress,
        createdAt: video.createdAt,
        isLiked: video.isLiked,
      );
      await localDataSource.addUserVideo(model);
      return Resource.success(null);
    } catch (e, stack) {
      LogUtils.e('Error adding user video', error: e, stackTrace: stack);
      return Resource.error(message: e.toString());
    }
  }
}
