import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../i18n/strings.g.dart';
import 'package:core_business/core_business.dart';
import '../../../../core/extensions/context_failure_ext.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../core/widgets/smooth_video_player_widget.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/services/remote_config_service.dart';
import 'package:wiwi_havin_base_ads/wiwi_havin_base_ads.dart';

class GenerationBuyCreditsPage extends StatelessWidget {
  static const String path = '/generation-buy-credits';
  static const String name = 'generation_buy_credits';

  final String videoUrl;

  const GenerationBuyCreditsPage({super.key, this.videoUrl = ''});

  @override
  Widget build(BuildContext context) {
    return GenerationBuyCreditsView(videoUrl: videoUrl);
  }
}

class GenerationBuyCreditsView extends StatefulWidget {
  final String videoUrl;

  const GenerationBuyCreditsView({super.key, required this.videoUrl});

  @override
  State<GenerationBuyCreditsView> createState() =>
      _GenerationBuyCreditsViewState();
}

class _GenerationBuyCreditsViewState extends State<GenerationBuyCreditsView>
    with SingleTickerProviderStateMixin {
  static String get _placeholderVideoUrl =>
      sl<RemoteConfigService>().getBgIAPUrl();

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
              color: Colors.white.withValues(alpha: 0.20),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Text(
              t.premium.tap_to_reveal,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Transform.translate(
            offset: const Offset(0, -16),
            child: Transform.rotate(
              angle: 0.40,
              child: Lottie.asset(
                'assets/raw/click_animation.json',
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserEntity>(
      stream: sl<WatchProfileUseCase>()(),
      builder: (context, snapshot) {
        final isVip = snapshot.data?.isVip ?? false;
        final t = context.t;
        final double screenWidth = MediaQuery.of(context).size.width;
        final double cardWidth = (screenWidth - 32 - 10) / 2;
        final double childAspectRatio = cardWidth / 168;

        final iapBlocState = context.watch<IapBloc>().state;
        final List<Product> regularProducts =
            iapBlocState.mapOrNull(
              ready: (s) => s.regularCreditProducts,
              success: (s) => s.regularCreditProducts,
              error: (s) => s.regularCreditProducts,
            ) ??
            const [];

        final List<Product> discountProducts =
            iapBlocState.mapOrNull(
              ready: (s) => s.discountCreditProducts,
              success: (s) => s.discountCreditProducts,
              error: (s) => s.discountCreditProducts,
            ) ??
            const [];

        String getProductPrice(int credits) {
          final matchCredits = '${credits}credits';
          LogUtils.d(
            'GenerationBuyCreditsPage getProductPrice: credits=$credits, isVip=$isVip, '
            'iapBlocState=${iapBlocState.runtimeType}, '
            'discountProducts=[${discountProducts.map((p) => '${p.id}:${p.priceString}').join(", ")}], '
            'regularProducts=[${regularProducts.map((p) => '${p.id}:${p.priceString}').join(", ")}]',
          );
          if (isVip) {
            for (final p in discountProducts) {
              final id = p.id.toLowerCase();
              if (id == '${matchCredits}dis' ||
                  id == '${matchCredits}dis.andr' ||
                  id.endsWith('${matchCredits}dis') ||
                  id.endsWith('${matchCredits}dis.andr') ||
                  id.contains('${credits}creditsdis')) {
                LogUtils.d(
                  'GenerationBuyCreditsPage matched discount product: $id -> ${p.priceString}',
                );
                return p.priceString;
              }
            }
            for (final p in regularProducts) {
              final id = p.id.toLowerCase();
              if (id == matchCredits ||
                  id == '$matchCredits.andr' ||
                  id.endsWith(matchCredits) ||
                  id.endsWith('$matchCredits.andr')) {
                LogUtils.d(
                  'GenerationBuyCreditsPage matched fallback regular product: $id -> ${p.priceString}',
                );
                return p.priceString;
              }
            }
          } else {
            for (final p in regularProducts) {
              final id = p.id.toLowerCase();
              if (id == matchCredits ||
                  id == '$matchCredits.andr' ||
                  id.endsWith(matchCredits) ||
                  id.endsWith('$matchCredits.andr')) {
                LogUtils.d(
                  'GenerationBuyCreditsPage matched regular product: $id -> ${p.priceString}',
                );
                return p.priceString;
              }
            }
            for (final p in discountProducts) {
              final id = p.id.toLowerCase();
              if (id == '${matchCredits}dis' ||
                  id == '${matchCredits}dis.andr' ||
                  id.endsWith('${matchCredits}dis') ||
                  id.endsWith('${matchCredits}dis.andr') ||
                  id.contains('${credits}creditsdis')) {
                LogUtils.d(
                  'GenerationBuyCreditsPage matched fallback discount product: $id -> ${p.priceString}',
                );
                return p.priceString;
              }
            }
          }
          LogUtils.d('GenerationBuyCreditsPage NO MATCH for credits=$credits');
          return '...';
        }

        String translateSuccessMessage(
          BuildContext context,
          String messageKey,
        ) {
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
            if (creditsStr == '70')
              creditLabel = t.premium.credit_70;
            else if (creditsStr == '150')
              creditLabel = t.premium.credit_150;
            else if (creditsStr == '350')
              creditLabel = t.premium.credit_350;
            else if (creditsStr == '500')
              creditLabel = t.premium.credit_500;
            else if (creditsStr == '1000')
              creditLabel = t.premium.credit_1000;
            else if (creditsStr == '5000')
              creditLabel = t.premium.credit_5000;

            return t.premium.purchase_success(item: creditLabel);
          }
          return messageKey;
        }

        // Package details mapping
        List<Map<String, dynamic>> packages = [
          {
            'credits': 70,
            'title': t.premium.credit_70,
            'approx': t.premium.approx_videos(count: 2),
            'price': getProductPrice(70),
            'tag': null,
          },
          {
            'credits': 150,
            'title': t.premium.credit_150,
            'approx': t.premium.approx_videos(count: 4),
            'price': getProductPrice(150),
            'tag': null,
          },
          {
            'credits': 350,
            'title': t.premium.credit_350,
            'approx': t.premium.approx_videos(count: 10),
            'price': getProductPrice(350),
            'tag': null,
          },
          {
            'credits': 500,
            'title': t.premium.credit_500,
            'approx': t.premium.approx_videos(count: 14),
            'price': getProductPrice(500),
            'tag': null,
          },
          {
            'credits': 1000,
            'title': t.premium.credit_1000,
            'approx': t.premium.approx_videos(count: 27),
            'price': getProductPrice(1000),
            'tag': t.premium.most_popular,
          },
          {
            'credits': 5000,
            'title': t.premium.credit_5000,
            'approx': t.premium.approx_videos(count: 142),
            'price': getProductPrice(5000),
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
                          AppToast.showSuccess(
                            translateSuccessMessage(context, message),
                          );
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
                  initial: () => const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
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
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primary,
                              ),
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
                    ],
                  ),
                  orElse: () {
                    return Stack(
                      children: [
                        // 1. Fullscreen Video background
                        Positioned.fill(
                          child: SmoothVideoPlayerWidget(
                            videoUrl: widget.videoUrl.isNotEmpty
                                ? widget.videoUrl
                                : _placeholderVideoUrl,
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
                                  color: Colors.black.withValues(
                                    alpha: _opacityAnimation.value,
                                  ),
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
                                  const SizedBox(height: 80),
                                  // Centered Tap To Reveal Button
                                  Center(child: _buildTapToReveal()),
                                  // Titles
                                  Text(
                                    t.premium.buy_more_credit,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 4),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
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
                                  // 3x2 Packages Grid
                                  GridView.count(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: childAspectRatio,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
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
                          child: Material(
                            color: Colors.black.withValues(alpha: 0.3),
                            shape: const CircleBorder(),
                            child: InkWell(
                              onTap: () => context.pop(),
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
                      ],
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class GenerationCreditPackCard extends StatelessWidget {
  final String title;
  final String videoEstimate;
  final String priceText;
  final String? tagText;
  final List<Color>? tagColors;
  final VoidCallback onTap;

  const GenerationCreditPackCard({
    super.key,
    required this.title,
    required this.videoEstimate,
    required this.priceText,
    this.tagText,
    this.tagColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Card Container
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFF778877).withValues(alpha: 0.53),
                width: 1.2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Shiny Coin Icon
                  Image.asset(
                    Assets.images.icCredit.path,
                    width: 36,
                    height: 36,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 6),
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
                  const SizedBox(height: 10),
                  // Price Button
                  Container(
                    width: double.infinity,
                    height: 32,
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
                ],
              ),
            ),
          ),

          // Corner Tag Badge on top-right
          if (tagText != null)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 100,
                height: 20,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:
                        tagColors ??
                        [const Color(0xFFff6320), const Color(0xFFfae123)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    tagText!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
