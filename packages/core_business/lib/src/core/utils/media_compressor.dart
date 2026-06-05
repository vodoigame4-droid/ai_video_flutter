import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:video_compress/video_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'log_utils.dart';

class MediaCompressor {
  /// Compresses an image file on the client-side.
  /// 
  /// - If the image is already smaller than [thresholdBytes] (default 300 KB), compression is skipped.
  /// - Resizes the image so that the maximum width or height is 1080 pixels (preserving aspect ratio).
  /// - Compresses the image using JPEG format with 80% quality.
  /// 
  /// Returns a new [File] representing the compressed image, or the original [file] if compression is skipped or fails.
  static Future<File> compressImage(File file, {int thresholdBytes = 300 * 1024}) async {
    try {
      if (!await file.exists()) {
        LogUtils.w('MediaCompressor: Image file does not exist at ${file.path}');
        return file;
      }

      final length = await file.length();
      // Skip if the image is already lightweight
      if (length < thresholdBytes) {
        LogUtils.i('MediaCompressor: Image is already small (${(length / 1024).toStringAsFixed(1)} KB). Skipping compression.');
        return file;
      }

      final tempDir = await getTemporaryDirectory();
      final targetPath = p.join(
        tempDir.path,
        'img_compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );

      LogUtils.i('MediaCompressor: Starting image compression for: ${file.path}. Original size: ${(length / 1024).toStringAsFixed(1)} KB');
      
      final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: 80,
        minWidth: 1080,
        minHeight: 1080,
        format: CompressFormat.jpeg,
      );

      if (result != null) {
        final compressedFile = File(result.path);
        final newLength = await compressedFile.length();
        LogUtils.i('MediaCompressor: Image compressed successfully. New size: ${(newLength / 1024).toStringAsFixed(1)} KB (Reduced by ${((length - newLength) / length * 100).toStringAsFixed(1)}%)');
        return compressedFile;
      } else {
        LogUtils.w('MediaCompressor: Compression returned null. Using original image.');
      }
    } catch (e, stack) {
      LogUtils.e('MediaCompressor: Image compression failed. Using original image.', error: e, stackTrace: stack);
    }
    return file;
  }

  /// Compresses a video file on the client-side.
  /// 
  /// - If the video is already smaller than [thresholdBytes] (default 5 MB), compression is skipped.
  /// - Compresses the video to [VideoQuality.MediumQuality] (usually 720p or similar native equivalent) to preserve details while saving space.
  /// 
  /// Returns a new [File] representing the compressed video, or the original [file] if compression is skipped or fails.
  static Future<File> compressVideo(File file, {int thresholdBytes = 5 * 1024 * 1024}) async {
    try {
      if (!await file.exists()) {
        LogUtils.w('MediaCompressor: Video file does not exist at ${file.path}');
        return file;
      }

      final length = await file.length();
      // Skip if the video is already lightweight
      if (length < thresholdBytes) {
        LogUtils.i('MediaCompressor: Video is already small (${(length / (1024 * 1024)).toStringAsFixed(1)} MB). Skipping compression.');
        return file;
      }

      LogUtils.i('MediaCompressor: Starting video compression for: ${file.path}. Original size: ${(length / (1024 * 1024)).toStringAsFixed(1)} MB');
      
      final mediaInfo = await VideoCompress.compressVideo(
        file.path,
        quality: VideoQuality.MediumQuality,
        deleteOrigin: false, // Do not delete the original selected/trimmed video
        includeAudio: true,
      );

      if (mediaInfo != null && mediaInfo.file != null) {
        final compressedFile = mediaInfo.file!;
        final newLength = await compressedFile.length();
        LogUtils.i('MediaCompressor: Video compressed successfully. New size: ${(newLength / (1024 * 1024)).toStringAsFixed(1)} MB (Reduced by ${((length - newLength) / length * 100).toStringAsFixed(1)}%)');
        return compressedFile;
      } else {
        LogUtils.w('MediaCompressor: Video compression returned null. Using original video.');
      }
    } catch (e, stack) {
      LogUtils.e('MediaCompressor: Video compression failed. Using original video.', error: e, stackTrace: stack);
    }
    return file;
  }
}
