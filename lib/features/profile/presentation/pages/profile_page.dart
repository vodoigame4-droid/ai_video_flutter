import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/resources/resource.dart';
import '../../../../i18n/strings.g.dart';
import '../../../../features/home/presentation/widgets/video_settings_sheet.dart';
import '../../../settings/presentation/pages/settings_page.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';
import '../widgets/my_video_item_widget.dart';
import '../widgets/delete_confirm_dialog.dart';
import '../widgets/premium_banner_widget.dart';

class ProfilePage extends StatelessWidget {
  static const String path = '/profile';
  static const String name = 'profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileBloc>()..add(const ProfileEvent.init()),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  void _showSettingsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const VideoSettingsSheet(),
    );
  }

  void _showDeleteDialog(BuildContext context, String videoId) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (dialogContext) {
        return DeleteConfirmDialog(
          onCancel: () => Navigator.pop(dialogContext),
          onDelete: () {
            context.read<ProfileBloc>().add(ProfileEvent.deleteVideo(videoId));
            Navigator.pop(dialogContext);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              ready: (subTabIndex, videosState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      // Header Row: Settings (left), Profile (center), Credit Badge (right)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Settings Button
                          ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                              child: Material(
                                color: Colors.white.withValues(alpha: 0.1),
                                shape: const CircleBorder(),
                                child: InkWell(
                                  onTap: () => context.push(SettingsPage.path),
                                  child: const SizedBox(
                                    width: 36,
                                    height: 36,
                                    child: Icon(
                                      Icons.settings_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Page Title
                          Text(
                            t.profile.title,
                            style:
                                context.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ) ??
                                const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),

                          // Credit Badge/Icon Button
                          Material(
                            color: Colors.transparent,
                            shape: const CircleBorder(),
                            child: InkWell(
                              onTap: () => _showSettingsSheet(context),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                              child: Image.asset(
                                'assets/icons/ic_credit_icon.png',
                                width: 36,
                                height: 36,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Premium Upgrade Banner
                      PremiumBannerWidget(
                        onTap: () => _showSettingsSheet(context),
                      ),

                      const SizedBox(height: 16),

                      // Sub-tab Bar selectors: My Video and Liked
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                context.read<ProfileBloc>().add(
                                  const ProfileEvent.changeSubTab(0),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: subTabIndex == 0
                                          ? const Color(0xFF2BC5C5)
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  t.profile.myVideo,
                                  style: TextStyle(
                                    color: subTabIndex == 0
                                        ? const Color(0xFF24C780)
                                        : const Color(0xFFB1B1B1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                context.read<ProfileBloc>().add(
                                  const ProfileEvent.changeSubTab(1),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: subTabIndex == 1
                                          ? const Color(0xFF2BC5C5)
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  t.profile.liked,
                                  style: TextStyle(
                                    color: subTabIndex == 1
                                        ? const Color(0xFF24C780)
                                        : const Color(0xFFB1B1B1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Grid/Empty content handling
                      Expanded(
                        child: videosState.when(
                          initial: () => const SizedBox.shrink(),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          empty: () => _buildEmptyPlaceholder(t),
                          success: (videos) {
                            // Filter list based on selected sub tab
                            final filteredList = subTabIndex == 0
                                ? videos
                                : videos.where((v) => v.isLiked).toList();

                            if (filteredList.isEmpty) {
                              return _buildEmptyPlaceholder(t);
                            }

                            return GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12,
                                    childAspectRatio: 173 / 248,
                                  ),
                              itemCount: filteredList.length,
                              padding: const EdgeInsets.only(bottom: 100),
                              itemBuilder: (context, index) {
                                final video = filteredList[index];
                                return MyVideoItemWidget(
                                  video: video,
                                  onPlayTap: () {
                                    // Handle Play tap logic
                                  },
                                  onDeleteTap: () =>
                                      _showDeleteDialog(context, video.id),
                                );
                              },
                            );
                          },
                          error: (msg) => Center(
                            child: Text(
                              msg,
                              style: context.appTheme.errorTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyPlaceholder(Translations t) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_history.png',
            width: 170,
            height: 170,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 24),
          Text(
            t.profile.noVideos,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            t.profile.noVideosDesc,
            style: const TextStyle(
              color: Color(0xFFB1B1B1),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
