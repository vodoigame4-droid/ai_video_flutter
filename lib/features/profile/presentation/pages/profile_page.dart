import 'package:ai_video_flutter/features/premium/presentation/pages/iap_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/errors/backend_error_handler.dart';
import 'package:core_business/core_business.dart';
import '../../../../i18n/strings.g.dart';
import '../../../settings/presentation/pages/settings_page.dart';
import '../../../premium/presentation/pages/paywall_video_page.dart';
import '../../../create_video/presentation/pages/result_page.dart';
import '../../../dashboard/presentation/bloc/dashboard_bloc.dart';
import '../../../dashboard/presentation/bloc/dashboard_state.dart';
import '../widgets/my_video_item_widget.dart';
import '../widgets/delete_confirm_dialog.dart';
import '../widgets/premium_banner_widget.dart';
import '../widgets/liked_template_item_widget.dart';
import '../../../create_video/presentation/pages/create_from_template_page.dart';

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

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      final bloc = context.read<ProfileBloc>();
      bloc.state.mapOrNull(
        ready: (readyState) {
          if (readyState.subTabIndex != _tabController.index) {
            bloc.add(ProfileEvent.changeSubTab(_tabController.index));
          }
        },
      );
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      LogUtils.d('ProfileView: App lifecycle changed to $state. Stopping status polling.');
      context.read<ProfileBloc>().add(const ProfileEvent.stopPolling());
    } else if (state == AppLifecycleState.resumed) {
      LogUtils.d('ProfileView: App lifecycle changed to resumed. Restarting polling/refresh.');
      context.read<ProfileBloc>().add(const ProfileEvent.init());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
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
        child: MultiBlocListener(
          listeners: [
            BlocListener<DashboardBloc, DashboardState>(
              listener: (context, dashboardState) {
                dashboardState.mapOrNull(
                  currentTab: (tabState) {
                    if (tabState.index != 1) {
                      context.read<ProfileBloc>().add(const ProfileEvent.stopPolling());
                    }
                  },
                );
              },
            ),
            BlocListener<ProfileBloc, ProfileState>(
              listener: (context, profileState) {
                profileState.mapOrNull(
                  ready: (readyState) {
                    if (_tabController.index != readyState.subTabIndex) {
                      _tabController.animateTo(readyState.subTabIndex);
                    }
                  },
                );
              },
            ),
          ],
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                ready: (subTabIndex, videosState, likedTemplates) {
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
                            Material(
                              color: Colors.white.withValues(alpha: 0.1),
                              shape: const CircleBorder(),
                              child: InkWell(
                                onTap: () => context.push(SettingsPage.path),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
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
                                onTap: () {
                                  final videosList = videosState.maybeWhen(
                                    success: (list) => list,
                                    orElse: () => const [],
                                  );
                                  final videoUrl = videosList.isNotEmpty
                                      ? videosList.first.videoUrl
                                      : (likedTemplates.isNotEmpty ? likedTemplates.first.sourceUrl : '');
                                  context.push('${PaywallVideoPage.path}?videoUrl=${Uri.encodeComponent(videoUrl)}');
                                },
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
                          onTap: () {
                            final videosList = videosState.maybeWhen(
                              success: (list) => list,
                              orElse: () => const [],
                            );
                            final videoUrl = videosList.isNotEmpty
                                ? videosList.first.videoUrl
                                : (likedTemplates.isNotEmpty ? likedTemplates.first.sourceUrl : '');
                            context.push('${IapPage.path}?videoUrl=${Uri.encodeComponent(videoUrl)}');
                          },
                        ),

                        const SizedBox(height: 16),

                        // TabBar selection: My Video and Liked
                        TabBar(
                          controller: _tabController,
                          indicatorColor: const Color(0xFF2BC5C5),
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerHeight: 0,
                          labelColor: const Color(0xFF24C780),
                          unselectedLabelColor: const Color(0xFFB1B1B1),
                          labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          tabs: [
                            Tab(text: t.profile.myVideo),
                            Tab(text: t.profile.liked),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // TabBarView for smooth page swiping
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              // My Video Tab (with pull-to-refresh)
                              RefreshIndicator(
                                onRefresh: () async {
                                  final future = context.read<ProfileBloc>().stream.firstWhere((state) => state.maybeMap(
                                    ready: (s) => s.videosState.maybeMap(loading: (_) => false, orElse: () => true),
                                    orElse: () => false,
                                  ));
                                  context.read<ProfileBloc>().add(const ProfileEvent.init());
                                  await future;
                                },
                                child: videosState.when(
                                  initial: () => const SizedBox.shrink(),
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  empty: () => _buildEmptyPlaceholder(t),
                                  success: (videos) {
                                    if (videos.isEmpty) {
                                      return _buildEmptyPlaceholder(t);
                                    }
                                    return GridView.builder(
                                      physics: const AlwaysScrollableScrollPhysics(
                                        parent: BouncingScrollPhysics(),
                                      ),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 12,
                                        crossAxisSpacing: 12,
                                        childAspectRatio: 173 / 248,
                                      ),
                                      itemCount: videos.length,
                                      padding: const EdgeInsets.only(bottom: 100),
                                      itemBuilder: (context, index) {
                                        final video = videos[index];
                                        return MyVideoItemWidget(
                                          video: video,
                                          onPlayTap: () {
                                            ResultPage.push(
                                              context,
                                              ResultPageArgs(
                                                videoId: video.id,
                                                title: video.title,
                                                imageUrl: video.imageUrl,
                                                videoUrl: video.videoUrl,
                                                createdAt: video.createdAt,
                                              ),
                                            );
                                          },
                                          onDeleteTap: () =>
                                              _showDeleteDialog(context, video.id),
                                        );
                                      },
                                    );
                                  },
                                  error: (failure) => Center(
                                    child: Text(
                                      BackendErrorHelper.getErrorMessage(context, failure.toErrorCodeOrMessage()),
                                      style: context.appTheme.errorTextStyle,
                                    ),
                                  ),
                                ),
                              ),

                              // Liked Tab
                              likedTemplates.isEmpty
                                  ? _buildEmptyPlaceholder(t)
                                  : GridView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 12,
                                        crossAxisSpacing: 12,
                                        childAspectRatio: 173 / 248,
                                      ),
                                      itemCount: likedTemplates.length,
                                      padding: const EdgeInsets.only(bottom: 100),
                                      itemBuilder: (context, index) {
                                        final template = likedTemplates[index];
                                        return LikedTemplateItemWidget(
                                          template: template,
                                          onTap: () {
                                            context.pushNamed(
                                              CreateFromTemplatePage.name,
                                              queryParameters: {
                                                'templateId': template.id,
                                                'title': template.name,
                                                'videoUrl': template.sourceUrl,
                                                'imageUrl': template.thumbnailUrl,
                                                'themeType': template.type,
                                                'themeOrgId': template.orgId.toString(),
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                            ],
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
      ),
    );
  }

  Widget _buildEmptyPlaceholder(Translations t) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: Container(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            alignment: Alignment.center,
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
          ),
        );
      },
    );
  }
}
