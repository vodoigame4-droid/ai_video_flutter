import 'package:ai_video_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';

class TipsBottomSheet extends StatelessWidget {
  final ScrollController? scrollController;

  const TipsBottomSheet({super.key, this.scrollController});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.onSurface,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.82,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return TipsBottomSheet(scrollController: scrollController);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final goodMockPhotos = [
      Assets.images.imgOnePerson.path,
      Assets.images.imgClearFace.path,
      Assets.images.imgHalfBody.path,
    ];
    final badMockPhotos = [
      Assets.images.imgHidenPage.path,
      Assets.images.imgMultiplePeople.path,
      Assets.images.imgBluring.path,
    ];

    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.tips_sheet.title,
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    color: AppColors.white,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              SvgPicture.asset(
                Assets.icons.icGreenTick,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              Text(
                t.tips_sheet.use_photos,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildTipItem(
                  path: goodMockPhotos[0],
                  label: t.tips_sheet.one_person,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildTipItem(
                  path: goodMockPhotos[1],
                  label: t.tips_sheet.clear_face,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildTipItem(
                  path: goodMockPhotos[2],
                  label: t.tips_sheet.half_body,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              SvgPicture.asset(
                Assets.icons.icRedTick,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              Text(
                t.tips_sheet.avoid_photos,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildTipItem(
                  path: badMockPhotos[0],
                  label: t.tips_sheet.hidden_face,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildTipItem(
                  path: badMockPhotos[1],
                  label: t.tips_sheet.multiple_people,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildTipItem(
                  path: badMockPhotos[2],
                  label: t.tips_sheet.blurry_photo,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: Ink(
              height: 56,
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: Center(
                child: Text(
                  t.tips_sheet.button_got_it,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipItem({
    required String path,
    required String label,
  }) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 3 / 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            child: Image.asset(path, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
