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
import '../widgets/buy_credit_now_button.dart';
import 'buy_credits_page.dart';

class IapPage extends StatelessWidget {
  static const String path = '/iap';
  static const String name = 'iap';
  static const String discountPath = '/discount';
  static const String discountName = 'discount';

  final String videoUrl;
  final bool fromSplash;
  final bool showDiscountInit;

  const IapPage({
    super.key,
    this.videoUrl = '',
    this.fromSplash = false,
    this.showDiscountInit = false,
  });

  @override
  Widget build(BuildContext context) {
    return IapView(
      videoUrl: videoUrl,
      fromSplash: fromSplash,
      showDiscountInit: showDiscountInit,
    );
  }
}

class IapView extends StatefulWidget {
  final String videoUrl;
  final bool fromSplash;
  final bool showDiscountInit;

  const IapView({
    super.key,
    required this.videoUrl,
    this.fromSplash = false,
    this.showDiscountInit = false,
  });

  @override
  State<IapView> createState() => _IapViewState();
}

class _IapViewState extends State<IapView> {
  late bool _showDiscount;

  @override
  void initState() {
    super.initState();
    _showDiscount = widget.showDiscountInit;
  }

  void _handleClose() {
    if (!_showDiscount) {
      setState(() {
        _showDiscount = true;
      });
    } else {
      if (context.mounted && Navigator.of(context).canPop()) {
        Navigator.of(context).pop(false);
      }
    }
  }

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
      if (creditsStr == '70') {
        creditLabel = t.premium.credit_70;
      } else if (creditsStr == '150') {
        creditLabel = t.premium.credit_150;
      } else if (creditsStr == '350') {
        creditLabel = t.premium.credit_350;
      } else if (creditsStr == '500') {
        creditLabel = t.premium.credit_500;
      } else if (creditsStr == '1000') {
        creditLabel = t.premium.credit_1000;
      } else if (creditsStr == '5000') {
        creditLabel = t.premium.credit_5000;
      }

      return t.premium.purchase_success(item: creditLabel);
    }
    return messageKey;
  }



  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _handleClose();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<IapBloc, IapState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (
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
                  AppToast.showSuccess(
                    _translateSuccessMessage(context, message),
                  );
                }
                if (context.mounted && Navigator.of(context).canPop()) {
                  Navigator.of(context).pop(true);
                }
              },
              error: (
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
                        const CircularProgressIndicator(),
                        const SizedBox(height: 16),
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
                return Stack(
                  children: [
                    // 1. Video background (Discount) - rendered underneath the IAP video
                    if (_showDiscount)
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        height: MediaQuery.of(context).size.height,
                        child: SmoothVideoPlayerWidget(
                          key: const ValueKey('discount_video'),
                          videoUrl: sl<RemoteConfigService>().getBgDiscountUrl(),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                          autoPlay: true,
                          loop: true,
                          showMuteButton: false,
                          showPlayPauseButton: false,
                          playMuted: true,
                          showBufferingIndicator: false,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                        ),
                      ),

                    // 2. Video background (IAP) - fades out smoothly to reveal Discount video
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: AnimatedOpacity(
                        opacity: _showDiscount ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOutCubic,
                        child: IgnorePointer(
                          ignoring: _showDiscount,
                          child: SmoothVideoPlayerWidget(
                            key: const ValueKey('iap_video'),
                            videoUrl: widget.videoUrl.isNotEmpty
                                ? widget.videoUrl
                                : sl<RemoteConfigService>().getBgIAPUrl(),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            autoPlay: true,
                            loop: true,
                            showMuteButton: false,
                            showPlayPauseButton: false,
                            playMuted: true,
                            showBufferingIndicator: false,
                            height: MediaQuery.of(context).size.height * 0.5,
                          ),
                        ),
                      ),
                    ),

                    // 2. Content view switcher
                    Positioned.fill(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 600),
                        switchInCurve: Curves.easeInOutCubic,
                        switchOutCurve: Curves.easeInOutCubic,
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0.0, 0.08),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            ),
                          );
                        },
                        child: _showDiscount
                            ? Stack(
                                key: const ValueKey('discount_content'),
                                children: [
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: _buildDiscountContent(context, t, state),
                                  ),
                                ],
                              )
                            : _buildIapContent(context, t, state),
                      ),
                    ),

                    // 3. Fixed close button & restore button top row
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 16,
                      left: 16,
                      right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Close Button
                          Material(
                            color: Colors.black.withValues(alpha: 0.3),
                            shape: const CircleBorder(),
                            child: InkWell(
                              onTap: _handleClose,
                              customBorder: const CircleBorder(),
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

                          // Restore Pill Button
                          if (!_showDiscount)
                            Material(
                              color: Colors.black.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(100),
                              child: InkWell(
                                onTap: () {
                                  context.read<IapBloc>().add(
                                    const IapEvent.restore(),
                                  );
                                },
                                borderRadius: BorderRadius.circular(100),
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

  Widget _buildIapContent(BuildContext context, Translations t, IapState state) {
    return Stack(
      key: const ValueKey('iap_content'),
      children: [
        // Black fade overlay
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

        // Main scrollable content
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constraints) {
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

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const Spacer(),
                        Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
                              BuyCreditNowButton(
                                onTap: () => context.push(BuyCreditsPage.path),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        _buildCheckItem(t.premium.unlock_templates),
                                        const SizedBox(height: 8),
                                        _buildCheckItem(t.premium.discount_packs),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        _buildCheckItem(t.premium.fast_generation),
                                        const SizedBox(height: 8),
                                        _buildCheckItem(t.premium.videos_per_year),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
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
                                  final productId = weeklyProducts.isNotEmpty
                                      ? weeklyProducts.first.id
                                      : (Platform.isIOS
                                          ? 'buy_weakly'
                                          : 'buy_weekly.andr');
                                  context.read<IapBloc>().add(
                                    IapEvent.purchase(productId: productId),
                                  );
                                },
                              ),
                              const SizedBox(height: 8),
                              SubscriptionPackageCard(
                                title: t.premium.annually,
                                description: t.premium.annually_desc,
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
                                  final productId = yearlyProducts.isNotEmpty
                                      ? yearlyProducts.first.id
                                      : (Platform.isIOS
                                          ? 'buy_annualy'
                                          : 'buy_annualy.andr');
                                  context.read<IapBloc>().add(
                                    IapEvent.purchase(productId: productId),
                                  );
                                },
                              ),
                              const SizedBox(height: 24),
                              GradientButton(
                                label: isWeekly
                                    ? t.premium.start_free_trial
                                    : t.premium.start_my_subscription,
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
                                          ? weeklyProducts.first.id
                                          : (Platform.isIOS
                                              ? 'buy_weakly'
                                              : 'buy_weekly.andr'))
                                      : (yearlyProducts.isNotEmpty
                                          ? yearlyProducts.first.id
                                          : (Platform.isIOS
                                              ? 'buy_annualy'
                                              : 'buy_annualy.andr'));
                                  context.read<IapBloc>().add(
                                    IapEvent.purchase(productId: productId),
                                  );
                                },
                              ),
                              const SizedBox(height: 8),
                              Text(
                                t.premium.auto_renewable,
                                style: const TextStyle(
                                  color: AppColors.activeTab,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => launchPrivacyPolicy(),
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
                                    padding: EdgeInsets.symmetric(horizontal: 8),
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
      ],
    );
  }

  Widget _buildDiscountContent(BuildContext context, Translations t, IapState state) {
    final List<Product> yearlyProducts = state.mapOrNull(
      ready: (s) => s.yearlyProducts,
      success: (s) => s.yearlyProducts,
      error: (s) => s.yearlyProducts,
    ) ?? const [];

    String discountPrice = '...';
    for (final p in yearlyProducts) {
      final id = p.id.toLowerCase();
      if (id.contains('discount') || id.contains('dis') || id == 'buy_annualy_discount') {
        discountPrice = p.priceString;
        break;
      }
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withValues(alpha: 0.0),
            Colors.black.withValues(alpha: 0.7),
            Colors.black.withValues(alpha: 0.95),
            Colors.black,
          ],
          stops: const [0.0, 0.25, 0.5, 0.7],
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 60, 24, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSaveBadge(t),
              const SizedBox(height: 20),
              _buildPriceRow(discountPrice, t),
              const SizedBox(height: 8),
              Text(
                t.premium.billed_yearly,
                style: const TextStyle(
                  color: AppColors.subText,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 24),
              _buildSubscriptionButton(context, t),
              const SizedBox(height: 16),
              Text(
                t.premium.auto_renewable.split('.').first,
                style: const TextStyle(
                  color: AppColors.subText,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 6),
              _buildFooterLinks(context, t),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaveBadge(Translations t) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.icons.icTrendingDown,
            width: 14,
            height: 14,
          ),
          const SizedBox(width: 8),
          ShaderMask(
            shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              t.premium.save_up_to(percent: '92'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String discountPrice, Translations t) {
    if (discountPrice == '...') {
      return const Text(
        '...',
        style: TextStyle(
          color: Colors.white,
          fontSize: 48,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          discountPrice,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
            height: 1.0,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          t.premium.discount_price_suffix,
          style: const TextStyle(
            color: AppColors.subText,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSubscriptionButton(BuildContext context, Translations t) {
    return GradientButton(
      label: t.premium.start_my_subscription,
      width: double.infinity,
      gradient: const LinearGradient(
        colors: [AppColors.primary, AppColors.secondary],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.3,
      ),
      trailingIcon: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 16,
        ),
      ),
      onPressed: () {
        final productId = Platform.isIOS ? 'buy_annualy_discount' : 'buy_annualy_discount.andr';
        context.read<IapBloc>().add(IapEvent.purchase(productId: productId));
      },
    );
  }

  Widget _buildFooterLinks(BuildContext context, Translations t) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildFooterLink(t.premium.privacy_policy, () {
          launchPrivacyPolicy();
        }),
        _buildDivider(),
        _buildFooterLink(t.premium.terms_of_use, () {
          launchTermsOfUse();
        }),
        _buildDivider(),
        _buildFooterLink(t.premium.restore, () {
          context.read<IapBloc>().add(const IapEvent.restore());
        }),
      ],
    );
  }

  Widget _buildFooterLink(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.subText,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        '|',
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.25),
          fontSize: 12,
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
