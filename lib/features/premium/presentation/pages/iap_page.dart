import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../i18n/strings.g.dart';
import 'package:core_business/core_business.dart';
import '../widgets/premium_video_background.dart';
import '../widgets/subscription_package_card.dart';
import 'buy_credits_page.dart';

class IapPage extends StatelessWidget {
  static const String path = '/iap';
  static const String name = 'iap';

  const IapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<IapBloc>()..add(const IapEvent.init()),
      child: const IapView(),
    );
  }
}

class IapView extends StatelessWidget {
  const IapView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final videoUrl =
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';

    return Scaffold(
      body: BlocConsumer<IapBloc, IapState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (message, isWeeklySelected, isVideoRevealed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.primary,
                ),
              );
            },
            error: (message, isWeeklySelected, isVideoRevealed) {
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
                    videoUrl:
                        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
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
              bool isWeekly = false;
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
                    child: GestureDetector(
                      onTap: () => context.read<IapBloc>().add(
                        const IapEvent.toggleReveal(),
                      ),
                      child: PremiumVideoBackground(
                        videoUrl: videoUrl,
                        isBlurred: !isRevealed,
                      ),
                    ),
                  ),

                  // 1.5. Bottom gradient fade overlay to black
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 600,
                    child: IgnorePointer(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.8),
                              Colors.black,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 2. Glass-morphic Top Header Row: Close (Left), Restore (Right)
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back Close Button
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                            child: Material(
                              color: Colors.black.withValues(alpha: 0.1),
                              child: InkWell(
                                onTap: () => context.pop(),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                child: const SizedBox(
                                  width: 36,
                                  height: 36,
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Restore Pill Button
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                            child: Material(
                              color: Colors.black.withValues(alpha: 0.1),
                              child: InkWell(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(t.premium.restore)),
                                  );
                                },
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    t.premium.restore,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
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

                  // 3. Main scrollable content
                  Positioned.fill(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                children: [
                                  // Push all content to the bottom
                                  const Spacer(),

                                  // Transparent container for the subscription panels & elements
                                  Container(
                                    color: Colors.transparent,
                                    padding: const EdgeInsets.fromLTRB(
                                      16,
                                      0,
                                      16,
                                      24,
                                    ),
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
                                              fontFamily: 'Inter',
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    '${t.splash.appName.toUpperCase()} ',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              TextSpan(
                                                text: t.premium.pro_title
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          t.premium.discount_title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 50,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1.2,
                                            height: 1.1,
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

                                        // Glass-morphic Buy Credit Now Badge Button
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 7.5,
                                              sigmaY: 7.5,
                                            ),
                                            child: Container(
                                              height: 38,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    AppColors.secondary
                                                        .withValues(alpha: 0.3),
                                                    AppColors.primary
                                                        .withValues(alpha: 0.3),
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                border: Border.all(
                                                  color: AppColors.secondary,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  onTap: () => context.push(
                                                    BuyCreditsPage.path,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                        Radius.circular(100),
                                                      ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 18,
                                                        ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          t
                                                              .premium
                                                              .buy_credit_now,
                                                          style:
                                                              const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        Container(
                                                          width: 20,
                                                          height: 20,
                                                          decoration:
                                                              const BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                          child: const Icon(
                                                            Icons
                                                                .arrow_forward_ios_rounded,
                                                            color: Colors.black,
                                                            size: 10,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 30),

                                        // 2x2 Feature Checklist Grid (Row-Column layout)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    _buildCheckItem(
                                                      t
                                                          .premium
                                                          .unlock_templates,
                                                    ),
                                                    const SizedBox(height: 12),
                                                    _buildCheckItem(
                                                      t.premium.discount_packs,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    _buildCheckItem(
                                                      t.premium.fast_generation,
                                                    ),
                                                    const SizedBox(height: 12),
                                                    _buildCheckItem(
                                                      t.premium.videos_per_year,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 30),

                                        // Weekly Subscription Package (Unselected)
                                        SubscriptionPackageCard(
                                          title: t.premium.weekly,
                                          description: t.premium.weekly_desc,
                                          price: t.premium.weekly_price,
                                          suffix: t.premium.weekly_suffix,
                                          tagText: t.premium.best_value,
                                          tagColors: const [
                                            Color(0xFFff6320),
                                            Color(0xFFfae123),
                                          ],
                                          isSelected: isWeekly,
                                          onTap: () =>
                                              context.read<IapBloc>().add(
                                                const IapEvent.selectWeekly(),
                                              ),
                                        ),
                                        const SizedBox(height: 16),

                                        // Annually Subscription Package (Selected)
                                        SubscriptionPackageCard(
                                          title: t.premium.annually,
                                          description: t.premium.annually_desc,
                                          price: t.premium.annually_price,
                                          suffix: t.premium.annually_suffix,
                                          tagText: t.premium.save_80,
                                          tagColors: const [
                                            Color(0xFFff6320),
                                            Color(0xFFfae123),
                                          ],
                                          isSelected: !isWeekly,
                                          onTap: () =>
                                              context.read<IapBloc>().add(
                                                const IapEvent.selectAnnually(),
                                              ),
                                        ),
                                        const SizedBox(height: 24),

                                        // Start My Subscription Button (Crown + Text + Arrow)
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
                                              onTap: () =>
                                                  context.read<IapBloc>().add(
                                                    const IapEvent.purchase(),
                                                  ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                    Radius.circular(100),
                                                  ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                    ),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons
                                                          .workspace_premium_rounded,
                                                      color: Color(
                                                        0xFFFFD700,
                                                      ), // Gold
                                                      size: 24,
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      t
                                                          .premium
                                                          .start_my_subscription,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    const Icon(
                                                      Icons
                                                          .arrow_forward_rounded,
                                                      color: Colors.white,
                                                      size: 24,
                                                    ),
                                                  ],
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 8,
                                              ),
                                              child: Text(
                                                '|',
                                                style: TextStyle(
                                                  color: AppColors.activeTab,
                                                ),
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
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 8,
                                              ),
                                              child: Text(
                                                '|',
                                                style: TextStyle(
                                                  color: AppColors.activeTab,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      t.premium.restore,
                                                    ),
                                                  ),
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
                                  // Bottom safe area spacing
                                  SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
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

  Widget _buildCheckItem(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.rotate(
          angle: -pi / 4,
          child: Container(width: 6, height: 6, color: AppColors.primary),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
