import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/src/core/resources/resource.dart';
import 'package:core_business/src/core/errors/failure.dart';
import 'package:core_business/src/core/utils/log_utils.dart';
import 'package:core_business/src/features/media/domain/entities/media_entities.dart';
import 'package:core_business/src/features/media/domain/usecases/get_history_usecase.dart';
import 'package:core_business/src/features/media/domain/usecases/delete_media_usecase.dart';
import 'package:core_business/src/features/media/domain/usecases/watch_history_usecase.dart';
import 'package:core_business/src/features/media/domain/usecases/watch_liked_templates_usecase.dart';
import '../../domain/entities/user_video_entity.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetHistoryUseCase getHistoryUseCase;
  final DeleteMediaUseCase deleteMediaUseCase;
  final WatchHistoryUseCase watchHistoryUseCase;
  final WatchLikedTemplatesUseCase watchLikedTemplatesUseCase;
  List<ThemeEntity> _currentLikedTemplates = const [];

  ProfileBloc({
    required this.getHistoryUseCase,
    required this.deleteMediaUseCase,
    required this.watchHistoryUseCase,
    required this.watchLikedTemplatesUseCase,
  }) : super(const ProfileState.initial()) {
    on<ProfileEvent>((event, emit) async {
      await event.when(
        init: (completer) => _onInit(completer, emit),
        changeSubTab: (subTabIndex) => _onChangeSubTab(subTabIndex, emit),
        deleteVideo: (id) => _onDeleteVideo(id, emit),
        watchLikedTemplates: () => _onWatchLikedTemplates(emit),
        watchHistory: () => _onWatchHistory(emit),
      );
    });
  }

  Future<void> _onInit(Completer<void>? completer, Emitter<ProfileState> emit) async {
    final isAlreadyInitialized = state.maybeMap(
      ready: (_) => true,
      orElse: () => false,
    );

    if (isAlreadyInitialized) {
      try {
        await getHistoryUseCase(GetHistoryParams(page: 1, take: 50));
      } finally {
        completer?.complete();
      }
      return;
    }

    emit(const ProfileState.loading());
    
    add(const ProfileEvent.watchLikedTemplates());
    add(const ProfileEvent.watchHistory());

    try {
      await getHistoryUseCase(GetHistoryParams(page: 1, take: 50));
    } finally {
      completer?.complete();
    }
  }

  Future<void> _onWatchLikedTemplates(Emitter<ProfileState> emit) async {
    await emit.forEach<List<ThemeEntity>>(
      watchLikedTemplatesUseCase(),
      onData: (templates) {
        _currentLikedTemplates = templates;
        return state.maybeMap(
          ready: (readyState) => readyState.copyWith(likedTemplates: templates),
          orElse: () => ProfileState.ready(
            subTabIndex: 0,
            videosState: const Resource.initial(),
            likedTemplates: templates,
          ),
        );
      },
    );
  }

  Future<void> _onWatchHistory(Emitter<ProfileState> emit) async {
    await emit.forEach<Resource<List<MediaEntity>>>(
      watchHistoryUseCase(),
      onData: (historyResource) {
        final isInitial = historyResource.maybeMap(
          initial: (_) => true,
          orElse: () => false,
        );

        return state.maybeMap(
          ready: (readyState) {
            final videosResource = historyResource.when(
              initial: () => const Resource<List<UserVideoEntity>>.initial(),
              loading: () => const Resource<List<UserVideoEntity>>.loading(),
              success: (data) => Resource<List<UserVideoEntity>>.success(
                data.map((e) => _mapMediaToUserVideo(e)).toList(),
              ),
              empty: () => const Resource<List<UserVideoEntity>>.success([]),
              error: (failure) => Resource<List<UserVideoEntity>>.error(failure),
            );
            return readyState.copyWith(videosState: videosResource);
          },
          orElse: () {
            if (isInitial) {
              return state;
            }
            final videosResource = historyResource.when(
              initial: () => const Resource<List<UserVideoEntity>>.initial(),
              loading: () => const Resource<List<UserVideoEntity>>.loading(),
              success: (data) => Resource<List<UserVideoEntity>>.success(
                data.map((e) => _mapMediaToUserVideo(e)).toList(),
              ),
              empty: () => const Resource<List<UserVideoEntity>>.success([]),
              error: (failure) => Resource<List<UserVideoEntity>>.error(failure),
            );
            return ProfileState.ready(
              subTabIndex: 0,
              videosState: videosResource,
              likedTemplates: _currentLikedTemplates,
            );
          },
        );
      },
    );
  }

  Future<void> _onChangeSubTab(int subTabIndex, Emitter<ProfileState> emit) async {
    await state.mapOrNull(
      ready: (readyState) async {
        emit(readyState.copyWith(
          subTabIndex: subTabIndex,
        ));
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
            unawaited(getHistoryUseCase(GetHistoryParams(page: 1, take: 50)));
          },
          error: (failure) async {
            emit(readyState.copyWith(
              videosState: Resource.error(failure),
            ));
          },
        );
      },
    );
  }

  UserVideoEntity _mapMediaToUserVideo(MediaEntity media) {
    final statusLower = media.status.toLowerCase();
    final isDone = statusLower == 'completed' ||
        statusLower == 'done' ||
        statusLower == 'failed' ||
        media.resultUrl != null;
    
    return UserVideoEntity(
      id: media.id,
      title: media.name,
      imageUrl: media.imageUrl,
      videoUrl: media.resultUrl ?? '',
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
    return super.close();
  }
}
