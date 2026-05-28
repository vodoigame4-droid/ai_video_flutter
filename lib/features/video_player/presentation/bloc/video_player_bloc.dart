import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import '../../../../core/utils/video_cache_manager.dart';
import '../../../../core/utils/log_utils.dart';
import 'video_player_event.dart';
import 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  final Player player = Player();
  final VideoCacheManager _cacheManager = VideoCacheManager();
  
  StreamSubscription? _positionSub;
  StreamSubscription? _durationSub;
  StreamSubscription? _bufferingSub;
  StreamSubscription? _playingSub;

  VideoPlayerBloc() : super(const VideoPlayerState.initial()) {
    on<VideoPlayerEvent>((event, emit) async {
      await event.when(
        init: (url) async => await _onInit(url, emit),
        togglePlay: () async => _onTogglePlay(emit),
        toggleMute: () async => _onToggleMute(emit),
        seek: (position) async => _onSeek(position, emit),
        updatePosition: (position) async => _onUpdatePosition(position, emit),
        updateDuration: (duration) async => _onUpdateDuration(duration, emit),
        updateBuffering: (isBuffering) async => _onUpdateBuffering(isBuffering, emit),
      );
    });
  }

  Future<void> _onInit(String url, Emitter<VideoPlayerState> emit) async {
    LogUtils.d('VideoPlayerBloc: Init with url: $url');
    emit(const VideoPlayerState.loading());

    try {
      // 1. Check offline cache
      final cachedPath = await _cacheManager.getCachedOrDownload(url);
      final mediaPath = cachedPath ?? url;

      // 2. Setup listeners
      _positionSub = player.stream.position.listen((pos) {
        add(VideoPlayerEvent.updatePosition(pos));
      });
      _durationSub = player.stream.duration.listen((dur) {
        add(VideoPlayerEvent.updateDuration(dur));
      });
      _bufferingSub = player.stream.buffering.listen((buf) {
        add(VideoPlayerEvent.updateBuffering(buf));
      });
      
      // Open and auto-play
      await player.open(Media(mediaPath));
      player.setPlaylistMode(PlaylistMode.loop);
      
      emit(VideoPlayerState.ready(
        videoPath: mediaPath,
        isPlaying: true,
        isMuted: player.state.volume == 0,
        isBuffering: player.state.buffering,
        position: player.state.position,
        duration: player.state.duration,
      ));

      // Trigger download if not cached, so next time it loads locally
      if (cachedPath == null) {
        _cacheManager.getCachedOrDownload(url, waitForDownload: false);
      }
    } catch (e, stack) {
      LogUtils.e('VideoPlayerBloc: Failed to initialize player', error: e, stackTrace: stack);
      emit(const VideoPlayerState.error(message: 'Error playing video'));
    }
  }

  void _onTogglePlay(Emitter<VideoPlayerState> emit) {
    player.playOrPause();
    state.mapOrNull(
      ready: (s) => emit(s.copyWith(isPlaying: !s.isPlaying)),
    );
  }

  void _onToggleMute(Emitter<VideoPlayerState> emit) {
    state.mapOrNull(
      ready: (s) {
        final newMuted = !s.isMuted;
        player.setVolume(newMuted ? 0.0 : 100.0);
        emit(s.copyWith(isMuted: newMuted));
      },
    );
  }

  void _onSeek(Duration position, Emitter<VideoPlayerState> emit) {
    player.seek(position);
  }

  void _onUpdatePosition(Duration position, Emitter<VideoPlayerState> emit) {
    state.mapOrNull(
      ready: (s) => emit(s.copyWith(position: position)),
    );
  }

  void _onUpdateDuration(Duration duration, Emitter<VideoPlayerState> emit) {
    state.mapOrNull(
      ready: (s) => emit(s.copyWith(duration: duration)),
    );
  }

  void _onUpdateBuffering(bool isBuffering, Emitter<VideoPlayerState> emit) {
    state.mapOrNull(
      ready: (s) => emit(s.copyWith(isBuffering: isBuffering)),
    );
  }

  @override
  Future<void> close() {
    _positionSub?.cancel();
    _durationSub?.cancel();
    _bufferingSub?.cancel();
    _playingSub?.cancel();
    player.dispose();
    return super.close();
  }
}
