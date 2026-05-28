import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import '../../../../core/utils/log_utils.dart';
import 'result_event.dart';
import 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final Player player = Player();

  StreamSubscription? _bufferingSub;
  StreamSubscription? _playingSub;

  ResultBloc() : super(const ResultState.initial()) {
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
      // Setup listeners
      _bufferingSub = player.stream.buffering.listen((buf) {
        if (!isClosed) add(ResultEvent.updateBuffering(buf));
      });
      _playingSub = player.stream.playing.listen((playing) {
        if (!isClosed) add(ResultEvent.updatePlaying(playing));
      });

      // Open and start muted by default (standard video preview UX) or unmuted.
      // Let's start with volume 100 or 0? The figma shows loudspeaker unmuted/muted toggle.
      // Let's start muted, so user can unmute if they want, or start unmuted since they just generated it.
      // Let's start unmuted (100).
      player.setVolume(100.0);
      await player.open(Media(videoUrl));
      player.setPlaylistMode(PlaylistMode.loop);

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

  @override
  Future<void> close() {
    _bufferingSub?.cancel();
    _playingSub?.cancel();
    player.dispose();
    return super.close();
  }
}
