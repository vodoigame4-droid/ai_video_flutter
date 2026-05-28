import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:media_kit_video/media_kit_video.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../bloc/video_player_bloc.dart';
import '../bloc/video_player_event.dart';
import '../bloc/video_player_state.dart';

class VideoPlayerPage extends StatefulWidget {
  static const String path = '/video-player';
  static const String name = 'video_player';

  final String videoUrl;
  final String title;

  const VideoPlayerPage({
    super.key,
    required this.videoUrl,
    required this.title,
  });

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late final VideoPlayerBloc _bloc;
  late final VideoController _controller;
  bool _showControls = true;

  @override
  void initState() {
    super.initState();
    _bloc = VideoPlayerBloc()..add(VideoPlayerEvent.init(url: widget.videoUrl));
    _controller = VideoController(_bloc.player);
  }

  @override
  void dispose() {
    // Note: Bloc handles closing the Player
    _bloc.close();
    super.dispose();
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          onTap: _toggleControls,
          behavior: HitTestBehavior.opaque,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 1. The Video Render Area
              Positioned.fill(
                child: Center(
                  child: Video(
                    controller: _controller,
                    fill: Colors.black,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // 2. Glassmorphic App Bar (Top)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                top: _showControls ? 0 : -100,
                left: 0,
                right: 0,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 8,
                        bottom: 16,
                        left: 16,
                        right: 16,
                      ),
                      color: Colors.black.withValues(alpha: 0.5),
                      child: Row(
                        children: [
                          Material(
                            color: Colors.white.withValues(alpha: 0.1),
                            shape: const CircleBorder(),
                            child: InkWell(
                              onTap: () => context.pop(),
                              borderRadius: const BorderRadius.all(Radius.circular(100)),
                              child: const SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              widget.title,
                              style: context.textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ) ?? const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // 3. Middle Action & State Overlays
              BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          color: Colors.white.withValues(alpha: 0.05),
                          child: const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                          ),
                        ),
                      ),
                    ),
                    error: (message) => ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          color: Colors.white.withValues(alpha: 0.05),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.error_outline_rounded, color: AppColors.heart, size: 48),
                              const SizedBox(height: 16),
                              Text(
                                t.video_player.error_loading,
                                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  _bloc.add(VideoPlayerEvent.init(url: widget.videoUrl));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                ),
                                child: Text(t.video_player.retry),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ready: (videoPath, isPlaying, isMuted, isBuffering, position, duration) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          // Buffering loading indicator
                          if (isBuffering)
                            const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                            ),
                          
                          // Quick Play/Pause Center Trigger Button
                          if (_showControls && !isBuffering)
                            AnimatedOpacity(
                              opacity: _showControls ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 200),
                              child: Material(
                                color: Colors.black.withValues(alpha: 0.5),
                                shape: const CircleBorder(),
                                child: InkWell(
                                  onTap: () => _bloc.add(const VideoPlayerEvent.togglePlay()),
                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                    width: 72,
                                    height: 72,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white.withValues(alpha: 0.15), width: 1.5),
                                    ),
                                    child: Icon(
                                      isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  );
                },
              ),

              // 4. Glassmorphic Control Bar (Bottom)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                bottom: _showControls ? 0 : -150,
                left: 0,
                right: 0,
                child: BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      ready: (videoPath, isPlaying, isMuted, isBuffering, position, duration) {
                        final posMs = position.inMilliseconds.toDouble();
                        final durMs = duration.inMilliseconds.toDouble();
                        final sliderVal = posMs.clamp(0.0, durMs > 0 ? durMs : 0.0);

                        return ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.black.withValues(alpha: 0.5),
                              padding: EdgeInsets.only(
                                top: 16,
                                bottom: MediaQuery.of(context).padding.bottom + 16,
                                left: 16,
                                right: 16,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Progress Bar Slider & Timestamps
                                  Row(
                                    children: [
                                      Text(
                                        _formatDuration(position),
                                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                                      ),
                                      Expanded(
                                        child: SliderTheme(
                                          data: SliderTheme.of(context).copyWith(
                                            activeTrackColor: AppColors.primary,
                                            inactiveTrackColor: Colors.white24,
                                            thumbColor: AppColors.primary,
                                            trackHeight: 4,
                                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                                            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
                                          ),
                                          child: Slider(
                                            value: sliderVal,
                                            max: durMs > 0 ? durMs : 100.0,
                                            onChanged: (val) {
                                              _bloc.add(VideoPlayerEvent.seek(Duration(milliseconds: val.toInt())));
                                            },
                                          ),
                                        ),
                                      ),
                                      Text(
                                        _formatDuration(duration),
                                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),

                                  // Play, Mute Control Buttons Row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Mute Toggle Button
                                      Material(
                                        color: Colors.white.withValues(alpha: 0.1),
                                        shape: const CircleBorder(),
                                        child: InkWell(
                                          onTap: () => _bloc.add(const VideoPlayerEvent.toggleMute()),
                                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                                          child: SizedBox(
                                            width: 44,
                                            height: 44,
                                            child: Icon(
                                              isMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Main Play/Pause Button
                                      Material(
                                        color: AppColors.primary,
                                        shape: const CircleBorder(),
                                        child: InkWell(
                                          onTap: () => _bloc.add(const VideoPlayerEvent.togglePlay()),
                                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                                          child: SizedBox(
                                            width: 52,
                                            height: 52,
                                            child: Icon(
                                              isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                              color: Colors.white,
                                              size: 32,
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Spacer block for balanced layout
                                      const SizedBox(width: 44),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
