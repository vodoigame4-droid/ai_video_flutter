import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../i18n/strings.g.dart';
import 'package:core_business/core_business.dart';
import '../../../../core/extensions/context_failure_ext.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../core/widgets/smooth_video_player_widget.dart';

class GenerationBuyCreditsPage extends StatelessWidget {
  static const String path = '/generation-buy-credits';
  static const String name = 'generation_buy_credits';

  final String videoUrl;

  const GenerationBuyCreditsPage({super.key, this.videoUrl = ''});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<IapBloc>()..add(const IapEvent.init()),
      child: GenerationBuyCreditsView(videoUrl: videoUrl),
    );
  }
}

class GenerationBuyCreditsView extends StatefulWidget {
  final String videoUrl;

  const GenerationBuyCreditsView({super.key, required this.videoUrl});

  @override
  State<GenerationBuyCreditsView> createState() => _GenerationBuyCreditsViewState();
}

class _GenerationBuyCreditsViewState extends State<GenerationBuyCreditsView> with SingleTickerProviderStateMixin {
  static const String _placeholderVideoUrl =
      'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/videos/786913993694.mp4';

  late AnimationController _revealController;
  late Animation<double> _blurAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _revealController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _blurAnimation = Tween<double>(begin: 20.0, end: 0.0).animate(
      CurvedAnimation(parent: _revealController, curve: Curves.easeOut),
    );
    _opacityAnimation = Tween<double>(begin: 0.45, end: 0.1).animate(
      CurvedAnimation(parent: _revealController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _revealController.dispose();
    super.dispose();
  }

  Widget _buildTapToReveal() {
    return GestureDetector(
      onTapDown: (_) => _revealController.forward(),
      onTapUp: (_) => _revealController.reverse(),
      onTapCancel: () => _revealController.reverse(),
      onLongPressStart: (_) => _revealController.forward(),
      onLongPressEnd: (_) => _revealController.reverse(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: const Text(
              'Tap to Reveal',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 6),
          const Icon(
            Icons.touch_app_rounded,
            color: Colors.white,
            size: 28,
          )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .scale(begin: const Offset(0.9, 0.9), end: const Offset(1.1, 1.1), duration: 800.milliseconds)
              .moveY(begin: 0, end: 4, duration: 800.milliseconds),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    // Package details mapping
    List<Map<String, dynamic>> packages = [
      {
        'credits': 70,
        'title': t.premium.credit_70,
        'approx': t.premium.approx_videos(count: 2),
        'price': t.premium.price_70,
        'tag': null,
      },
      {
        'credits': 150,
        'title': t.premium.credit_150,
        'approx': t.premium.approx_videos(count: 4),
        'price': t.premium.price_150,
        'tag': null,
      },
      {
        'credits': 350,
        'title': t.premium.credit_350,
        'approx': t.premium.approx_videos(count: 10),
        'price': t.premium.price_350,
        'tag': null,
      },
      {
        'credits': 500,
        'title': t.premium.credit_500,
        'approx': t.premium.approx_videos(count: 14),
        'price': t.premium.price_500,
        'tag': null,
      },
      {
        'credits': 1000,
        'title': t.premium.credit_1000,
        'approx': t.premium.approx_videos(count: 27),
        'price': t.premium.price_1000,
        'tag': t.premium.most_popular,
      },
      {
        'credits': 5000,
        'title': t.premium.credit_5000,
        'approx': t.premium.approx_videos(count: 142),
        'price': t.premium.price_5000,
        'tag': t.premium.best_value,
      },
    ];

    return PopScope(
      canPop: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<IapBloc, IapState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (message, isWeeklySelected, isVideoRevealed) {
                AppToast.showSuccess(message);
              },
              error: (message, isWeeklySelected, isVideoRevealed) {
                context.handleFailure(
                  Failure.business(code: message, message: ''),
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              initial: () => const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ),
              loading: () => Stack(
                children: [
                  Positioned.fill(child: Container(color: Colors.black)),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          t.common.processing,
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              orElse: () {
                return Stack(
                  children: [
                    // 1. Fullscreen Video background
                    Positioned.fill(
                      child: SmoothVideoPlayerWidget(
                        videoUrl: widget.videoUrl.isNotEmpty ? widget.videoUrl : _placeholderVideoUrl,
                        fit: BoxFit.cover,
                        autoPlay: true,
                        loop: true,
                        showMuteButton: false,
                        showPlayPauseButton: false,
                        playMuted: true,
                      ),
                    ),

                    // 2. Animated blur/dim overlay
                    AnimatedBuilder(
                      animation: _revealController,
                      builder: (context, child) {
                        return Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: _blurAnimation.value,
                              sigmaY: _blurAnimation.value,
                            ),
                            child: Container(
                              color: Colors.black.withValues(alpha: _opacityAnimation.value),
                            ),
                          ),
                        );
                      },
                    ),

                    Positioned.fill(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            16,
                            MediaQuery.of(context).padding.top + 64,
                            16,
                            MediaQuery.of(context).padding.bottom + 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Centered Tap To Reveal Button
                              Center(child: _buildTapToReveal()),
                              const SizedBox(height: 24),

                              // Titles
                              Text(
                                t.premium.buy_credit,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  t.premium.credit_desc,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.4,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 28),

                              // 3x2 Packages Grid
                              GridView.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 14,
                                crossAxisSpacing: 14,
                                childAspectRatio: 0.85,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: packages.map((pkg) {
                                  return GenerationCreditPackCard(
                                    title: pkg['title'] as String,
                                    videoEstimate: pkg['approx'] as String,
                                    priceText: pkg['price'] as String,
                                    tagText: pkg['tag'] as String?,
                                    onTap: () {
                                      context.read<IapBloc>().add(
                                        IapEvent.purchaseCredits(
                                          credits: pkg['credits'] as int,
                                          priceText: pkg['price'] as String,
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // 4. Header Close Button
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 16,
                      left: 16,
                      child: GestureDetector(
                        onTap: () => context.pop(),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.4),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
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
      ),
    );
  }
}

class GenerationCreditPackCard extends StatelessWidget {
  final String title;
  final String videoEstimate;
  final String priceText;
  final String? tagText;
  final VoidCallback onTap;

  const GenerationCreditPackCard({
    super.key,
    required this.title,
    required this.videoEstimate,
    required this.priceText,
    this.tagText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Card Container
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.55),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.15),
              width: 1.2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 4),
                // Shiny Coin Icon
                Image.asset(
                  Assets.images.icCheckinCoin.path,
                  width: 38,
                  height: 38,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                // Credit Title
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                // Approx Video Estimate
                Text(
                  videoEstimate,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                // Price Button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: double.infinity,
                    height: 36,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF24C780), Color(0xFF2BC5C5)],
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        priceText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Optional badge overlay
        if (tagText != null)
          Positioned(
            top: -6,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFB300), Color(0xFFFF8F00)],
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                tagText!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
