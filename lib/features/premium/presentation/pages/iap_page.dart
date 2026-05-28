import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../i18n/strings.g.dart';
import '../bloc/iap/iap_bloc.dart';
import '../bloc/iap/iap_event.dart';
import '../bloc/iap/iap_state.dart';
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

              state.mapOrNull(
                ready: (s) => isWeekly = s.isWeeklySelected,
                success: (s) => isWeekly = s.isWeeklySelected,
                error: (s) => isWeekly = s.isWeeklySelected,
              );

              return Stack(
                children: [
                  // 1. Video background (Always blurred for IAP Page)
                  Positioned.fill(
                    child: PremiumVideoBackground(
                      videoUrl: videoUrl,
                      isBlurred: true,
                    ),
                  ),

                  // 2. Top Header Row: Close (Left), Restore (Right)
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back Close Button
                        Material(
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

                        // Restore Pill Button
                        Material(
                          color: Colors.black.withValues(alpha: 0.2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
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
                                vertical: 10,
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
                      ],
                    ),
                  ),

                  // 3. Subscription Page Layout (Stack content)
                  // 3. Subscription Page Layout (Scrollable)
                  Positioned.fill(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Keep spacer at top for the header (close button, restore button)
                          SizedBox(
                            height: MediaQuery.of(context).padding.top + 60,
                          ),

                          // A premium gradient fade before the content
                          Container(
                            height: 80,
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
                          ),

                          // Solid dark subscription panel container
                          Container(
                            color: Colors.black,
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
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
                                        text:
                                            '${t.splash.appName.toUpperCase()} ',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
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
                                    onTap: () =>
                                        context.push(BuyCreditsPage.path),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 18,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withValues(
                                          alpha: 0.4,
                                        ),
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

                                // 2x2 Feature Checklist Grid
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Table(
                                    columnWidths: const {
                                      0: FlexColumnWidth(1.0),
                                      1: FlexColumnWidth(1.0),
                                    },
                                    children: [
                                      TableRow(
                                        children: [
                                          _buildCheckItem(
                                            t.premium.unlock_templates,
                                          ),
                                          _buildCheckItem(
                                            t.premium.fast_generation,
                                          ),
                                        ],
                                      ),
                                      const TableRow(
                                        children: [
                                          SizedBox(height: 12),
                                          SizedBox(height: 12),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          _buildCheckItem(
                                            t.premium.discount_packs,
                                          ),
                                          _buildCheckItem(
                                            t.premium.videos_per_year,
                                          ),
                                        ],
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
                                    Color(0xFFfae123),
                                    Color(0xFFff6320),
                                  ],
                                  isSelected: isWeekly,
                                  onTap: () => context.read<IapBloc>().add(
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
                                    Color(0xFFfae123),
                                    Color(0xFFff6320),
                                  ],
                                  isSelected: !isWeekly,
                                  onTap: () => context.read<IapBloc>().add(
                                    const IapEvent.selectAnnually(),
                                  ),
                                ),
                                const SizedBox(height: 24),

                                // Start My Subscription Button
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
                                      onTap: () => context.read<IapBloc>().add(
                                        const IapEvent.purchase(),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(100),
                                      ),
                                      child: Center(
                                        child: Text(
                                          t.premium.start_my_subscription,
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
                                            content: Text(t.premium.restore),
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
