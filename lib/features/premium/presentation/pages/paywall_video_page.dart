import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../i18n/strings.g.dart';
import '../bloc/paywall_video/paywall_video_bloc.dart';
import '../bloc/paywall_video/paywall_video_event.dart';
import '../bloc/paywall_video/paywall_video_state.dart';
import '../widgets/premium_video_background.dart';
import '../widgets/subscription_package_card.dart';
import 'buy_credits_page.dart';

class PaywallVideoPage extends StatelessWidget {
  static const String path = '/paywall_video';
  static const String name = 'paywall_video';

  const PaywallVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<PaywallVideoBloc>()..add(const PaywallVideoEvent.init()),
      child: const PaywallVideoView(),
    );
  }
}

class PaywallVideoView extends StatelessWidget {
  const PaywallVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final videoUrl =
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';

    return Scaffold(
      body: BlocConsumer<PaywallVideoBloc, PaywallVideoState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (message, _, __) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.primary,
                ),
              );
            },
            error: (message, _, __) {
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
                  child: ImageFiltered(
                    imageFilter: javaScriptLikeNoFilter, // Just a placeholder
                    child: SizedBox.shrink(),
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
              // Extract current state properties
              bool isWeekly = true;
              bool isRevealed = false;

              state.mapOrNull(
                ready: (s) {
                  isWeekly = s.isWeeklySelected;
                  isRevealed = s.isVideoRevealed;
                },
                success: (s) {
                  isWeekly = s.isWeeklySelected;
                  isRevealed = s.isVideoRevealed;
                },
                error: (s) {
                  isWeekly = s.isWeeklySelected;
                  isRevealed = s.isVideoRevealed;
                },
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

                  // 2. Close back button at top left
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 16,
                    left: 16,
                    child: Material(
                      color: Colors.black.withValues(alpha: 0.2),
                      shape: const CircleBorder(),
                      child: InkWell(
                        onTap: () => context.pop(),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
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

                  // 3. Center reveal button (if not revealed)
                  if (!isRevealed)
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.15),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.3),
                                width: 1.0,
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () =>
                                    context.read<PaywallVideoBloc>().add(
                                      const PaywallVideoEvent.toggleReveal(),
                                    ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
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
                          const SizedBox(height: 24),
                          GestureDetector(
                            onTap: () => context.read<PaywallVideoBloc>().add(
                              const PaywallVideoEvent.toggleReveal(),
                            ),
                            child: Lottie.asset(
                              'assets/raw/hand_tab_animation.json',
                              width: 80,
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),

                  // 4. Paywall subscription content overlay (scrolling sheet style)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black87,
                            Colors.black,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 40, 16, 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // App Title PRO & Discount
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                              children: [
                                TextSpan(
                                  text: '${t.splash.appName.toUpperCase()} ',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                TextSpan(
                                  text: t.premium.pro_title.toUpperCase(),
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            t.premium.discount_title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.2,
                            ),
                          ),
                          Text(
                            t.premium.discount_subtitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Buy Credit Now Badge Button
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => context.push(BuyCreditsPage.path),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.4),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  border: Border.all(
                                    color: AppColors.secondary,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      t.premium.buy_credit_now,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Weekly Subscription Package
                          SubscriptionPackageCard(
                            title: t.premium.weekly,
                            description: t.premium.weekly_desc,
                            price: t.premium.weekly_price,
                            suffix: t.premium.weekly_suffix,
                            tagText: t.premium.best_value,
                            tagColors: const [
                              Color(0xFF2ac5c4),
                              Color(0xFF28c4b3),
                            ],
                            isSelected: isWeekly,
                            onTap: () => context.read<PaywallVideoBloc>().add(
                              const PaywallVideoEvent.selectWeekly(),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Annually Subscription Package
                          SubscriptionPackageCard(
                            title: t.premium.annually,
                            description: t.premium.annually_desc,
                            price: t.premium.annually_price,
                            suffix: t.premium.annually_suffix,
                            tagText: t.premium.save_80,
                            tagColors: const [
                              Color(0xFFfae123),
                              Color(0xFFff6320),
                            ],
                            isSelected: !isWeekly,
                            onTap: () => context.read<PaywallVideoBloc>().add(
                              const PaywallVideoEvent.selectAnnually(),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Start Free Trial Button
                          Container(
                            height: 56,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => context
                                    .read<PaywallVideoBloc>()
                                    .add(const PaywallVideoEvent.purchase()),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                child: Center(
                                  child: Text(
                                    t.premium.start_free_trial,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Footer Links
                          Text(
                            t.premium.auto_renewable,
                            style: const TextStyle(
                              color: AppColors.activeTab,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  t.premium.privacy_policy,
                                  style: const TextStyle(
                                    color: AppColors.subText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  '|',
                                  style: TextStyle(color: AppColors.activeTab),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  t.premium.terms_of_use,
                                  style: const TextStyle(
                                    color: AppColors.subText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  '|',
                                  style: TextStyle(color: AppColors.activeTab),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(t.premium.restore)),
                                  );
                                },
                                child: Text(
                                  t.premium.restore,
                                  style: const TextStyle(
                                    color: AppColors.subText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
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

// Dummy class to satisfy ImageFiltered signature in loading stage
const ColorFilter javaScriptLikeNoFilter = ColorFilter.matrix(<double>[
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);
