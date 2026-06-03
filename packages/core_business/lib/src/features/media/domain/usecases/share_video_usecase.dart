import 'package:share_plus/share_plus.dart';
import '../../../../core/resources/resource.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/video_cache_manager.dart';

class ShareVideoParams {
  final String videoUrl;
  final String title;

  ShareVideoParams({required this.videoUrl, required this.title});
}

class ShareVideoUseCase implements UseCase<void, ShareVideoParams> {
  final VideoCacheManager _cacheManager = VideoCacheManager();

  @override
  Future<Resource<void>> call(ShareVideoParams params) async {
    try {
      final cachedPath = await _cacheManager.getCachedOrDownload(params.videoUrl, waitForDownload: true);
      final filePath = cachedPath ?? params.videoUrl;

      if (filePath.startsWith('http://') || filePath.startsWith('https://')) {
        return const Resource.error(Failure.unknown('Failed to download video file to local device cache for sharing'));
      }

      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(filePath)],
          text: params.title,
        ),
      );
      return const Resource.success(null);
    } catch (e) {
      return Resource.error(Failure.unknown(e.toString()));
    }
  }
}
