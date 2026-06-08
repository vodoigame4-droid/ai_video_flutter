import 'dart:io';
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
import '../../../../core/widgets/defer_init_widget.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/remote_config_service.dart';
import '../../../../core/widgets/gradient_button.dart';

class DiscountPage extends StatefulWidget {
  static const String path = '/discount';
  static const String name = 'discount';

  const DiscountPage({super.key});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<IapBloc>().add(const IapEvent.init());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const DeferInitWidget(
      placeholder: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      ),
      child: DiscountView(),
    );
  }
}

class DiscountView extends StatelessWidget {
  const DiscountView({super.key});

  /// Video URL from Remote Config (preloaded during splash).
  /// Falls back to default URL if Remote Config has no value.
  static String get _placeholderVideoUrl =>
      sl<RemoteConfigService>().getBgDiscountUrl();

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

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: BlocConsumer<IapBloc, IapState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (message, isWeeklySelected, isVideoRevealed, _, __, ___, ____, _____) {
              AppToast.showSuccess(_translateSuccessMessage(context, message));
              if (context.mounted && Navigator.of(context).canPop()) {
                context.pop();
              }
            },
            error: (message, isWeeklySelected, isVideoRevealed, _, __, ___, ____, _____) {
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
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
            loading: () => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
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
            orElse: () => _buildContent(context, t),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, Translations t) {
    return Stack(
      children: [
        // Video background – fit full width, align to very top (extends behind status bar)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: MediaQuery.of(context).size.height,
          child: SmoothVideoPlayerWidget(
            videoUrl: _placeholderVideoUrl,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            autoPlay: true,
            loop: true,
            showMuteButton: false,
            showPlayPauseButton: false,
            playMuted: true,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),

        // Close button top-left
        Positioned(
          top: MediaQuery.of(context).padding.top + 12,
          left: 16,
          child: Material(
            color: Colors.white.withValues(alpha: 0.12),
            shape: const CircleBorder(),
            child: InkWell(
              onTap: () {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
              },
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
        ),

        // Bottom content panel
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: _buildBottomPanel(context, t),
        ),
      ],
    );
  }

  Widget _buildBottomPanel(BuildContext context, Translations t) {
    final iapBlocState = context.watch<IapBloc>().state;
    final List<Product> yearlyProducts = iapBlocState.mapOrNull(
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
              // "Save Up To 92%" badge
              _buildSaveBadge(t),
              const SizedBox(height: 20),

              // Price row: đ 799.000 /year
              _buildPriceRow(discountPrice, t),
              const SizedBox(height: 8),

              // Billed info
              Text(
                t.premium.billed_yearly,
                style: TextStyle(
                  color: AppColors.subText,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 24),

              // "Start My Subscription" button
              _buildSubscriptionButton(context, t),
              const SizedBox(height: 16),

              // Auto-Renewable text
              Text(
                t.premium.auto_renewable.split('.').first,
                style: TextStyle(
                  color: AppColors.subText,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 6),

              // Privacy Policy | Term of Use | Restore
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
        color: AppColors.white.withValues(alpha: 0.1),
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
        // /year suffix
        Text(
          t.premium.discount_price_suffix,
          style: TextStyle(
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
        style: TextStyle(
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
}
