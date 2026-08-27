import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import '../theme/app_colors.dart';
import '../utils/video_cache_manager.dart';
import '../utils/log_utils.dart';
import 'app_image.dart';

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
  final bool playMuted;
  final Alignment? alignment;
  final bool showBufferingIndicator;

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
    this.playMuted = false,
    this.alignment,
    this.showBufferingIndicator = true,
  });

  @override
  State<SmoothVideoPlayerWidget> createState() =>
      _SmoothVideoPlayerWidgetState();
}

class _SmoothVideoPlayerWidgetState extends State<SmoothVideoPlayerWidget> {
  Player? _player;
  VideoController? _controller;
  final VideoCacheManager _cacheManager = VideoCacheManager();

  bool _isDisposed = false;
  bool _isLocalPlayer = false;
  bool _isPlaying = false;
  bool _isMuted = false;
  bool _isBuffering = false;
  bool _hasPlayed = false;

  StreamSubscription? _playingSub;
  StreamSubscription? _bufferingSub;
  StreamSubscription? _volumeSub;
  StreamSubscription? _errorSub;
  Timer? _bufferingTimer;
  Timer? _initTimer;

  @override
  void initState() {
    super.initState();
    _isLocalPlayer = widget.externalPlayer == null;

    if (_isRemoteWebp(widget.videoUrl)) {
      return;
    }

    final isTest = !kIsWeb && Platform.environment.containsKey('FLUTTER_TEST');
    if (isTest) {
      return;
    }

    if (widget.externalPlayer != null) {
      _player = widget.externalPlayer;
      _controller = VideoController(_player!);
      _initPlayer();
    } else {
      _player = Player();
      _controller = VideoController(_player!);
      _initPlayer();
    }
  }

  Future<void> _initPlayer() async {
    final player = _player;
    if (player == null || _isDisposed) return;

    final currentUrl = widget.videoUrl;

    // Cancel previous subscriptions to prevent memory leaks and duplicate triggers
    _playingSub?.cancel();
    _bufferingSub?.cancel();
    _volumeSub?.cancel();
    _errorSub?.cancel();

    if (mounted) {
      setState(() {
        _hasPlayed = false;
        _isBuffering = true;
      });
    } else {
      _hasPlayed = false;
      _isBuffering = true;
    }

    // Listeners for sync state
    _playingSub = player.stream.playing.listen((playing) {
      if (mounted && !_isDisposed && widget.videoUrl == currentUrl) {
        setState(() {
          _isPlaying = playing;
          if (playing) {
            // Delay hiding the poster to ensure the video's first frame is rendered
            Future.delayed(const Duration(milliseconds: 300), () {
              if (mounted && !_isDisposed && widget.videoUrl == currentUrl && _isPlaying) {
                setState(() {
                  _hasPlayed = true;
                });
              }
            });
          }
        });
      }
    });

    _bufferingSub = player.stream.buffering.listen((buffering) {
      if (_isDisposed || widget.videoUrl != currentUrl) return;
      _bufferingTimer?.cancel();
      if (buffering) {
        // Debounce showing loading indicator to prevent loop flicker
        _bufferingTimer = Timer(const Duration(milliseconds: 150), () {
          if (mounted && !_isDisposed) setState(() => _isBuffering = true);
        });
      } else {
        if (mounted && !_isDisposed) setState(() => _isBuffering = false);
      }
    });

    _volumeSub = player.stream.volume.listen((vol) {
      if (mounted && !_isDisposed && widget.videoUrl == currentUrl) {
        setState(() => _isMuted = vol == 0);
      }
    });

    _errorSub = player.stream.error.listen((err) {
      LogUtils.e('SmoothVideoPlayerWidget: player error for $currentUrl: $err');
      if (mounted && !_isDisposed && widget.videoUrl == currentUrl) {
        setState(() {
          _isBuffering = false;
          _isPlaying = false;
        });
      }
    });

    if (_isLocalPlayer) {
      try {
        final cachedPath = await _cacheManager.getCachedOrDownload(currentUrl);

        // Double check not disposed/null and URL hasn't changed since async cache check
        if (!mounted || _isDisposed || _player == null || widget.videoUrl != currentUrl) {
          return;
        }

        final mediaSource = (cachedPath != null)
            ? Uri.file(cachedPath).toString()
            : currentUrl;

        if (widget.loop) {
          try {
            if (!_isDisposed && _player != null) {
              player.setPlaylistMode(PlaylistMode.single);
            }
          } catch (e) {
            LogUtils.w('SmoothVideoPlayerWidget: setPlaylistMode failed: $e');
          }
        }

        try {
          if (!_isDisposed && _player != null) {
            player.setVolume(widget.playMuted ? 0.0 : 100.0);
          }
          if (!_isDisposed && _player != null) {
            await player.open(Media(mediaSource), play: widget.autoPlay);
          }
        } catch (e) {
          LogUtils.w('SmoothVideoPlayerWidget: player.open failed: $e');
        }

        // Trigger background download if not cached
        if (cachedPath == null) {
          _cacheManager.getCachedOrDownload(currentUrl, waitForDownload: false);
        }
      } catch (e, stack) {
        LogUtils.e(
          'SmoothVideoPlayerWidget: Error playing local video',
          error: e,
          stackTrace: stack,
        );
        if (mounted && !_isDisposed && widget.videoUrl == currentUrl) {
          setState(() {
            _isBuffering = false;
          });
        }
      }
    } else {
      // Sync state from existing player
      try {
        if (!_isDisposed && _player != null) {
          _isPlaying = player.state.playing;
          _isMuted = player.state.volume == 0;
          _isBuffering = player.state.buffering;
        }
      } catch (e) {
        LogUtils.w('SmoothVideoPlayerWidget: Syncing external player state failed: $e');
      }
      if (_isPlaying) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted && !_isDisposed && _isPlaying) {
            setState(() => _hasPlayed = true);
          }
        });
      }
    }
  }

  @override
  void didUpdateWidget(SmoothVideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.videoUrl != oldWidget.videoUrl) {
      _initPlayer();
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _initTimer?.cancel();
    _bufferingTimer?.cancel();
    _playingSub?.cancel();
    _bufferingSub?.cancel();
    _volumeSub?.cancel();
    _errorSub?.cancel();
    if (_isLocalPlayer) {
      try {
        _player?.dispose();
      } catch (e) {
        LogUtils.w('SmoothVideoPlayerWidget: player.dispose error: $e');
      }
    }
    super.dispose();
  }

  void _togglePlay() {
    if (_isDisposed || _player == null) return;
    try {
      if (!_isDisposed && _player != null) {
        _player?.playOrPause();
      }
    } catch (e) {
      LogUtils.w('SmoothVideoPlayerWidget: playOrPause error: $e');
    }
  }

  void _toggleMute() {
    if (_isDisposed || _player == null) return;
    try {
      if (!_isDisposed && _player != null) {
        final vol = _player!.state.volume;
        _player!.setVolume(vol == 0 ? 100.0 : 0.0);
      }
    } catch (e) {
      LogUtils.w('SmoothVideoPlayerWidget: setVolume error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isRemoteWebp(widget.videoUrl)) {
      return RepaintBoundary(
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: AppImage(
            imageUrl: widget.videoUrl,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
          ),
        ),
      );
    }

    Widget playerWidget = _controller != null
        ? Container(
            color: Colors.transparent,
            child: Video(
              controller: _controller!,
              fill: AppColors.black,
              fit: widget.fit,
              alignment: widget.alignment ?? Alignment.center,
              controls: NoVideoControls,
            ),
          )
        : Container(color: Colors.transparent);

    // Apply Border Radius if specified
    if (widget.borderRadius != null) {
      playerWidget = ClipRRect(
        borderRadius: widget.borderRadius!,
        child: playerWidget,
      );
    }

    return RepaintBoundary(
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 1. The Video View itself
            Positioned.fill(child: playerWidget),

            // 2. Poster/Thumbnail image with smooth fade transition
            if (widget.imageUrl != null)
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: _hasPlayed ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                  child: IgnorePointer(
                    ignoring: _hasPlayed,
                    child: AppImage(
                      imageUrl: widget.imageUrl!,
                      fit: widget.fit,
                      width: widget.width,
                      height: widget.height,
                      borderRadius: widget.borderRadius?.topLeft.x ?? 0.0,
                      errorWidget: Container(
                        color: AppColors.onSurface,
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.white24,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // 3. Play/Pause center toggle
            if (widget.showPlayPauseButton &&
                ((!_isPlaying && (widget.autoPlay ? _hasPlayed : true)) ||
                    (_isBuffering && widget.showBufferingIndicator)))
              GestureDetector(
                onTap: _togglePlay,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.black.withValues(alpha: 0.1),
                  ),
                  child: _isBuffering
                      ? (widget.showBufferingIndicator
                            ? const Padding(
                                padding: EdgeInsets.all(24.0),
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.primary,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink())
                      : const Icon(
                          Icons.play_arrow_rounded,
                          color: AppColors.white,
                          size: 60,
                        ),
                ),
              ),

            // 4. Buffering spinner when playing but stalling
            if (_isBuffering && _isPlaying && widget.showBufferingIndicator)
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
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        child: SizedBox(
                          width: 42,
                          height: 42,
                          child: Icon(
                            _isMuted
                                ? Icons.volume_off_rounded
                                : Icons.volume_up_rounded,
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
      ),
    );
  }

  bool _isRemoteWebp(String source) {
    final uri = Uri.tryParse(source);
    return source.toLowerCase().endsWith('.webp') &&
        uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https');
  }
}

