import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/smooth_video_player_widget.dart';
import '../../../../i18n/strings.g.dart';
import 'package:core_business/core_business.dart';
import '../../../../core/extensions/context_failure_ext.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../core/widgets/defer_init_widget.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/remote_config_service.dart';

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
            success: (message, isWeeklySelected, isVideoRevealed, _, __, ___, ____) {
              AppToast.showSuccess(message);
              if (context.mounted && Navigator.of(context).canPop()) {
                context.pop();
              }
            },
            error: (message, isWeeklySelected, isVideoRevealed, _, __, ___, ____) {
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

        // Close button top-right
        Positioned(
          top: MediaQuery.of(context).padding.top + 12,
          right: 16,
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
              _buildPriceRow(t),
              const SizedBox(height: 8),

              // Billed info
              Text(
                t.premium.billed_yearly,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontSize: 13,
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
                  color: Colors.white.withValues(alpha: 0.5),
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
        color: const Color(0xFF1A3A2A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF2ECC71).withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle,
            color: Color(0xFF2ECC71),
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            t.premium.save_up_to(percent: '92'),
            style: const TextStyle(
              color: Color(0xFF2ECC71),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(Translations t) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        // Currency symbol
        Text(
          'đ',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.5),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 6),
        // Price amount
        Text(
          t.premium.discount_price,
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
            color: Colors.white.withValues(alpha: 0.5),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSubscriptionButton(BuildContext context, Translations t) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1DB954), Color(0xFF1ED760)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1DB954).withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
            spreadRadius: -2,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.read<IapBloc>().add(const IapEvent.purchase(productId: 'buy_annualy_discount'));
          },
          borderRadius: BorderRadius.circular(28),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  t.premium.start_my_subscription,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
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
              ],
            ),
          ),
        ),
      ),
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
          // TODO: restore purchase
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
          color: Colors.white.withValues(alpha: 0.4),
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
