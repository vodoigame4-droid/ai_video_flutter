import 'package:gal/gal.dart';
import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/video_cache_manager.dart';

class DownloadVideoUseCase implements UseCase<void, String> {
  final VideoCacheManager _cacheManager = VideoCacheManager();

  @override
  Future<Resource<void>> call(String url) async {
    try {
      final cachedPath = await _cacheManager.getCachedOrDownload(url, waitForDownload: true);
      final filePath = cachedPath ?? url;

      if (filePath.startsWith('http://') || filePath.startsWith('https://')) {
        return const Resource.error(message: 'Failed to download video file to local device cache');
      }

      await Gal.putVideo(filePath);
      return const Resource.success(null);
    } catch (e) {
      return Resource.error(message: e.toString());
    }
  }
}
