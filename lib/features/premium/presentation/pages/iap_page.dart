import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:ai_video_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/smooth_video_player_widget.dart';
import '../../../../i18n/strings.g.dart';
import 'package:core_business/core_business.dart';
import 'package:wiwi_havin_base_ads/wiwi_havin_base_ads.dart';
import '../../../../core/extensions/context_failure_ext.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/remote_config_service.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../widgets/subscription_package_card.dart';
import 'buy_credits_page.dart';
import 'discount_page.dart';

class IapPage extends StatelessWidget {
  static const String path = '/iap';
  static const String name = 'iap';

  final String videoUrl;

  const IapPage({super.key, this.videoUrl = ''});

  @override
  Widget build(BuildContext context) {
    return IapView(videoUrl: videoUrl);
  }
}

class IapView extends StatelessWidget {
  final String videoUrl;

  /// Video URL from Remote Config (preloaded during splash).
  /// Falls back to default URL if Remote Config has no value.
  static String get _placeholderVideoUrl =>
      sl<RemoteConfigService>().getBgIAPUrl();

  const IapView({super.key, required this.videoUrl});

  String _translateSuccessMessage(BuildContext context, String messageKey) {
    final t = context.t;
    if (messageKey == 'success_weekly') {
      return t.premium.purchase_success(item: t.premium.weekly);
    }
    if (messageKey == 'success_yearly') {
      return t.premium.purchase_success(item: t.premium.annually);
    }
    if (messageKey.startsWith('success_credits_')) {
      final creditsStr = messageKey.replaceFirst('success_credits_', '');
      String creditLabel = '$creditsStr Credits';
      if (creditsStr == '70') creditLabel = t.premium.credit_70;
      else if (creditsStr == '150') creditLabel = t.premium.credit_150;
      else if (creditsStr == '350') creditLabel = t.premium.credit_350;
      else if (creditsStr == '500') creditLabel = t.premium.credit_500;
      else if (creditsStr == '1000') creditLabel = t.premium.credit_1000;
      else if (creditsStr == '5000') creditLabel = t.premium.credit_5000;
      
      return t.premium.purchase_success(item: creditLabel);
    }
    return messageKey;
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return WillPopScope(
      onWillPop: () async {
        context.pushReplacementNamed(DiscountPage.name);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<IapBloc, IapState>(
          listener: (context, state) {
            state.whenOrNull(
              success:
                  (
                    message,
                    isWeeklySelected,
                    isVideoRevealed,
                    _,
                    __,
                    ___,
                    ____,
                    _____,
                  ) {
                    if (message != 'already_vip') {
                      AppToast.showSuccess(_translateSuccessMessage(context, message));
                    }
                    if (context.mounted && Navigator.of(context).canPop()) {
                      context.pop();
                    }
                  },
              error:
                  (
                    message,
                    isWeeklySelected,
                    isVideoRevealed,
                    _,
                    __,
                    ___,
                    ____,
                    _____,
                  ) {
                    context.handleFailure(
                      Failure.business(code: message, message: ''),
                    );
                  },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => Stack(
                children: [
                  Positioned.fill(child: Container(color: Colors.black)),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text(
                          t.common.processing,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
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

                final weeklyPrice = weeklyProducts.isNotEmpty
                    ? weeklyProducts.first.priceString
                    : '...';
                final yearlyPrice = yearlyProducts.isNotEmpty
                    ? yearlyProducts.first.priceString
                    : '...';
                LogUtils.d(
                  'IapPage build: weeklyPrice=$weeklyPrice (${weeklyProducts.isNotEmpty ? "FROM STORE" : "FALLBACK HARDCODED"}), yearlyPrice=$yearlyPrice (${yearlyProducts.isNotEmpty ? "FROM STORE" : "FALLBACK HARDCODED"})',
                );

                return Stack(
                  children: [
                    // 1. Video background - top 50%
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: SmoothVideoPlayerWidget(
                        videoUrl: _placeholderVideoUrl,
                        fit: BoxFit.cover,
                        autoPlay: true,
                        loop: true,
                        showMuteButton: false,
                        showPlayPauseButton: false,
                        playMuted: true,
                      ),
                    ),

                    // 2. Black fade overlay (top 50% bottom transition)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.0),
                              Colors.black.withValues(alpha: 0.2),
                              Colors.black.withValues(alpha: 0.6),
                              Colors.black,
                            ],
                            stops: const [0.0, 0.5, 0.8, 1.0],
                          ),
                        ),
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
                                        8,
                                        0,
                                        8,
                                        12,
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
                                              fontFamily: 'Inter',
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
                                                          .withValues(
                                                            alpha: 0.3,
                                                          ),
                                                      AppColors.primary
                                                          .withValues(
                                                            alpha: 0.3,
                                                          ),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        100,
                                                      ),
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
                                                          const EdgeInsets.fromLTRB(
                                                            18,
                                                            0,
                                                            6,
                                                            0,
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
                                                            width: 12,
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
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets.all(
                                                                    2.0,
                                                                  ),
                                                              child: SvgPicture.asset(
                                                                Assets
                                                                    .icons
                                                                    .icRightArrow,
                                                                width: 14,
                                                                height: 14,
                                                              ),
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    _buildCheckItem(
                                                      t
                                                          .premium
                                                          .unlock_templates,
                                                    ),
                                                    const SizedBox(height: 8),
                                                    _buildCheckItem(
                                                      t.premium.discount_packs,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    _buildCheckItem(
                                                      t.premium.fast_generation,
                                                    ),
                                                    const SizedBox(height: 8),
                                                    _buildCheckItem(
                                                      t.premium.videos_per_year,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),

                                          // Weekly Subscription Package (Unselected)
                                          SubscriptionPackageCard(
                                            title: t.premium.weekly,
                                            description: t.premium.weekly_desc,
                                            price: weeklyPrice,
                                            suffix: t.premium.weekly_suffix,
                                            tagText: t.premium.best_value,
                                            tagColors: const [
                                              Color(0xFF2AC5C4),
                                              Color(0xFF28C4B3),
                                            ],
                                            isSelected: isWeekly,
                                            onTap: () {
                                              context.read<IapBloc>().add(
                                                const IapEvent.selectWeekly(),
                                              );
                                              final productId =
                                                  weeklyProducts.isNotEmpty
                                                  ? weeklyProducts.first.id
                                                  : (Platform.isIOS
                                                        ? 'buy_weakly'
                                                        : 'buy_weekly.andr');
                                              context.read<IapBloc>().add(
                                                IapEvent.purchase(
                                                  productId: productId,
                                                ),
                                              );
                                            },
                                          ),
                                          const SizedBox(height: 8),

                                          // Annually Subscription Package (Selected)
                                          SubscriptionPackageCard(
                                            title: t.premium.annually,
                                            description:
                                                t.premium.annually_desc,
                                            price: yearlyPrice,
                                            suffix: t.premium.annually_suffix,
                                            tagText: t.premium.save_80,
                                            tagColors: const [
                                              Color(0xFFff6320),
                                              Color(0xFFfae123),
                                            ],
                                            isSelected: !isWeekly,
                                            onTap: () {
                                              context.read<IapBloc>().add(
                                                const IapEvent.selectAnnually(),
                                              );
                                              final productId =
                                                  yearlyProducts.isNotEmpty
                                                  ? yearlyProducts.first.id
                                                  : (Platform.isIOS
                                                        ? 'buy_annualy'
                                                        : 'buy_annualy.andr');
                                              context.read<IapBloc>().add(
                                                IapEvent.purchase(
                                                  productId: productId,
                                                ),
                                              );
                                            },
                                          ),
                                          const SizedBox(height: 24),

                                          // Start My Subscription Button (Crown + Text + Arrow)
                                          GradientButton(
                                            label: isWeekly
                                                ? t.premium.start_free_trial
                                                : t
                                                      .premium
                                                      .start_my_subscription,
                                            leadingIcon: !isWeekly
                                                ? SvgPicture.asset(
                                                    Assets.icons.icCrown,
                                                    width: 18,
                                                    height: 18,
                                                  )
                                                : null,
                                            width: double.infinity,
                                            gradient: AppColors.primaryGradient,
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            trailingIcon: const Icon(
                                              Icons.arrow_forward_rounded,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                            onPressed: () {
                                              final productId = isWeekly
                                                  ? (weeklyProducts.isNotEmpty
                                                        ? weeklyProducts
                                                              .first
                                                              .id
                                                        : (Platform.isIOS
                                                              ? 'buy_weakly'
                                                              : 'buy_weekly.andr'))
                                                  : (yearlyProducts.isNotEmpty
                                                        ? yearlyProducts
                                                              .first
                                                              .id
                                                        : (Platform.isIOS
                                                              ? 'buy_annualy'
                                                              : 'buy_annualy.andr'));
                                              context.read<IapBloc>().add(
                                                IapEvent.purchase(
                                                  productId: productId,
                                                ),
                                              );
                                            },
                                          ),
                                          const SizedBox(height: 8),

                                          // Footer Links
                                          Text(
                                            t.premium.auto_renewable,
                                            style: const TextStyle(
                                              color: AppColors.activeTab,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () =>
                                                    launchPrivacyPolicy(),
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
                                                onTap: () => launchTermsOfUse(),
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
                                                  context.read<IapBloc>().add(
                                                    const IapEvent.restore(),
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
                          );
                        },
                      ),
                    ),

                    // 3. Top Header Row: Close (Left), Restore (Right)
                    // LAST in Stack so it renders on top and receives touch events
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 16,
                      left: 8,
                      right: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Back Close Button
                          GestureDetector(
                            onTap: () {
                              context.pushReplacementNamed(DiscountPage.name);
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.3),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),

                          // Restore Pill Button
                          GestureDetector(
                            onTap: () {
                              context.read<IapBloc>().add(
                                const IapEvent.restore(),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.3),
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

  Widget _buildCheckItem(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.rotate(
          angle: -pi / 4,
          child: Container(width: 5, height: 5, color: AppColors.primary),
        ),
        const SizedBox(width: 3),
        Flexible(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
