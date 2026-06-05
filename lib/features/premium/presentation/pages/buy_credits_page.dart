import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../i18n/strings.g.dart';
import 'package:core_business/core_business.dart';
import '../../../../core/extensions/context_failure_ext.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../core/widgets/defer_init_widget.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../gen/assets.gen.dart';
import '../widgets/credit_pack_row.dart';
import 'package:wiwi_havin_base_ads/wiwi_havin_base_ads.dart';

class BuyCreditsPage extends StatelessWidget {
  static const String path = '/buy_credits';
  static const String name = 'buy_credits';

  const BuyCreditsPage({super.key});

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
      child: BuyCreditsView(),
    );
  }
}

class BuyCreditsView extends StatefulWidget {
  const BuyCreditsView({super.key});

  @override
  State<BuyCreditsView> createState() => _BuyCreditsViewState();
}

class _BuyCreditsViewState extends State<BuyCreditsView> {
  int _selectedPackageIndex = 4; // Default to Most Popular (1000 Credits)

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<IapBloc>().add(const IapEvent.init());
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    final iapBlocState = context.watch<IapBloc>().state;
    final List<Product> regularProducts = iapBlocState.maybeWhen(
      ready: (isWeeklySelected, isVideoRevealed, weeklyProducts, yearlyProducts, discountCreditProducts, regularCreditProducts) => regularCreditProducts,
      success: (message, isWeeklySelected, isVideoRevealed, weeklyProducts, yearlyProducts, discountCreditProducts, regularCreditProducts) => regularCreditProducts,
      error: (message, isWeeklySelected, isVideoRevealed, weeklyProducts, yearlyProducts, discountCreditProducts, regularCreditProducts) => regularCreditProducts,
      orElse: () => const [],
    );

    String getProductPrice(int credits) {
      final matchCredits = '${credits}credits';
      for (final p in regularProducts) {
        final id = p.id.toLowerCase();
        if (id == matchCredits || id == 'com.vexa.ai.video.$matchCredits' || id.endsWith(matchCredits)) {
          return p.priceString;
        }
      }
      return '0';
    }

    // Helper to get package info based on index
    Map<String, dynamic> getPackageData(int index) {
      switch (index) {
        case 0:
          return {'credits': 70, 'price': getProductPrice(70)};
        case 1:
          return {'credits': 150, 'price': getProductPrice(150)};
        case 2:
          return {'credits': 350, 'price': getProductPrice(350)};
        case 3:
          return {'credits': 500, 'price': getProductPrice(500)};
        case 4:
          return {'credits': 1000, 'price': getProductPrice(1000)};
        case 5:
          return {'credits': 5000, 'price': getProductPrice(5000)};
        default:
          return {'credits': 1000, 'price': getProductPrice(1000)};
      }
    }

    return BlocConsumer<IapBloc, IapState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message, isWeeklySelected, isVideoRevealed, _, __, ___, ____) {
            AppToast.showSuccess(message);
          },
          error: (message, isWeeklySelected, isVideoRevealed, _, __, ___, ____) {
            context.handleFailure(
              Failure.business(code: message, message: ''),
            );
          },
        );
      },
      builder: (context, state) {
        final isInitial = state.maybeWhen(
          initial: () => true,
          orElse: () => false,
        );

        final isLoadingProducts = state.maybeWhen(
          loading: () => regularProducts.isEmpty,
          orElse: () => false,
        );

        final isPurchasing = state.maybeWhen(
          loading: () => regularProducts.isNotEmpty,
          orElse: () => false,
        );

        if (isInitial || isLoadingProducts) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
          );
        }

        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.black,
              body: Column(
                children: [
                  // Scrollable content
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          // Status bar spacing
                          SizedBox(
                            height: MediaQuery.of(context).padding.top + 16,
                          ),

                          // Top bar: Close button + Title centered
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Title centered
                                Text(
                                  t.premium.buy_credit,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                    onTap: () => context.pop(),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Subtitle description
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              t.premium.credit_desc,
                              style: const TextStyle(
                                color: AppColors.subText,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Subscription Discount Banner (green gradient)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            child: Image.asset(
                              Assets.images.bgBannerBuyCredit.path,
                              width: double.infinity,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Vertical selectable credit package list
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                CreditPackRow(
                                  title: t.premium.credit_70,
                                  videoEstimate: t.premium.approx_videos(
                                    count: 2,
                                  ),
                                  priceText: getProductPrice(70),
                                  isSelected: _selectedPackageIndex == 0,
                                  onTap: () =>
                                      setState(() => _selectedPackageIndex = 0),
                                ),
                                const SizedBox(height: 8),
                                CreditPackRow(
                                  title: t.premium.credit_150,
                                  videoEstimate: t.premium.approx_videos(
                                    count: 4,
                                  ),
                                  priceText: getProductPrice(150),
                                  isSelected: _selectedPackageIndex == 1,
                                  onTap: () =>
                                      setState(() => _selectedPackageIndex = 1),
                                ),
                                const SizedBox(height: 8),
                                CreditPackRow(
                                  title: t.premium.credit_350,
                                  videoEstimate: t.premium.approx_videos(
                                    count: 10,
                                  ),
                                  priceText: getProductPrice(350),
                                  isSelected: _selectedPackageIndex == 2,
                                  onTap: () =>
                                      setState(() => _selectedPackageIndex = 2),
                                ),
                                const SizedBox(height: 8),
                                CreditPackRow(
                                  title: t.premium.credit_500,
                                  videoEstimate: t.premium.approx_videos(
                                    count: 14,
                                  ),
                                  priceText: getProductPrice(500),
                                  isSelected: _selectedPackageIndex == 3,
                                  onTap: () =>
                                      setState(() => _selectedPackageIndex = 3),
                                ),
                                const SizedBox(height: 8),
                                CreditPackRow(
                                  title: t.premium.credit_1000,
                                  videoEstimate: t.premium.approx_videos(
                                    count: 27,
                                  ),
                                  priceText: getProductPrice(1000),
                                  tagText: t.premium.most_popular,
                                  isSelected: _selectedPackageIndex == 4,
                                  onTap: () =>
                                      setState(() => _selectedPackageIndex = 4),
                                ),
                                const SizedBox(height: 8),
                                CreditPackRow(
                                  title: t.premium.credit_5000,
                                  videoEstimate: t.premium.approx_videos(
                                    count: 142,
                                  ),
                                  priceText: getProductPrice(5000),
                                  tagText: t.premium.best_value,
                                  tagColors: const [
                                    Color(0xFF00C853),
                                    Color(0xFF69F0AE),
                                  ],
                                  isSelected: _selectedPackageIndex == 5,
                                  onTap: () =>
                                      setState(() => _selectedPackageIndex = 5),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),

                  // Sticky bottom: Buy Now + Footer
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Buy Now Button
                        Container(
                          height: 56,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary,
                                blurRadius: 12,
                                offset: Offset(0, 4),
                                spreadRadius: -3,
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                final data = getPackageData(
                                  _selectedPackageIndex,
                                );
                                final credits = data['credits'] as int;
                                final price = data['price'] as String;
                                context.read<IapBloc>().add(
                                  IapEvent.purchaseCredits(
                                    credits: credits,
                                    priceText: price,
                                  ),
                                );
                              },
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    Text(
                                      t.premium.buy_now,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Auto-Renewable text
                        Text(
                          t.premium.auto_renewable,
                          style: const TextStyle(
                            color: AppColors.subText,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 6),

                        // Privacy Policy | Term of Use | Restore
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => launchPrivacyPolicy(),
                              child: Text(
                                t.premium.privacy_policy,
                                style: const TextStyle(
                                  color: AppColors.subText,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: Text(
                                '|',
                                style: TextStyle(
                                  color: AppColors.activeTab,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => launchTermsOfUse(),
                              child: Text(
                                t.premium.terms_of_use,
                                style: const TextStyle(
                                  color: AppColors.subText,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: Text(
                                '|',
                                style: TextStyle(
                                  color: AppColors.activeTab,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                AppToast.showSuccess(t.premium.restore);
                              },
                              child: Text(
                                t.premium.restore,
                                style: const TextStyle(
                                  color: AppColors.subText,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // iTunes disclaimer
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            t.premium.itunes_disclaimer,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.35),
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isPurchasing)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withValues(alpha: 0.7),
                  child: Center(
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
                ),
              ),
          ],
        );
      },
    );
  }
}
