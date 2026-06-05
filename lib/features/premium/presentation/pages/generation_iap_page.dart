import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/smooth_video_player_widget.dart';
import '../../../../i18n/strings.g.dart';
import 'package:core_business/core_business.dart';
import 'package:wiwi_havin_base_ads/wiwi_havin_base_ads.dart';
import '../../../../core/extensions/context_failure_ext.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../core/constants/app_constants.dart';
import '../widgets/subscription_package_card.dart';
import 'generation_buy_credits_page.dart';
import 'discount_page.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/services/remote_config_service.dart';

class GenerationIapPage extends StatelessWidget {
  static const String path = '/generation-iap';
  static const String name = 'generation_iap';

  final String videoUrl;

  const GenerationIapPage({super.key, this.videoUrl = ''});

  @override
  Widget build(BuildContext context) {
    return GenerationIapView(videoUrl: videoUrl);
  }
}

class GenerationIapView extends StatefulWidget {
  final String videoUrl;

  const GenerationIapView({super.key, required this.videoUrl});

  @override
  State<GenerationIapView> createState() => _GenerationIapViewState();
}

class _GenerationIapViewState extends State<GenerationIapView> with SingleTickerProviderStateMixin {
  static String get _placeholderVideoUrl =>
      sl<RemoteConfigService>().getBgIAPUrl();

  late AnimationController _revealController;
  late Animation<double> _blurAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<IapBloc>().add(const IapEvent.init());
    });
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

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (context.canPop()) {
          context.pop();
        } else {
          context.pushReplacementNamed(DiscountPage.name);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<IapBloc, IapState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (message, isWeeklySelected, isVideoRevealed, _, __, ___, ____) {
                AppToast.showSuccess(message);
              },
              error: (message, isWeeklySelected, isVideoRevealed, _, __, ___, ____) {
                context.handleFailure(Failure.business(code: message, message: ''));
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
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
                bool isWeekly = false;
                List<Product> weeklyProducts = [];
                List<Product> yearlyProducts = [];

                state.mapOrNull(
                  ready: (s) {
                    isWeekly = s.isWeeklySelected;
                    weeklyProducts = s.weeklyProducts;
                    yearlyProducts = s.yearlyProducts;
                  },
                  success: (s) {
                    isWeekly = s.isWeeklySelected;
                    weeklyProducts = s.weeklyProducts;
                    yearlyProducts = s.yearlyProducts;
                  },
                  error: (s) {
                    isWeekly = s.isWeeklySelected;
                    weeklyProducts = s.weeklyProducts;
                    yearlyProducts = s.yearlyProducts;
                  },
                );

                final weeklyPrice = weeklyProducts.isNotEmpty ? weeklyProducts.first.priceString : t.premium.weekly_price;
                final yearlyPrice = yearlyProducts.isNotEmpty ? yearlyProducts.first.priceString : t.premium.annually_price;

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

                    // 3. Scrollable contents
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
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    16,
                                    MediaQuery.of(context).padding.top + 64,
                                    16,
                                    MediaQuery.of(context).padding.bottom + 16,
                                  ),
                                  child: Column(
                                    children: [
                                      // Centered Tap To Reveal Button
                                      Center(child: _buildTapToReveal()),
                                      
                                      const Spacer(),

                                      // Main information Card
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Title PRO
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
                                                  text: '${t.splash.appName.toUpperCase()} ',
                                                  style: const TextStyle(color: Colors.white),
                                                ),
                                                TextSpan(
                                                  text: t.premium.pro_title.toUpperCase(),
                                                  style: const TextStyle(color: Color(0xFF24C780)), // Bright Cyan/Green
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          // 50% OFF
                                          Text(
                                            t.premium.discount_title,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 50,
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: 1.2,
                                              height: 1.1,
                                              fontFamily: 'Inter',
                                            ),
                                          ),
                                          // CREDIT PRICES
                                          Text(
                                            t.premium.discount_subtitle,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          const SizedBox(height: 12),

                                          // Glassmorphism Buy Credit Now pill button
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
                                              child: Container(
                                                height: 38,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      const Color(0xFF24C780).withValues(alpha: 0.2),
                                                      const Color(0xFF2BC5C5).withValues(alpha: 0.2),
                                                    ],
                                                  ),
                                                  borderRadius: BorderRadius.circular(100),
                                                  border: Border.all(
                                                    color: const Color(0xFF24C780),
                                                    width: 1.2,
                                                  ),
                                                ),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    onTap: () => context.push(
                                                      '${GenerationBuyCreditsPage.path}?videoUrl=${Uri.encodeComponent(widget.videoUrl)}',
                                                    ),
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 18),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            t.premium.buy_credit_now,
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                          const SizedBox(width: 8),
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            decoration: const BoxDecoration(
                                                              color: Colors.white,
                                                              shape: BoxShape.circle,
                                                            ),
                                                            child: const Icon(
                                                              Icons.arrow_forward_ios_rounded,
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
                                          const SizedBox(height: 24),

                                          // Weekly Package
                                          SubscriptionPackageCard(
                                            title: t.premium.weekly,
                                            description: t.premium.weekly_desc,
                                            price: weeklyPrice,
                                            suffix: t.premium.weekly_suffix,
                                            tagText: t.premium.best_value,
                                            tagColors: const [
                                              Color(0xFF24C780),
                                              Color(0xFF2BC5C5),
                                            ],
                                            isSelected: isWeekly,
                                            onTap: () {
                                              context.read<IapBloc>().add(const IapEvent.selectWeekly());
                                              context.read<IapBloc>().add(const IapEvent.purchase());
                                            },
                                          ),
                                          const SizedBox(height: 10),

                                          // Annually Package
                                          SubscriptionPackageCard(
                                            title: t.premium.annually,
                                            description: t.premium.annually_desc,
                                            price: yearlyPrice,
                                            suffix: t.premium.annually_suffix,
                                            tagText: t.premium.save_80,
                                            tagColors: const [
                                              Color(0xFFFFB300),
                                              Color(0xFFFF8F00),
                                            ],
                                            isSelected: !isWeekly,
                                            onTap: () {
                                              context.read<IapBloc>().add(const IapEvent.selectAnnually());
                                              context.read<IapBloc>().add(const IapEvent.purchase());
                                            },
                                          ),
                                          const SizedBox(height: 24),

                                          // Start Free Trial Button
                                          Container(
                                            height: 56,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                colors: [Color(0xFF24C780), Color(0xFF2BC5C5)],
                                              ),
                                              borderRadius: BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color(0xFF24C780).withValues(alpha: 0.3),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 4),
                                                ),
                                              ],
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () => context.read<IapBloc>().add(
                                                      const IapEvent.purchase(),
                                                    ),
                                                borderRadius: BorderRadius.circular(100),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      const Spacer(),
                                                      Text(
                                                        t.premium.start_my_subscription,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      const Icon(
                                                        Icons.arrow_forward_rounded,
                                                        color: Colors.white,
                                                        size: 24,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12),

                                          // Footer Info
                                          Text(
                                            t.premium.auto_renewable,
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () => launchPrivacyPolicy(),
                                                child: Text(
                                                  t.premium.privacy_policy,
                                                  style: const TextStyle(
                                                    color: Colors.white60,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8),
                                                child: Text('|', style: TextStyle(color: Colors.white38)),
                                              ),
                                              GestureDetector(
                                                onTap: () => launchTermsOfUse(),
                                                child: Text(
                                                  t.premium.terms_of_use,
                                                  style: const TextStyle(
                                                    color: Colors.white60,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8),
                                                child: Text('|', style: TextStyle(color: Colors.white38)),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  AppToast.showSuccess(t.premium.restore);
                                                },
                                                child: Text(
                                                  t.premium.restore,
                                                  style: const TextStyle(
                                                    color: Colors.white60,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // 4. Header buttons: Back & Restore
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 16,
                      left: 16,
                      right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (context.canPop()) {
                                context.pop();
                              } else {
                                context.pushReplacementNamed(DiscountPage.name);
                              }
                            },
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
                          GestureDetector(
                            onTap: () {
                              AppToast.showSuccess(t.premium.restore);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(100),
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
                        ],
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
