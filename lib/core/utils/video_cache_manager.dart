import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'log_utils.dart';

class VideoCacheManager {
  static final VideoCacheManager _instance = VideoCacheManager._internal();
  factory VideoCacheManager() => _instance;
  VideoCacheManager._internal();

  final Dio _dio = Dio();
  
  // Track in-progress downloads to avoid concurrent identical requests
  final Map<String, Future<String>> _downloadQueue = {};

  /// Retrieves the local file path for a cached video.
  /// If not cached, it initiates downloading in the background.
  /// If [waitForDownload] is true, it waits for the download to complete before returning.
  /// Otherwise, it returns null immediately, letting the caller fallback to network playback.
  Future<String?> getCachedOrDownload(String url, {bool waitForDownload = false}) async {
    if (url.isEmpty) return null;

    try {
      final cacheDir = await getTemporaryDirectory();
      final extension = _getFileExtension(url);
      final filename = '${url.hashCode}.$extension';
      final localFile = File('${cacheDir.path}/video_cache/$filename');

      // 1. If file already exists locally, return its path
      if (await localFile.exists()) {
        LogUtils.d('VideoCacheManager: Cache hit for $url -> ${localFile.path}');
        return localFile.path;
      }

      // 2. If already downloading, manage queue
      Future<String>? downloadFuture;
      if (_downloadQueue.containsKey(url)) {
        LogUtils.d('VideoCacheManager: Download already in progress for $url');
        downloadFuture = _downloadQueue[url];
      } else {
        LogUtils.d('VideoCacheManager: Start caching download for $url');
        downloadFuture = _startDownload(url, localFile);
        _downloadQueue[url] = downloadFuture;
      }

      if (waitForDownload) {
        return await downloadFuture;
      }
      
      // Let the caller play from network URL while downloading in background
      return null;
    } catch (e, stack) {
      LogUtils.e('VideoCacheManager: Failed to get or download video cache', error: e, stackTrace: stack);
      return null;
    }
  }

  Future<String> _startDownload(String url, File localFile) async {
    try {
      // Create directory if it doesn't exist
      await localFile.parent.create(recursive: true);

      // Download to temporary file first, then rename to avoid playing half-written files
      final tempFile = File('${localFile.path}.tmp');
      if (await tempFile.exists()) {
        await tempFile.delete();
      }

      await _dio.download(url, tempFile.path);
      await tempFile.rename(localFile.path);

      LogUtils.d('VideoCacheManager: Download completed and cached: ${localFile.path}');
      return localFile.path;
    } catch (e, stack) {
      LogUtils.e('VideoCacheManager: Error downloading video file', error: e, stackTrace: stack);
      // Clean up temp file
      try {
        final tempFile = File('${localFile.path}.tmp');
        if (await tempFile.exists()) {
          await tempFile.delete();
        }
      } catch (_) {}
      rethrow;
    } finally {
      // Remove from queue when finished
      _downloadQueue.remove(url);
    }
  }

  String _getFileExtension(String url) {
    try {
      final uri = Uri.parse(url);
      final path = uri.path;
      final dotIndex = path.lastIndexOf('.');
      if (dotIndex != -1 && dotIndex < path.length - 1) {
        final ext = path.substring(dotIndex + 1).toLowerCase();
        // Support typical video formats
        if (['mp4', 'mkv', 'mov', 'avi', 'webm', '3gp', 'flv'].contains(ext)) {
          return ext;
        }
      }
    } catch (_) {}
    return 'mp4'; // Default to mp4
  }

}
