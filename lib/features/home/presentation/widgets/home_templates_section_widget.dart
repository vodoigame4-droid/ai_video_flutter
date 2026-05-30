import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:core_business/core_business.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/video_card.dart';
import '../../../../i18n/strings.g.dart';
import '../../../create_video/presentation/pages/create_from_template_page.dart';

/// A reusable widget to represent a section containing a category header (title, icon, "See All" button)
/// and a horizontal list of template video cards supporting all state configurations (loading, error, success).
class HomeTemplatesSectionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Resource<List<ThemeEntity>> videosState;
  final VoidCallback onSeeAllPressed;

  const HomeTemplatesSectionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
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
                  Icon(icon, color: iconColor, size: 20),
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
          success: (videos) => SizedBox(
            height: 236,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: videos.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final template = videos[index];
                return VideoCard(
                  title: template.name,
                  imageUrl: template.thumbnailUrl,
                  showPlayButton: false,
                  showVolumeIcon: false,
                  width: 158,
                  height: 236,
                  onTap: () {
                    const mockVideoUrl =
                        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
                    final videoUrl = template.resultUrl.isNotEmpty
                        ? template.resultUrl
                        : (template.sourceUrl.isNotEmpty
                            ? template.sourceUrl
                            : mockVideoUrl);
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
          ),
          empty: () => const SizedBox.shrink(),
          error: (message) => Center(
            child: Text(message, style: context.appTheme.errorTextStyle),
          ),
        ),
      ],
    );
  }
}
