import 'package:flutter/material.dart';
import 'dart:io';
import 'package:go_router/go_router.dart';
import 'package:core_business/core_business.dart' hide VideoCacheManager;
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/video_card.dart';
import '../../../../core/extensions/animation_extensions.dart';
import '../../../../core/errors/backend_error_handler.dart';
import '../../../../i18n/strings.g.dart';
import '../../../create_video/presentation/pages/create_from_template_page.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../core/utils/video_cache_manager.dart';

/// A reusable widget to represent a section containing a category header (title, icon, "See All" button)
/// and a horizontal list of template video cards supporting all state configurations (loading, error, success).
class HomeTemplatesSectionWidget extends StatelessWidget {
  final String title;
  final String iconAsset;
  final Resource<List<ThemeEntity>> videosState;
  final VoidCallback onSeeAllPressed;

  const HomeTemplatesSectionWidget({
    super.key,
    required this.title,
    required this.iconAsset,
    required this.videosState,
    required this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppSvgIcon(assetName: iconAsset, width: 20, height: 20),
                  const SizedBox(width: 6),
                  Text(title, style: context.textTheme.titleMedium),
                ],
              ),
              TextButton(
                onPressed: onSeeAllPressed,
                child: Text(
                  t.common.see_all,
                  style: context.appTheme.seeAllTextStyle,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Videos horizontal list
        videosState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const SizedBox(
            height: 236,
            child: Center(child: CircularProgressIndicator()),
          ),
          success: (videos) {
            // Pre-cache first 5 template videos in the background
            if (!Platform.environment.containsKey('FLUTTER_TEST')) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                for (final template in videos.take(5)) {
                  final videoUrl = template.resultUrl.isNotEmpty
                      ? template.resultUrl
                      : template.sourceUrl;
                  if (videoUrl.isNotEmpty) {
                    VideoCacheManager().getCachedOrDownload(videoUrl, waitForDownload: false);
                  }
                }
              });
            }

            return SizedBox(
              height: 236,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: videos.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final template = videos[index];
                  return VideoCard(
                    key: ValueKey(template.id),
                    title: template.name,
                    imageUrl: template.thumbnailUrl,
                    showPlayButton: false,
                    showVolumeIcon: false,
                    width: 158,
                    height: 236,
                    heroTag: 'template-hero-${template.id}',
                    onTap: () {
                      final videoUrl = template.resultUrl.isNotEmpty
                          ? template.resultUrl
                          : template.sourceUrl;
                      context.pushNamed(
                        CreateFromTemplatePage.name,
                        queryParameters: {
                          'templateId': template.id,
                          'title': template.name,
                          'videoUrl': videoUrl,
                          'imageUrl': template.thumbnailUrl,
                          'themeType': template.type,
                          'themeOrgId': template.orgId.toString(),
                        },
                      );
                    },
                  );
                },
              ),
            ).fadeIn(duration: const Duration(milliseconds: 400));
          },
          empty: () => const SizedBox.shrink(),
          error: (failure) => Center(
            child: Text(
              BackendErrorHelper.getErrorMessage(
                context,
                failure.toErrorCodeOrMessage(),
              ),
              style: context.appTheme.errorTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
