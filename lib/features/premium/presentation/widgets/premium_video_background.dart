import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import '../../../../core/navigation/app_router.dart';
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

class _PremiumVideoBackgroundState extends State<PremiumVideoBackground> with WidgetsBindingObserver, RouteAware {
  late final Player _player;
  late final VideoController _controller;
  final VideoCacheManager _cacheManager = VideoCacheManager();
  
  bool _isInitialized = false;
  bool _hasError = false;
  bool _isCurrentlyVisible = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    
    _player = Player();
    _controller = VideoController(_player);
    
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      // 1. Check local cache or download in background
      final cachedPath = await _cacheManager.getCachedOrDownload(widget.videoUrl);
      final mediaPath = cachedPath ?? widget.videoUrl;

      // 2. Open media source
      await _player.open(Media(mediaPath));
      _player.setPlaylistMode(PlaylistMode.loop);
      _player.setVolume(0.0); // Keep silent

      if (_isCurrentlyVisible) {
        _player.play();
      } else {
        _player.pause();
      }

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }

      // If playing from network, schedule background caching download
      if (cachedPath == null) {
        _cacheManager.getCachedOrDownload(widget.videoUrl, waitForDownload: false);
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
      _player.stop().then((_) => _initializeVideo());
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Pause on backgrounding, resume when foregrounded if visible
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _player.pause();
    } else if (state == AppLifecycleState.resumed && _isInitialized && !_hasError && _isCurrentlyVisible) {
      _player.play();
    }
  }

  @override
  void didPushNext() {
    // Paused when another route covers this screen
    _isCurrentlyVisible = false;
    _player.pause();
    LogUtils.d('PremiumVideoBackground: Route obscured. Paused video.');
  }

  @override
  void didPopNext() {
    // Resumed when the top route is popped, revealing this screen again
    _isCurrentlyVisible = true;
    if (_isInitialized && !_hasError) {
      _player.play();
      LogUtils.d('PremiumVideoBackground: Route revealed. Resumed video.');
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    WidgetsBinding.instance.removeObserver(this);
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget background;

    if (_hasError) {
      // Fallback solid background if loading video fails
      background = Container(
        color: const Color(0xFF000200),
        child: const Center(
          child: Icon(
            Icons.broken_image_outlined,
            color: Colors.white24,
            size: 48,
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
      background = SizedBox.expand(
        child: Video(
          controller: _controller,
          controls: NoVideoControls,
          fill: const Color(0xFF000200),
          fit: BoxFit.cover,
        ),
      );
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
