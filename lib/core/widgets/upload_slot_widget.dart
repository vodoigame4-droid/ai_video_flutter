import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../../gen/assets.gen.dart';
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
            // Content Area
            Positioned.fill(
              child: GestureDetector(
                onTap: () => _showMockMediaPicker(context),
                child: hasMedia
                    ? _buildFilledState(context)
                    : _buildEmptyState(context),
              ),
            ),
            // Glassmorphic Close/Remove Button matching Figma node 99:436
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

  void _showMockMediaPicker(BuildContext context) {
    final t = context.t;

    // Define mock options based on whether this is a video or photo slot
    final mockAssets = isVideoSlot
        ? [
            _MockMediaOption(Assets.images.ob1.path, 'Dance Video 1'),
            _MockMediaOption(Assets.images.ob2.path, 'Dance Video 2'),
            _MockMediaOption(Assets.images.ob3.path, 'Promo Video'),
          ]
        : [
            _MockMediaOption(Assets.images.ob1.path, 'Portrait 1'),
            _MockMediaOption(Assets.images.ob2.path, 'Portrait 2'),
            _MockMediaOption(Assets.images.card1.path, 'Landscape 1'),
            _MockMediaOption(Assets.images.card2.path, 'Landscape 2'),
          ];

    showModalBottomSheet(
      context: context,
      backgroundColor: context.colorScheme.surface,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.create.select_mock_media,
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  t.create.select_media_desc,
                  style: context.textTheme.bodySmall,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: mockAssets.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final item = mockAssets[index];
                      return GestureDetector(
                        onTap: () {
                          onMediaSelected(item.path);
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            border: Border.all(
                              color: context.appTheme.borderColor,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(11),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(item.path, fit: BoxFit.cover),
                                Container(
                                  color: AppColors.black.withValues(alpha: 0.3),
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    item.name,
                                    style: context.appTheme.navLabelActiveStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MockMediaOption {
  final String path;
  final String name;

  _MockMediaOption(this.path, this.name);
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
