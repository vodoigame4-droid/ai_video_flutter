import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import '../utils/log_utils.dart';
import 'package:ai_video_flutter/features/create_video/presentation/widgets/upload_bottom_sheet_widget.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../../i18n/strings.g.dart';

class UploadSlotWidget extends StatelessWidget {
  final String? mediaPath;
  final String labelText;
  final IconData? placeholderIcon;
  final String? placeholderSvg;
  final Widget? placeholderWidget;
  final Color? borderColor;
  final double borderRadius;
  final VoidCallback onMediaRemoved;
  final ValueChanged<String> onMediaSelected;
  final bool isVideoSlot;

  const UploadSlotWidget({
    super.key,
    required this.mediaPath,
    required this.labelText,
    this.placeholderIcon,
    this.placeholderSvg,
    this.placeholderWidget,
    this.borderColor,
    this.borderRadius = 15.0,
    required this.onMediaRemoved,
    required this.onMediaSelected,
    this.isVideoSlot = false,
  });

  @override
  Widget build(BuildContext context) {
    final hasMedia = mediaPath != null && mediaPath!.isNotEmpty;

    return AspectRatio(
      aspectRatio: 1.0, // Square slots matching Figma (173px x 173px)
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        child: Stack(
          children: [
            // 1. Content Area
            Positioned.fill(
              child: hasMedia
                  ? _buildFilledState(context)
                  : _buildEmptyState(context),
            ),
            // 2. Click Layer (InkWell ripple effect)
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _showMediaPicker(context),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ),
              ),
            ),
            // 3. Glassmorphic Close/Remove Button matching Figma node 99:436
            if (hasMedia)
              Positioned(
                top: 10,
                right: 10,
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                    child: Material(
                      color: const Color(
                        0x99979797,
                      ), // rgba(151, 151, 151, 0.6)
                      child: InkWell(
                        onTap: onMediaRemoved,
                        child: const SizedBox(
                          width: 20,
                          height: 20,
                          child: Icon(
                            Icons.close_rounded,
                            color: AppColors.white,
                            size: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final activeBorderColor = borderColor ?? AppColors.primary;

    return Container(
      color: AppColors.background,
      child: CustomPaint(
        painter: _DashedBorderPainter(
          color: activeBorderColor,
          borderRadius: borderRadius,
          strokeWidth: 1.0,
          dashWidth: 12.0,
          dashGap: 8.0,
        ),
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPlaceholder(context),
              const SizedBox(height: 12),
              Text(
                labelText,
                style:
                    context.textTheme.bodySmall?.copyWith(
                      color: AppColors.subText, // Match Figma's label #B1B1B1
                    ) ??
                    const TextStyle(color: AppColors.subText, fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    if (placeholderWidget != null) {
      return placeholderWidget!;
    }

    if (placeholderSvg != null) {
      return SvgPicture.asset(placeholderSvg!, width: 40, height: 40);
    }

    if (placeholderIcon != null) {
      return Icon(placeholderIcon, color: AppColors.primary, size: 40);
    }

    // Default Fallbacks
    if (isVideoSlot) {
      return const Icon(
        Icons.play_circle_outline_rounded,
        color: AppColors.primary,
        size: 40,
      );
    } else {
      // Use the newly added/existing SVG for image uploader placeholder
      return SvgPicture.asset(
        'assets/icons/ic_image_add.svg',
        width: 40,
        height: 40,
      );
    }
  }

  Widget _buildFilledState(BuildContext context) {
    final path = mediaPath!;
    final isLocalAsset = path.startsWith('assets/');

    Widget imageWidget;
    if (isLocalAsset) {
      imageWidget = Image.asset(path, fit: BoxFit.cover);
    } else {
      imageWidget = Image.file(
        File(path),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.broken_image, size: 40);
        },
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        imageWidget,
        // Gradient overlay for visual aesthetics
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.black.withValues(alpha: 0.4),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        if (isVideoSlot)
          const Center(
            child: Icon(
              Icons.play_circle_fill_rounded,
              color: AppColors.white,
              size: 36,
            ),
          ),
      ],
    );
  }


  Future<void> _pickMedia(BuildContext context, ImageSource source) async {
    LogUtils.i('UploadSlotWidget: Starting _pickMedia. isVideoSlot: $isVideoSlot, source: $source');
    final cropTitle = context.t.tips_sheet.title;
    try {
      final ImagePicker picker = ImagePicker();
      if (isVideoSlot) {
        LogUtils.d('UploadSlotWidget: Picking video...');
        final XFile? video = await picker.pickVideo(source: source);
        if (video != null) {
          LogUtils.i('UploadSlotWidget: Video picked successfully: ${video.path}');
          onMediaSelected(video.path);
        } else {
          LogUtils.w('UploadSlotWidget: Video picking cancelled or returned null');
        }
      } else {
        LogUtils.d('UploadSlotWidget: Picking image...');
        final XFile? image = await picker.pickImage(source: source);
        if (image != null) {
          LogUtils.i('UploadSlotWidget: Image picked successfully: ${image.path}');
          final croppedPath = await _cropImage(cropTitle, image.path);
          LogUtils.i('UploadSlotWidget: Crop result path: $croppedPath');
          if (croppedPath != null) {
            onMediaSelected(croppedPath);
          }
        } else {
          LogUtils.w('UploadSlotWidget: Image picking cancelled or returned null');
        }
      }
    } catch (e, stack) {
      LogUtils.e(
        'UploadSlotWidget: Error picking media',
        error: e,
        stackTrace: stack,
      );
    }
  }

  Future<String?> _cropImage(String title, String sourcePath) async {
    LogUtils.i('UploadSlotWidget: Starting _cropImage for path: $sourcePath');
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: sourcePath,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: title,
            toolbarColor: AppColors.surface,
            toolbarWidgetColor: AppColors.white,
            activeControlsWidgetColor: AppColors.primary,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio3x2,
            ],
          ),
          IOSUiSettings(
            title: title,
            aspectRatioLockEnabled: false,
            resetAspectRatioEnabled: true,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio3x2,
            ],
          ),
        ],
      );
      if (croppedFile != null) {
        LogUtils.i('UploadSlotWidget: Cropped successfully: ${croppedFile.path}');
      } else {
        LogUtils.w('UploadSlotWidget: Cropping cancelled or returned null');
      }
      return croppedFile?.path;
    } catch (e, stack) {
      LogUtils.e(
        'UploadSlotWidget: Error cropping image',
        error: e,
        stackTrace: stack,
      );
      return null;
    }
  }

  void _showMediaPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.onSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (sheetContext) {
        return UploadBottomSheetWidget(
          title: isVideoSlot ? sheetContext.t.create.upload_video_slot : sheetContext.t.create.select_upload_title,
          onImageSourceSelected: (source) => _pickMedia(context, source),
        );
      },
    );
  }
}


class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double borderRadius;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;

  _DashedBorderPainter({
    required this.color,
    required this.borderRadius,
    this.strokeWidth = 1.0,
    required this.dashWidth,
    required this.dashGap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final halfStroke = strokeWidth / 2;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            halfStroke,
            halfStroke,
            size.width - strokeWidth,
            size.height - strokeWidth,
          ),
          Radius.circular(borderRadius - halfStroke),
        ),
      );

    final dashPath = _buildDashedPath(path, dashWidth, dashGap);
    canvas.drawPath(dashPath, paint);
  }

  Path _buildDashedPath(Path source, double dashWidth, double dashGap) {
    final dest = Path();
    for (final metric in source.computeMetrics()) {
      var distance = 0.0;
      var draw = true;
      while (distance < metric.length) {
        final len = draw ? dashWidth : dashGap;
        if (draw) {
          dest.addPath(
            metric.extractPath(distance, distance + len),
            Offset.zero,
          );
        }
        distance += len;
        draw = !draw;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
