import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';

class UploadBottomSheetWidget extends StatelessWidget {
  final ValueChanged<ImageSource> onImageSourceSelected;

  const UploadBottomSheetWidget({
    super.key,
    required this.onImageSourceSelected,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 24.0,
        bottom: MediaQuery.of(context).padding.bottom + 24.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Drag Handle (Top)
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFF3F3F3F),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 2. Title Row and Close Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.create.select_upload_title,
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600, // SemiBold
                ),
              ),
              // Glassmorphic Close Button (24px x 24px)
              ClipOval(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Material(
                    color: const Color(0x99979797), // rgba(151, 151, 151, 0.6)
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(100),
                      child: const SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(
                          Icons.close_rounded,
                          color: AppColors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // 3. Selection Buttons
          InkWell(
            onTap: () {
              Navigator.pop(context);
              onImageSourceSelected(ImageSource.camera);
            },
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Ink(
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(
                  alpha: 0.2,
                ), // rgba(255,255,255,0.2)
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_camera.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    t.common.camera,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500, // Medium
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              onImageSourceSelected(ImageSource.gallery);
            },
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Ink(
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(
                  alpha: 0.2,
                ), // rgba(255,255,255,0.2)
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_gallery.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    t.common.gallery,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500, // Medium
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
