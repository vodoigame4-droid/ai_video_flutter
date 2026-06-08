import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:core_business/src/core/utils/log_utils.dart';
import 'package:core_business/src/core/resources/resource.dart';
import 'package:core_business/src/core/errors/failure.dart';
import 'package:core_business/src/core/utils/video_cache_manager.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../auth/domain/usecases/watch_profile_usecase.dart';
import '../../../../auth/domain/usecases/get_profile_usecase.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../domain/usecases/delete_media_usecase.dart';
import '../../../domain/usecases/download_video_usecase.dart';
import '../../../domain/usecases/share_video_usecase.dart';
import 'result_event.dart';
import 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final DeleteMediaUseCase deleteMediaUseCase;
  final DownloadVideoUseCase downloadVideoUseCase;
  final ShareVideoUseCase shareVideoUseCase;
  final WatchProfileUseCase watchProfileUseCase;
  final GetProfileUseCase getProfileUseCase;
  final Player player = Player(
    configuration: const PlayerConfiguration(
      logLevel: MPVLogLevel.debug,
    ),
  );
  final VideoCacheManager _cacheManager = VideoCacheManager();

  StreamSubscription? _bufferingSub;
  StreamSubscription? _playingSub;
  StreamSubscription? _logSub;
  StreamSubscription? _errorSub;
  StreamSubscription? _profileSubscription;
  Timer? _bufferingTimer;

  static const List<String> _presetPrompts = [
    "Realistic female portrait, close-up, looking at camera, blinking naturally, blue studio lighting, cinematic, ultra detailed",
    "Neon lit cyberpunk street, rainy night, reflections on puddles, drone shot flying through skyscrapers, futuristic city vibe",
    "Fantasy forest with glowing mushrooms, majestic waterfall in the background, sunlight filtering through ancient trees, ethereal style",
    "Cute fluffy orange cat wearing spacesuit on the moon, looking at Earth, cartoon 3d style, highly detailed"
  ];

  ResultBloc({
    required this.deleteMediaUseCase,
    required this.downloadVideoUseCase,
    required this.shareVideoUseCase,
    required this.watchProfileUseCase,
    required this.getProfileUseCase,
  }) : super(const ResultState.initial()) {
    on<ResultEvent>((event, emit) async {
      await event.when(
        init: (videoId, title, imageUrl, videoUrl, createdAt) async {
          await _onInit(videoId, title, imageUrl, videoUrl, createdAt, emit);
        },
        togglePlay: () async {
          _onTogglePlay(emit);
        },
        toggleMute: () async {
          _onToggleMute(emit);
        },
        updatePlaying: (isPlaying) async {
          _onUpdatePlaying(isPlaying, emit);
        },
        updateBuffering: (isBuffering) async {
          _onUpdateBuffering(isBuffering, emit);
        },
        changeExtendPrompt: (prompt) async {
          _onChangeExtendPrompt(prompt, emit);
        },
        clearExtendPrompt: () async {
          _onClearExtendPrompt(emit);
        },
        useInspireMe: () async {
          _onUseInspireMe(emit);
        },
        changeExtendQuality: (quality) async {
          _onChangeExtendQuality(quality, emit);
        },
        changeExtendDuration: (duration) async {
          _onChangeExtendDuration(duration, emit);
        },
        deleteVideo: () async {
          await _onDeleteVideo(emit);
        },
        downloadVideo: () async {
          await _onDownloadVideo(emit);
        },
        shareVideo: () async {
          await _onShareVideo(emit);
        },
        resetDownloadShareStatus: () async {
          _onResetDownloadShareStatus(emit);
        },
        profileUpdated: (user) async {
          _onProfileUpdated(user, emit);
        },
      );
    });
  }

  Future<void> _onInit(
    String videoId,
    String title,
    String? imageUrl,
    String videoUrl,
    String createdAt,
    Emitter<ResultState> emit,
  ) async {
    LogUtils.d('ResultBloc: Init with url: $videoUrl');

    _profileSubscription?.cancel();
    _profileSubscription = watchProfileUseCase().listen(
      (user) => add(ResultEvent.profileUpdated(user)),
    );

    final initialIsVip = watchProfileUseCase.cachedUser?.isVip ?? false;
    final initialInspireMeCount = watchProfileUseCase.cachedUser?.freeSuggestions ?? 3;
    
    // Emit ready immediately so the VideoController attaches before player.open() runs
    emit(ResultState.ready(
      videoId: videoId,
      title: title,
      imageUrl: imageUrl,
      videoUrl: videoUrl,
      createdAt: createdAt,
      isPlaying: true,
      isMuted: false,
      isBuffering: true,
      isVip: initialIsVip,
      inspireMeCount: initialInspireMeCount,
    ));

    try {
      // 1. Check offline cache
      final cachedPath = await _cacheManager.getCachedOrDownload(videoUrl);
      final mediaSource = (cachedPath != null) ? Uri.file(cachedPath).toString() : videoUrl;

      if (cachedPath != null) {
        try {
          final file = File(cachedPath);
          if (await file.exists()) {
            final size = await file.length();
            LogUtils.d('ResultBloc: Cache file exists at $cachedPath, size: $size bytes');
          } else {
            LogUtils.w('ResultBloc: Cache file path returned but file does not exist at $cachedPath');
          }
        } catch (e) {
          LogUtils.e('ResultBloc: Error checking cache file status', error: e);
        }
      }

      LogUtils.d('ResultBloc: Opening media source: $mediaSource');

      // Setup log & error listeners for debugging
      _logSub = player.stream.log.listen((event) {
        LogUtils.d('media_kit debug log: [${event.prefix}] ${event.text}');
      });
      _errorSub = player.stream.error.listen((err) {
        LogUtils.e('media_kit error stream: $err');
      });

      // 2. Setup listeners with a small debounce on buffering to prevent loop flicker
      _bufferingSub = player.stream.buffering.listen((buf) {
        _bufferingTimer?.cancel();
        if (buf) {
          _bufferingTimer = Timer(const Duration(milliseconds: 150), () {
            if (!isClosed) add(ResultEvent.updateBuffering(true));
          });
        } else {
          if (!isClosed) add(ResultEvent.updateBuffering(false));
        }
      });
      _playingSub = player.stream.playing.listen((playing) {
        if (!isClosed) add(ResultEvent.updatePlaying(playing));
      });

      player.setVolume(100.0);
      await player.open(Media(mediaSource), play: true);
      player.setPlaylistMode(PlaylistMode.single);
      player.play();

      emit(ResultState.ready(
        videoId: videoId,
        title: title,
        imageUrl: imageUrl,
        videoUrl: videoUrl,
        createdAt: createdAt,
        isPlaying: true,
        isMuted: false,
        isBuffering: player.state.buffering,
        isVip: initialIsVip,
        inspireMeCount: initialInspireMeCount,
      ));

      // Trigger download if not cached, so next time it loads locally
      if (cachedPath == null) {
        _cacheManager.getCachedOrDownload(videoUrl, waitForDownload: false);
      }
    } catch (e, stack) {
      LogUtils.e('ResultBloc: Failed to initialize player', error: e, stackTrace: stack);
      emit(const ResultState.error(message: 'Error playing video'));
    }
  }

  void _onTogglePlay(Emitter<ResultState> emit) {
    player.playOrPause();
    state.mapOrNull(
      ready: (s) => emit(s.copyWith(isPlaying: !s.isPlaying)),
    );
  }

  void _onToggleMute(Emitter<ResultState> emit) {
    state.mapOrNull(
      ready: (s) {
        final newMuted = !s.isMuted;
        player.setVolume(newMuted ? 0.0 : 100.0);
        emit(s.copyWith(isMuted: newMuted));
      },
    );
  }

  void _onUpdatePlaying(bool isPlaying, Emitter<ResultState> emit) {
    state.mapOrNull(
      ready: (s) => emit(s.copyWith(isPlaying: isPlaying)),
    );
  }

  void _onUpdateBuffering(bool isBuffering, Emitter<ResultState> emit) {
    state.mapOrNull(
      ready: (s) => emit(s.copyWith(isBuffering: isBuffering)),
    );
  }

  void _onChangeExtendPrompt(String prompt, Emitter<ResultState> emit) {
    state.mapOrNull(
      ready: (s) => emit(s.copyWith(extendPrompt: prompt)),
    );
  }

  void _onClearExtendPrompt(Emitter<ResultState> emit) {
    state.mapOrNull(
      ready: (s) => emit(s.copyWith(extendPrompt: "")),
    );
  }

  void _onUseInspireMe(Emitter<ResultState> emit) {
    state.mapOrNull(
      ready: (s) {
        if (!s.isVip && s.inspireMeCount <= 0) return;
        final currentCount = s.inspireMeCount;
        final promptIndex = (3 - currentCount) % _presetPrompts.length;
        final selectedPrompt = _presetPrompts[promptIndex];
        emit(s.copyWith(
          extendPrompt: selectedPrompt,
          inspireMeCount: s.isVip ? currentCount : currentCount - 1,
        ));

        if (!s.isVip) {
          getProfileUseCase(NoParams());
        }
      },
    );
  }

  void _onProfileUpdated(UserEntity user, Emitter<ResultState> emit) {
    state.mapOrNull(
      ready: (s) {
        emit(s.copyWith(
          isVip: user.isVip,
          inspireMeCount: user.freeSuggestions,
        ));
      },
    );
  }

  void _onChangeExtendQuality(String quality, Emitter<ResultState> emit) {
    state.mapOrNull(
      ready: (s) => emit(s.copyWith(extendQuality: quality)),
    );
  }

  void _onChangeExtendDuration(String duration, Emitter<ResultState> emit) {
    state.mapOrNull(
      ready: (s) => emit(s.copyWith(extendDuration: duration)),
    );
  }

  Future<void> _onDeleteVideo(Emitter<ResultState> emit) async {
    await state.mapOrNull(
      ready: (s) async {
        LogUtils.d('ResultBloc: Deleting video with id ${s.videoId}');
        final result = await deleteMediaUseCase(s.videoId);
        result.when(
          initial: () {},
          loading: () {},
          empty: () {},
          success: (_) {
            emit(s.copyWith(isDeleted: true));
          },
          error: (failure) {
            LogUtils.e('ResultBloc: Failed to delete video: ${failure.toErrorCodeOrMessage()}');
          },
        );
      },
    );
  }

  Future<void> _onDownloadVideo(Emitter<ResultState> emit) async {
    await state.mapOrNull(
      ready: (s) async {
        if (s.isDownloading) return;
        emit(s.copyWith(
          isDownloading: true,
          downloadErrorMessage: null,
          downloadSuccess: false,
        ));
        
        final result = await downloadVideoUseCase(s.videoUrl);
        result.when(
          initial: () {},
          loading: () {},
          empty: () {},
          success: (_) {
            emit(s.copyWith(
              isDownloading: false,
              downloadSuccess: true,
            ));
          },
          error: (failure) {
            emit(s.copyWith(
              isDownloading: false,
              downloadErrorMessage: failure.toErrorCodeOrMessage(),
              downloadSuccess: false,
            ));
          },
        );
      },
    );
  }

  Future<void> _onShareVideo(Emitter<ResultState> emit) async {
    await state.mapOrNull(
      ready: (s) async {
        if (s.isSharing) return;
        emit(s.copyWith(
          isSharing: true,
          shareErrorMessage: null,
          shareSuccess: false,
        ));
        
        final result = await shareVideoUseCase(
          ShareVideoParams(videoUrl: s.videoUrl, title: s.title),
        );
        result.when(
          initial: () {},
          loading: () {},
          empty: () {},
          success: (_) {
            emit(s.copyWith(
              isSharing: false,
              shareSuccess: true,
            ));
          },
          error: (failure) {
            emit(s.copyWith(
              isSharing: false,
              shareErrorMessage: failure.toErrorCodeOrMessage(),
              shareSuccess: false,
            ));
          },
        );
      },
    );
  }

  void _onResetDownloadShareStatus(Emitter<ResultState> emit) {
    state.mapOrNull(
      ready: (s) {
        emit(s.copyWith(
          downloadErrorMessage: null,
          shareErrorMessage: null,
          downloadSuccess: false,
          shareSuccess: false,
        ));
      },
    );
  }

  @override
  Future<void> close() {
    _profileSubscription?.cancel();
    _bufferingTimer?.cancel();
    _bufferingSub?.cancel();
    _playingSub?.cancel();
    _logSub?.cancel();
    _errorSub?.cancel();
    player.dispose();
    return super.close();
  }
}
