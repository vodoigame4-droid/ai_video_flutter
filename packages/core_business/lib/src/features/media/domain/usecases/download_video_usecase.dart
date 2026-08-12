import 'package:gal/gal.dart';
import '../../../../core/resources/resource.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/video_cache_manager.dart';

class DownloadVideoUseCase implements UseCase<void, String> {
  final VideoCacheManager _cacheManager = VideoCacheManager();

  @override
  Future<Resource<void>> call(String url) async {
    try {
      final hasAccess = await Gal.hasAccess(toAlbum: false);
      if (!hasAccess) {
        final granted = await Gal.requestAccess(toAlbum: false);
        if (!granted) {
          return const Resource.error(Failure.unknown('Permission denied to save video to gallery'));
        }
      }

      final cachedPath = await _cacheManager.getCachedOrDownload(url, waitForDownload: true);
      final filePath = cachedPath ?? url;

      if (filePath.startsWith('http://') || filePath.startsWith('https://')) {
        return const Resource.error(Failure.unknown('Failed to download video file to local device cache'));
      }

      await Gal.putVideo(filePath);
      return const Resource.success(null);
    } on GalException catch (e) {
      return Resource.error(Failure.unknown('Gal error: ${e.type.name}'));
    } catch (e) {
      return Resource.error(Failure.unknown(e.toString()));
    }
  }
}
