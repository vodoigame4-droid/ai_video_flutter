import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import '../theme/app_colors.dart';
import '../utils/video_cache_manager.dart';
import '../utils/log_utils.dart';

class SmoothVideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final String? imageUrl;
  final BoxFit fit;
  final bool autoPlay;
  final bool loop;
  final bool showMuteButton;
  final bool showPlayPauseButton;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Player? externalPlayer;

  const SmoothVideoPlayerWidget({
    super.key,
    required this.videoUrl,
    this.imageUrl,
    this.fit = BoxFit.cover,
    this.autoPlay = true,
    this.loop = true,
    this.showMuteButton = true,
    this.showPlayPauseButton = true,
    this.width,
    this.height,
    this.borderRadius,
    this.externalPlayer,
  });

  @override
  State<SmoothVideoPlayerWidget> createState() => _SmoothVideoPlayerWidgetState();
}

class _SmoothVideoPlayerWidgetState extends State<SmoothVideoPlayerWidget> {
  late final Player _player;
  late final VideoController _controller;
  final VideoCacheManager _cacheManager = VideoCacheManager();

  bool _isLocalPlayer = false;
  bool _isPlaying = false;
  bool _isMuted = false;
  bool _isBuffering = false;
  bool _hasPlayed = false;

  StreamSubscription? _playingSub;
  StreamSubscription? _bufferingSub;
  StreamSubscription? _volumeSub;
  Timer? _bufferingTimer;

  @override
  void initState() {
    super.initState();
    _isLocalPlayer = widget.externalPlayer == null;
    _player = widget.externalPlayer ?? Player();
    _controller = VideoController(_player);

    _initPlayer();
  }

  Future<void> _initPlayer() async {
    // Listeners for sync state
    _playingSub = _player.stream.playing.listen((playing) {
      if (mounted) {
        setState(() {
          _isPlaying = playing;
          if (playing) {
            _hasPlayed = true;
          }
        });
      }
    });

    _bufferingSub = _player.stream.buffering.listen((buffering) {
      _bufferingTimer?.cancel();
      if (buffering) {
        // Debounce showing loading indicator to prevent loop flicker
        _bufferingTimer = Timer(const Duration(milliseconds: 150), () {
          if (mounted) setState(() => _isBuffering = true);
        });
      } else {
        if (mounted) setState(() => _isBuffering = false);
      }
    });

    _volumeSub = _player.stream.volume.listen((vol) {
      if (mounted) setState(() => _isMuted = vol == 0);
    });

    if (_isLocalPlayer) {
      try {
        final cachedPath = await _cacheManager.getCachedOrDownload(widget.videoUrl);
        final mediaPath = cachedPath ?? widget.videoUrl;

        if (widget.loop) {
          _player.setPlaylistMode(PlaylistMode.single);
        }
        
        _player.setVolume(widget.showMuteButton ? 0.0 : 100.0);
        await _player.open(Media(mediaPath), play: widget.autoPlay);

        // Trigger background download if not cached
        if (cachedPath == null) {
          _cacheManager.getCachedOrDownload(widget.videoUrl, waitForDownload: false);
        }
      } catch (e, stack) {
        LogUtils.e('SmoothVideoPlayerWidget: Error playing local video', error: e, stackTrace: stack);
      }
    } else {
      // Sync state from existing player
      _isPlaying = _player.state.playing;
      _isMuted = _player.state.volume == 0;
      _isBuffering = _player.state.buffering;
      if (_isPlaying) {
        _hasPlayed = true;
      }
    }
  }

  @override
  void dispose() {
    _bufferingTimer?.cancel();
    _playingSub?.cancel();
    _bufferingSub?.cancel();
    _volumeSub?.cancel();
    if (_isLocalPlayer) {
      _player.dispose();
    }
    super.dispose();
  }

  void _togglePlay() {
    _player.playOrPause();
  }

  void _toggleMute() {
    final vol = _player.state.volume;
    _player.setVolume(vol == 0 ? 100.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    Widget playerWidget = Container(
      color: AppColors.onSurface,
      child: Video(
        controller: _controller,
        fill: AppColors.black,
        fit: widget.fit,
      ),
    );

    // Apply Border Radius if specified
    if (widget.borderRadius != null) {
      playerWidget = ClipRRect(
        borderRadius: widget.borderRadius!,
        child: playerWidget,
      );
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 1. The Video View itself
          Positioned.fill(child: playerWidget),

          // 2. Poster/Thumbnail image if not playing, has not played yet, not buffering and imageUrl exists
          if (!_hasPlayed && !_isPlaying && widget.imageUrl != null && !_isBuffering)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: widget.borderRadius ?? BorderRadius.zero,
                child: Image.network(
                  widget.imageUrl!,
                  fit: widget.fit,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.onSurface,
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          color: Colors.white24,
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

          // 3. Play/Pause center toggle
          if (widget.showPlayPauseButton && (!_isPlaying || _isBuffering))
            GestureDetector(
              onTap: _togglePlay,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.black.withValues(alpha: 0.25),
                ),
                child: _isBuffering
                    ? const Padding(
                        padding: EdgeInsets.all(24.0),
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                        ),
                      )
                    : const Icon(
                        Icons.play_arrow_rounded,
                        color: AppColors.white,
                        size: 40,
                      ),
              ),
            ),

          // 4. Buffering spinner when playing but stalling
          if (_isBuffering && _isPlaying)
            const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),

          // 5. Volume toggle button (top-left)
          if (widget.showMuteButton)
            Positioned(
              top: 16,
              left: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Material(
                    color: AppColors.black.withValues(alpha: 0.1),
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: _toggleMute,
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      child: SizedBox(
                        width: 42,
                        height: 42,
                        child: Icon(
                          _isMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
                          color: AppColors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
