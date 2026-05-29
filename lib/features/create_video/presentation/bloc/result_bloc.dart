import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/resources/resource.dart';
import '../../../../core/utils/video_cache_manager.dart';
import '../../../profile/domain/usecases/delete_user_video_use_case.dart';
import 'result_event.dart';
import 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final DeleteUserVideoUseCase deleteUserVideoUseCase;
  final Player player = Player();
  final VideoCacheManager _cacheManager = VideoCacheManager();

  StreamSubscription? _bufferingSub;
  StreamSubscription? _playingSub;
  Timer? _bufferingTimer;

  static const List<String> _presetPrompts = [
    "Realistic female portrait, close-up, looking at camera, blinking naturally, blue studio lighting, cinematic, ultra detailed",
    "Neon lit cyberpunk street, rainy night, reflections on puddles, drone shot flying through skyscrapers, futuristic city vibe",
    "Fantasy forest with glowing mushrooms, majestic waterfall in the background, sunlight filtering through ancient trees, ethereal style",
    "Cute fluffy orange cat wearing spacesuit on the moon, looking at Earth, cartoon 3d style, highly detailed"
  ];

  ResultBloc({required this.deleteUserVideoUseCase}) : super(const ResultState.initial()) {
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
    emit(const ResultState.loading());

    try {
      // 1. Check offline cache
      final cachedPath = await _cacheManager.getCachedOrDownload(videoUrl);
      final mediaPath = cachedPath ?? videoUrl;

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
      await player.open(Media(mediaPath), play: true);
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
        if (s.inspireMeCount <= 0) return;
        final currentCount = s.inspireMeCount;
        final promptIndex = (3 - currentCount) % _presetPrompts.length;
        final selectedPrompt = _presetPrompts[promptIndex];
        emit(s.copyWith(
          extendPrompt: selectedPrompt,
          inspireMeCount: currentCount - 1,
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
        final result = await deleteUserVideoUseCase(s.videoId);
        await result.when(
          initial: () async {},
          loading: () async {},
          empty: () async {},
          success: (data) async {
            emit(s.copyWith(isDeleted: true));
          },
          error: (message) async {
            LogUtils.e('ResultBloc: Failed to delete video: $message');
          },
        );
      },
    );
  }

  @override
  Future<void> close() {
    _bufferingTimer?.cancel();
    _bufferingSub?.cancel();
    _playingSub?.cancel();
    player.dispose();
    return super.close();
  }
}
