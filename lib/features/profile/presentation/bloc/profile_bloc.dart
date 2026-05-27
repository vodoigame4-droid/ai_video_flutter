import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/user_video_entity.dart';
import '../../domain/usecases/get_user_videos_use_case.dart';
import '../../domain/usecases/delete_user_video_use_case.dart';
import '../../domain/usecases/update_video_progress_use_case.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserVideosUseCase getUserVideosUseCase;
  final DeleteUserVideoUseCase deleteUserVideoUseCase;
  final UpdateVideoProgressUseCase updateVideoProgressUseCase;

  Timer? _progressTimer;

  ProfileBloc({
    required this.getUserVideosUseCase,
    required this.deleteUserVideoUseCase,
    required this.updateVideoProgressUseCase,
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
    final result = await getUserVideosUseCase(NoParams());
    
    result.when(
      initial: () {},
      loading: () {},
      empty: () {},
      success: (videos) {
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

        final result = await getUserVideosUseCase(NoParams());
        result.when(
          initial: () {},
          loading: () {},
          empty: () {},
          success: (videos) {
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
        final deleteResult = await deleteUserVideoUseCase(id);
        await deleteResult.when(
          initial: () async {},
          loading: () async {},
          empty: () async {},
          success: (_) async {
            final fetchResult = await getUserVideosUseCase(NoParams());
            fetchResult.when(
              initial: () {},
              loading: () {},
              empty: () {},
              success: (videos) {
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

        bool updatedAny = false;

        for (int i = 0; i < videos.length; i++) {
          final video = videos[i];
          if (video.status == 'generating') {
            double newProgress = video.progress + 0.1;
            String newStatus = 'generating';
            if (newProgress >= 1.0) {
              newProgress = 1.0;
              newStatus = 'done';
            }
            
            await updateVideoProgressUseCase(UpdateVideoProgressParams(
              id: video.id,
              progress: newProgress,
              status: newStatus,
            ));
            
            videos[i] = video.copyWith(
              progress: newProgress,
              status: newStatus,
            );
            updatedAny = true;
          }
        }

        if (updatedAny) {
          emit(readyState.copyWith(
            videosState: Resource.success(videos),
          ));
          
          final stillGenerating = videos.any((v) => v.status == 'generating');
          if (!stillGenerating) {
            _progressTimer?.cancel();
            _progressTimer = null;
          }
        }
      },
    );
  }

  void _startProgressTimerIfNeeded(List<UserVideoEntity> videos) {
    _progressTimer?.cancel();
    _progressTimer = null;

    final hasGenerating = videos.any((v) => v.status == 'generating');
    if (hasGenerating) {
      _progressTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        add(const ProfileEvent.tickProgress());
      });
    }
  }

  @override
  Future<void> close() {
    _progressTimer?.cancel();
    return super.close();
  }
}
