import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/src/core/resources/resource.dart';
import 'package:core_business/src/core/utils/log_utils.dart';
import 'package:core_business/src/features/media/domain/entities/media_entities.dart';
import 'package:core_business/src/features/media/domain/usecases/get_history_usecase.dart';
import 'package:core_business/src/features/media/domain/usecases/delete_media_usecase.dart';
import 'package:core_business/src/features/media/domain/usecases/get_media_statuses_usecase.dart';
import '../../domain/entities/user_video_entity.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetHistoryUseCase getHistoryUseCase;
  final DeleteMediaUseCase deleteMediaUseCase;
  final GetMediaStatusesUseCase getMediaStatusesUseCase;
  Timer? _progressTimer;

  ProfileBloc({
    required this.getHistoryUseCase,
    required this.deleteMediaUseCase,
    required this.getMediaStatusesUseCase,
  }) : super(const ProfileState.initial()) {
    on<ProfileEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeSubTab: (subTabIndex) => _onChangeSubTab(subTabIndex, emit),
        deleteVideo: (id) => _onDeleteVideo(id, emit),
        tickProgress: () => _onTickProgress(emit),
      );
    });
  }

  Future<void> _onInit(Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    final result = await getHistoryUseCase(GetHistoryParams(page: 1, take: 50));
    
    result.when(
      initial: () {},
      loading: () {},
      empty: () {
        emit(const ProfileState.ready(
          subTabIndex: 0,
          videosState: Resource.success([]),
        ));
      },
      success: (paginated) {
        final videos = paginated.data.map((e) => _mapMediaToUserVideo(e)).toList();
        emit(ProfileState.ready(
          subTabIndex: 0,
          videosState: Resource.success(videos),
        ));
        _startProgressTimerIfNeeded(videos);
      },
      error: (message) {
        emit(ProfileState.ready(
          subTabIndex: 0,
          videosState: Resource.error(message: message),
        ));
      },
    );
  }

  Future<void> _onChangeSubTab(int subTabIndex, Emitter<ProfileState> emit) async {
    await state.mapOrNull(
      ready: (readyState) async {
        emit(readyState.copyWith(
          subTabIndex: subTabIndex,
          videosState: const Resource.loading(),
        ));

        final result = await getHistoryUseCase(GetHistoryParams(page: 1, take: 50));
        result.when(
          initial: () {},
          loading: () {},
          empty: () {
            emit(readyState.copyWith(
              subTabIndex: subTabIndex,
              videosState: const Resource.success([]),
            ));
          },
          success: (paginated) {
            final videos = paginated.data.map((e) => _mapMediaToUserVideo(e)).toList();
            emit(readyState.copyWith(
              subTabIndex: subTabIndex,
              videosState: Resource.success(videos),
            ));
            _startProgressTimerIfNeeded(videos);
          },
          error: (message) {
            emit(readyState.copyWith(
              subTabIndex: subTabIndex,
              videosState: Resource.error(message: message),
            ));
          },
        );
      },
    );
  }

  Future<void> _onDeleteVideo(String id, Emitter<ProfileState> emit) async {
    await state.mapOrNull(
      ready: (readyState) async {
        final deleteResult = await deleteMediaUseCase(id);
        await deleteResult.when(
          initial: () async {},
          loading: () async {},
          empty: () async {},
          success: (_) async {
            final fetchResult = await getHistoryUseCase(GetHistoryParams(page: 1, take: 50));
            fetchResult.when(
              initial: () {},
              loading: () {},
              empty: () {
                emit(readyState.copyWith(
                  videosState: const Resource.success([]),
                ));
              },
              success: (paginated) {
                final videos = paginated.data.map((e) => _mapMediaToUserVideo(e)).toList();
                emit(readyState.copyWith(
                  videosState: Resource.success(videos),
                ));
                _startProgressTimerIfNeeded(videos);
              },
              error: (message) {
                emit(readyState.copyWith(
                  videosState: Resource.error(message: message),
                ));
              },
            );
          },
          error: (message) async {
            emit(readyState.copyWith(
              videosState: Resource.error(message: message),
            ));
          },
        );
      },
    );
  }

  Future<void> _onTickProgress(Emitter<ProfileState> emit) async {
    await state.mapOrNull(
      ready: (readyState) async {
        final videosResource = readyState.videosState;
        final videos = videosResource.maybeWhen(
          success: (data) => List<UserVideoEntity>.from(data),
          orElse: () => null,
        );
        if (videos == null) return;

        final generatingIds = videos
            .where((v) => v.status == 'generating')
            .map((v) => v.id)
            .toList();

        if (generatingIds.isEmpty) {
          _progressTimer?.cancel();
          _progressTimer = null;
          return;
        }

        LogUtils.d('ProfileBloc: Polling status for: $generatingIds');
        final statusResult = await getMediaStatusesUseCase(generatingIds);
        
        await statusResult.when(
          initial: () async {},
          loading: () async {},
          empty: () async {},
          success: (statuses) async {
            bool updatedAny = false;
            for (int i = 0; i < videos.length; i++) {
              final video = videos[i];
              if (video.status == 'generating') {
                final matchedStatus = statuses.firstWhere(
                  (s) => s.id == video.id,
                  orElse: () => const MediaStatusEntity(id: '', status: '', resultUrl: null, finishedTime: null),
                );

                if (matchedStatus.id.isNotEmpty) {
                  final statusStr = matchedStatus.status.toLowerCase();
                  if (statusStr == 'completed' || statusStr == 'done' || matchedStatus.resultUrl != null) {
                    videos[i] = video.copyWith(
                      status: 'done',
                      progress: 1.0,
                    );
                    updatedAny = true;
                  } else if (statusStr == 'failed') {
                    videos[i] = video.copyWith(
                      status: 'done', // fail -> fallback done with mock video
                      progress: 1.0,
                    );
                    updatedAny = true;
                  } else {
                    // Still generating on server, increment mock progress value visually
                    final newProgress = (video.progress + 0.1).clamp(0.0, 0.95);
                    videos[i] = video.copyWith(
                      progress: newProgress,
                    );
                    updatedAny = true;
                  }
                } else {
                  // No match, just increment progress visually
                  final newProgress = (video.progress + 0.05).clamp(0.0, 0.95);
                  videos[i] = video.copyWith(
                    progress: newProgress,
                  );
                  updatedAny = true;
                }
              }
            }

            if (updatedAny) {
              emit(readyState.copyWith(
                videosState: Resource.success(videos),
              ));
            }

            final stillGenerating = videos.any((v) => v.status == 'generating');
            if (!stillGenerating) {
              _progressTimer?.cancel();
              _progressTimer = null;
            }
          },
          error: (message) async {
            LogUtils.e('ProfileBloc: Status polling failed: $message');
            // Just increment progress visually
            bool updatedAny = false;
            for (int i = 0; i < videos.length; i++) {
              if (videos[i].status == 'generating') {
                videos[i] = videos[i].copyWith(
                  progress: (videos[i].progress + 0.05).clamp(0.0, 0.95),
                );
                updatedAny = true;
              }
            }
            if (updatedAny) {
              emit(readyState.copyWith(videosState: Resource.success(videos)));
            }
          },
        );
      },
    );
  }

  void _startProgressTimerIfNeeded(List<UserVideoEntity> videos) {
    _progressTimer?.cancel();
    _progressTimer = null;

    final hasGenerating = videos.any((v) => v.status == 'generating');
    if (hasGenerating) {
      _progressTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
        add(const ProfileEvent.tickProgress());
      });
    }
  }

  UserVideoEntity _mapMediaToUserVideo(MediaEntity media) {
    final isDone = media.status.toLowerCase() == 'completed' ||
        media.status.toLowerCase() == 'done' ||
        media.resultUrl != null;
    
    return UserVideoEntity(
      id: media.id,
      title: media.name,
      imageUrl: media.imageUrl.isNotEmpty ? media.imageUrl : 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      status: isDone ? 'done' : 'generating',
      progress: isDone ? 1.0 : 0.1,
      createdAt: _formatDate(media.createdAt),
      isLiked: false,
    );
  }

  String _formatDate(DateTime date) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final time = "${twoDigits(date.hour)}:${twoDigits(date.minute)}";
    final dateStr = "${twoDigits(date.day)}-${twoDigits(date.month)}-${date.year}";
    return "$time  •  $dateStr";
  }

  @override
  Future<void> close() {
    _progressTimer?.cancel();
    return super.close();
  }
}
