import 'dart:async';
import 'dart:ui';
import 'package:ai_video_flutter/core/navigation/route_observer.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import '../../../../core/utils/video_cache_manager.dart';
import '../../../../core/utils/log_utils.dart';

class PremiumVideoBackground extends StatefulWidget {
  final String videoUrl;
  final bool isBlurred;
  final double blurAmount;
  final Widget? child;

  const PremiumVideoBackground({
    super.key,
    required this.videoUrl,
    required this.isBlurred,
    this.blurAmount = 15.0,
    this.child,
  });

  @override
  State<PremiumVideoBackground> createState() => _PremiumVideoBackgroundState();
}

class _PremiumVideoBackgroundState extends State<PremiumVideoBackground>
    with WidgetsBindingObserver, RouteAware {
  Player? _player;
  VideoController? _controller;
  final VideoCacheManager _cacheManager = VideoCacheManager();

  bool _isInitialized = false;
  bool _hasError = false;
  bool _isCurrentlyVisible = true;
  Timer? _initTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Debounce player creation by 300ms to prevent resource leaks during quick screen pushes/pops
    _initTimer = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      setState(() {
        _player = Player();
        _controller = VideoController(_player!);
      });
      _initializeVideo();
    });
  }

  Future<void> _initializeVideo() async {
    final player = _player;
    if (player == null || widget.videoUrl.isEmpty) {
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
      return;
    }

    try {
      // 1. Check local cache or download in background
      final cachedPath = await _cacheManager.getCachedOrDownload(
        widget.videoUrl,
      );
      final mediaSource = (cachedPath != null)
          ? Uri.file(cachedPath).toString()
          : widget.videoUrl;

      // Double check not disposed/null
      if (!mounted || _player == null) return;

      // 2. Open media source
      await player.open(Media(mediaSource));
      player.setPlaylistMode(PlaylistMode.loop);
      player.setVolume(0.0); // Keep silent

      if (_isCurrentlyVisible) {
        player.play();
      } else {
        player.pause();
      }

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }

      // If playing from network, schedule background caching download
      if (cachedPath == null) {
        _cacheManager.getCachedOrDownload(
          widget.videoUrl,
          waitForDownload: false,
        );
      }
    } catch (e, stack) {
      LogUtils.e(
        'PremiumVideoBackground: Failed to initialize video player',
        error: e,
        stackTrace: stack,
      );
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Register Route Observer to pause playback when this page is not active
    final route = ModalRoute.of(context);
    if (route != null) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void didUpdateWidget(covariant PremiumVideoBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reinitialize if URL changed
    if (oldWidget.videoUrl != widget.videoUrl) {
      setState(() {
        _isInitialized = false;
        _hasError = false;
      });
      _player?.stop().then((_) => _initializeVideo());
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Pause on backgrounding, resume when foregrounded if visible
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _player?.pause();
    } else if (state == AppLifecycleState.resumed &&
        _isInitialized &&
        !_hasError &&
        _isCurrentlyVisible) {
      if (widget.videoUrl.isNotEmpty) {
        _player?.play();
      }
    }
  }

  @override
  void didPushNext() {
    // Paused when another route covers this screen
    _isCurrentlyVisible = false;
    _player?.pause();
    LogUtils.d('PremiumVideoBackground: Route obscured. Paused video.');
  }

  @override
  void didPopNext() {
    // Resumed when the top route is popped, revealing this screen again
    _isCurrentlyVisible = true;
    if (_isInitialized && !_hasError && widget.videoUrl.isNotEmpty) {
      _player?.play();
      LogUtils.d('PremiumVideoBackground: Route revealed. Resumed video.');
    }
  }

  @override
  void dispose() {
    _initTimer?.cancel();
    routeObserver.unsubscribe(this);
    WidgetsBinding.instance.removeObserver(this);
    _player?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget background;

    if (_hasError || widget.videoUrl.isEmpty) {
      // Fallback premium background image if video url is empty or loading fails
      background = Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_splash.png'),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else if (!_isInitialized) {
      // Show dark background during initialization
      background = Container(
        color: const Color(0xFF000200),
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white30),
          ),
        ),
      );
    } else {
      // Show Video inside full sized FitBox
      background = _controller != null
          ? SizedBox.expand(
              child: Video(
                controller: _controller!,
                controls: NoVideoControls,
                fill: const Color(0xFF000200),
                fit: BoxFit.cover,
              ),
            )
          : Container(color: const Color(0xFF000200));
    }

    return Stack(
      children: [
        // 1. Cross-fade between initialized video and black background loading spinner
        Positioned.fill(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: Container(
              key: ValueKey('video_${_isInitialized}_$_hasError'),
              child: background,
            ),
          ),
        ),

        // 2. Animated Blur & Dark Overlay Filter
        Positioned.fill(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: widget.isBlurred
                ? Stack(
                    key: const ValueKey('blurred'),
                    children: [
                      Positioned.fill(
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: widget.blurAmount,
                            sigmaY: widget.blurAmount,
                          ),
                          child: Container(
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(key: ValueKey('clear')),
          ),
        ),

        // 3. Child overlay content
        if (widget.child != null) Positioned.fill(child: widget.child!),
      ],
    );
  }
}
