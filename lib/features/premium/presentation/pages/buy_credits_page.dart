import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../i18n/strings.g.dart';
import '../bloc/buy_credits/buy_credits_bloc.dart';
import '../bloc/buy_credits/buy_credits_event.dart';
import '../bloc/buy_credits/buy_credits_state.dart';
import '../widgets/premium_video_background.dart';
import '../widgets/credit_pack_card.dart';

class BuyCreditsPage extends StatelessWidget {
  static const String path = '/buy_credits';
  static const String name = 'buy_credits';

  const BuyCreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BuyCreditsBloc>()..add(const BuyCreditsEvent.init()),
      child: const BuyCreditsView(),
    );
  }
}

class BuyCreditsView extends StatelessWidget {
  const BuyCreditsView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final videoUrl = 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';

    return Scaffold(
      body: BlocConsumer<BuyCreditsBloc, BuyCreditsState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (message, _) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.primary,
                ),
              );
            },
            error: (message, _) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.heart,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Stack(
              children: [
                Positioned.fill(
                  child: PremiumVideoBackground(
                    videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                    isBlurred: true,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text(
                        'Processing...',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            orElse: () {
              bool isRevealed = false;

              state.mapOrNull(
                ready: (s) => isRevealed = s.isVideoRevealed,
                success: (s) => isRevealed = s.isVideoRevealed,
                error: (s) => isRevealed = s.isVideoRevealed,
              );

              return Stack(
                children: [
                  // 1. Looping video background
                  Positioned.fill(
                    child: PremiumVideoBackground(
                      videoUrl: videoUrl,
                      isBlurred: !isRevealed,
                    ),
                  ),

                  // 2. Back Close Button top-left
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 16,
                    left: 16,
                    child: Material(
                      color: Colors.black.withValues(alpha: 0.2),
                      shape: const CircleBorder(),
                      child: InkWell(
                        onTap: () => context.pop(),
                        borderRadius: const BorderRadius.all(Radius.circular(100)),
                        child: const SizedBox(
                          width: 36,
                          height: 36,
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 3. Main scrollable content
                  Positioned.fill(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Padding to keep content below status bar and back button area
                          SizedBox(height: MediaQuery.of(context).padding.top + 60),

                          // Reveal button (if not revealed)
                          if (!isRevealed) ...[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.15),
                                borderRadius: const BorderRadius.all(Radius.circular(100)),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.3),
                                  width: 1.0,
                                ),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () => context.read<BuyCreditsBloc>().add(
                                        const BuyCreditsEvent.toggleReveal(),
                                      ),
                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    child: Text(
                                      t.premium.tap_to_reveal,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            GestureDetector(
                              onTap: () => context.read<BuyCreditsBloc>().add(
                                    const BuyCreditsEvent.toggleReveal(),
                                  ),
                              child: Lottie.asset(
                                'assets/raw/hand_tab_animation.json',
                                width: 80,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 30),
                          ] else ...[
                            // Keep some space if revealed so the video preview is visible
                            const SizedBox(height: 100),
                          ],

                          // A premium gradient fade before the content
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.black87, Colors.black],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),

                          // Solid dark subscription/credits container
                          Container(
                            color: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Header Title & Description
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        t.premium.buy_more_credit,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        t.premium.credit_desc,
                                        style: const TextStyle(
                                          color: AppColors.subText,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),

                                // Grid of credit cards
                                GridView.count(
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  childAspectRatio: 173 / 164,
                                  children: [
                                    CreditPackCard(
                                      title: t.premium.credit_70,
                                      videoEstimate: t.premium.approx_videos(count: 2),
                                      priceText: t.premium.price_70,
                                      onTap: () => context.read<BuyCreditsBloc>().add(
                                            BuyCreditsEvent.purchaseCredits(
                                              credits: 70,
                                              priceText: t.premium.price_70,
                                            ),
                                          ),
                                    ),
                                    CreditPackCard(
                                      title: t.premium.credit_150,
                                      videoEstimate: t.premium.approx_videos(count: 4),
                                      priceText: t.premium.price_150,
                                      onTap: () => context.read<BuyCreditsBloc>().add(
                                            BuyCreditsEvent.purchaseCredits(
                                              credits: 150,
                                              priceText: t.premium.price_150,
                                            ),
                                          ),
                                    ),
                                    CreditPackCard(
                                      title: t.premium.credit_350,
                                      videoEstimate: t.premium.approx_videos(count: 10),
                                      priceText: t.premium.price_350,
                                      onTap: () => context.read<BuyCreditsBloc>().add(
                                            BuyCreditsEvent.purchaseCredits(
                                              credits: 350,
                                              priceText: t.premium.price_350,
                                            ),
                                          ),
                                    ),
                                    CreditPackCard(
                                      title: t.premium.credit_500,
                                      videoEstimate: t.premium.approx_videos(count: 14),
                                      priceText: t.premium.price_500,
                                      onTap: () => context.read<BuyCreditsBloc>().add(
                                            BuyCreditsEvent.purchaseCredits(
                                              credits: 500,
                                              priceText: t.premium.price_500,
                                            ),
                                          ),
                                    ),
                                    CreditPackCard(
                                      title: t.premium.credit_1000,
                                      videoEstimate: t.premium.approx_videos(count: 27),
                                      priceText: t.premium.price_1000,
                                      tagText: t.premium.most_popular,
                                      tagColors: const [Color(0xFFfae123), Color(0xFFff6320)],
                                      onTap: () => context.read<BuyCreditsBloc>().add(
                                            BuyCreditsEvent.purchaseCredits(
                                              credits: 1000,
                                              priceText: t.premium.price_1000,
                                            ),
                                          ),
                                    ),
                                    CreditPackCard(
                                      title: t.premium.credit_6000,
                                      videoEstimate: t.premium.approx_videos(count: 142),
                                      priceText: t.premium.price_6000,
                                      tagText: t.premium.best_value,
                                      tagColors: const [Color(0xFFfae123), Color(0xFFff6320)],
                                      onTap: () => context.read<BuyCreditsBloc>().add(
                                            BuyCreditsEvent.purchaseCredits(
                                              credits: 6000,
                                              priceText: t.premium.price_6000,
                                            ),
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
