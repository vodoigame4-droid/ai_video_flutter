import 'dart:io';
import 'package:ai_video_flutter/features/premium/presentation/pages/iap_page.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/remote_config_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../i18n/strings.g.dart';
import 'package:core_business/core_business.dart';
import '../../../../core/extensions/context_failure_ext.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../gen/assets.gen.dart';
import '../widgets/credit_pack_row.dart';
import 'package:wiwi_havin_base_ads/wiwi_havin_base_ads.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class BuyCreditsPage extends StatelessWidget {
  static const String path = '/buy_credits';
  static const String name = 'buy_credits';

  final bool fromSplash;

  const BuyCreditsPage({super.key, this.fromSplash = false});

  @override
  Widget build(BuildContext context) {
    return BuyCreditsView(fromSplash: fromSplash);
  }
}

class BuyCreditsView extends StatefulWidget {
  final bool fromSplash;

  const BuyCreditsView({super.key, this.fromSplash = false});

  @override
  State<BuyCreditsView> createState() => _BuyCreditsViewState();
}

class _BuyCreditsViewState extends State<BuyCreditsView> {
  IapState? _lastState;
  bool _showCloseButton = false;

  void _handleClose() {
    if (widget.fromSplash) {
      DashboardPage.go(context);
    } else {
      context.pop();
    }
  }

  @override
  void initState() {
    super.initState();
    final delaySeconds = sl<RemoteConfigService>().closeButtonDelaySeconds;
    if (delaySeconds > 0) {
      Future.delayed(Duration(seconds: delaySeconds), () {
        if (mounted) {
          setState(() {
            _showCloseButton = true;
          });
        }
      });
    } else {
      _showCloseButton = true;
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
    return StreamBuilder<UserEntity>(
      stream: sl<WatchProfileUseCase>()(),
      builder: (context, snapshot) {
        final isVip = snapshot.data?.isVip ?? false;
        final t = context.t;

        final iapBlocState = context.watch<IapBloc>().state;
        iapBlocState.maybeMap(
          ready: (s) => _lastState = s,
          success: (s) => _lastState = s,
          error: (s) => _lastState = s,
          orElse: () {},
        );

        final List<Product> regularProducts =
            _lastState?.mapOrNull(
              ready: (s) => s.regularCreditProducts,
              success: (s) => s.regularCreditProducts,
              error: (s) => s.regularCreditProducts,
            ) ??
            const [];

        final List<Product> discountProducts =
            _lastState?.mapOrNull(
              ready: (s) => s.discountCreditProducts,
              success: (s) => s.discountCreditProducts,
              error: (s) => s.discountCreditProducts,
            ) ??
            const [];

        final int selectedPackageIndex =
            _lastState?.maybeMap(
              ready: (s) => s.selectedCreditIndex,
              success: (s) => s.selectedCreditIndex,
              error: (s) => s.selectedCreditIndex,
              orElse: () => 4,
            ) ??
            4;

        String getProductPrice(int credits) {
          final matchCredits = '${credits}credits';
          if (isVip) {
            for (final p in discountProducts) {
              final id = p.id.toLowerCase();
              if (id == '${matchCredits}dis' ||
                  id == '${matchCredits}dis.andr' ||
                  id.endsWith('${matchCredits}dis') ||
                  id.endsWith('${matchCredits}dis.andr') ||
                  id.contains('${credits}creditsdis')) {
                return p.priceString;
              }
            }
            for (final p in regularProducts) {
              final id = p.id.toLowerCase();
              if (id == matchCredits ||
                  id == '$matchCredits.andr' ||
                  id.endsWith(matchCredits) ||
                  id.endsWith('$matchCredits.andr')) {
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
                return p.priceString;
              }
            }
          }
          return '...';
        }

        String getProductId(int credits) {
          final matchCredits = '${credits}credits';
          if (isVip) {
            for (final p in discountProducts) {
              final id = p.id.toLowerCase();
              if (id == '${matchCredits}dis' ||
                  id == '${matchCredits}dis.andr' ||
                  id.endsWith('${matchCredits}dis') ||
                  id.endsWith('${matchCredits}dis.andr') ||
                  id.contains('${credits}creditsdis')) {
                return p.id;
              }
            }
            for (final p in regularProducts) {
              final id = p.id.toLowerCase();
              if (id == matchCredits ||
                  id == '$matchCredits.andr' ||
                  id.endsWith(matchCredits) ||
                  id.endsWith('$matchCredits.andr')) {
                return p.id;
              }
            }
          } else {
            for (final p in regularProducts) {
              final id = p.id.toLowerCase();
              if (id == matchCredits ||
                  id == '$matchCredits.andr' ||
                  id.endsWith(matchCredits) ||
                  id.endsWith('$matchCredits.andr')) {
                return p.id;
              }
            }
            for (final p in discountProducts) {
              final id = p.id.toLowerCase();
              if (id == '${matchCredits}dis' ||
                  id == '${matchCredits}dis.andr' ||
                  id.endsWith('${matchCredits}dis') ||
                  id.endsWith('${matchCredits}dis.andr') ||
                  id.contains('${credits}creditsdis')) {
                return p.id;
              }
            }
          }
          return Platform.isIOS ? matchCredits : '$matchCredits.andr';
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
            state.maybeMap(
              ready: (s) => _lastState = s,
              success: (s) => _lastState = s,
              error: (s) => _lastState = s,
              orElse: () {},
            );
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
                  ) async {
                    await sl<GetProfileUseCase>()(NoParams());
                    sl<HomeBloc>().add(const HomeEvent.refresh());
                    if (!context.mounted) return;
                    if (message != 'already_vip') {
                      AppToast.showSuccess(
                        _translateSuccessMessage(context, message),
                      );
                    }
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      DashboardPage.go(context);
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
            state.maybeMap(
              ready: (s) => _lastState = s,
              success: (s) => _lastState = s,
              error: (s) => _lastState = s,
              orElse: () {},
            );

            final isInitial = state.maybeWhen(
              initial: () => true,
              orElse: () => false,
            );

            final isLoadingProducts = state.maybeWhen(
              loading: () =>
                  regularProducts.isEmpty && discountProducts.isEmpty,
              orElse: () => false,
            );

            if (isInitial || isLoadingProducts || _lastState == null) {
              return const Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
              );
            }

            return PopScope(
              canPop: !widget.fromSplash,
              onPopInvokedWithResult: (didPop, result) {
                if (didPop) return;
                _handleClose();
              },
              child: Scaffold(
                backgroundColor: Colors.black,
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // Status bar spacing
                      SizedBox(height: MediaQuery.of(context).padding.top + 16),

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
                              child: IgnorePointer(
                                ignoring: !_showCloseButton,
                                child: AnimatedOpacity(
                                  opacity: _showCloseButton ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 300),
                                  child: GestureDetector(
                                    onTap: _handleClose,
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
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
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Subscription Discount Banner (green gradient)
                      InkWell(
                        onTap: () {
                          if (widget.fromSplash) {
                            context.pushReplacement(
                              '${IapPage.path}?fromSplash=true',
                            );
                          } else {
                            context.pushReplacement(IapPage.path);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          child: Image.asset(
                            Assets.images.bgBannerBuyCredit.path,
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
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
                              videoEstimate: t.premium.approx_videos(count: 2),
                              priceText: getProductPrice(70),
                              isSelected: selectedPackageIndex == 0,
                              onTap: () {
                                context.read<IapBloc>().add(
                                  const IapEvent.selectCreditPackage(index: 0),
                                );
                                context.read<IapBloc>().add(
                                  IapEvent.purchaseCredits(
                                    productId: getProductId(70),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            CreditPackRow(
                              title: t.premium.credit_150,
                              videoEstimate: t.premium.approx_videos(count: 4),
                              priceText: getProductPrice(150),
                              isSelected: selectedPackageIndex == 1,
                              onTap: () {
                                context.read<IapBloc>().add(
                                  const IapEvent.selectCreditPackage(index: 1),
                                );
                                context.read<IapBloc>().add(
                                  IapEvent.purchaseCredits(
                                    productId: getProductId(150),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            CreditPackRow(
                              title: t.premium.credit_350,
                              videoEstimate: t.premium.approx_videos(count: 10),
                              priceText: getProductPrice(350),
                              isSelected: selectedPackageIndex == 2,
                              onTap: () {
                                context.read<IapBloc>().add(
                                  const IapEvent.selectCreditPackage(index: 2),
                                );
                                context.read<IapBloc>().add(
                                  IapEvent.purchaseCredits(
                                    productId: getProductId(350),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            CreditPackRow(
                              title: t.premium.credit_500,
                              videoEstimate: t.premium.approx_videos(count: 14),
                              priceText: getProductPrice(500),
                              isSelected: selectedPackageIndex == 3,
                              onTap: () {
                                context.read<IapBloc>().add(
                                  const IapEvent.selectCreditPackage(index: 3),
                                );
                                context.read<IapBloc>().add(
                                  IapEvent.purchaseCredits(
                                    productId: getProductId(500),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            CreditPackRow(
                              title: t.premium.credit_1000,
                              videoEstimate: t.premium.approx_videos(count: 27),
                              priceText: getProductPrice(1000),
                              tagText: t.premium.most_popular,
                              isSelected: selectedPackageIndex == 4,
                              onTap: () {
                                context.read<IapBloc>().add(
                                  const IapEvent.selectCreditPackage(index: 4),
                                );
                                context.read<IapBloc>().add(
                                  IapEvent.purchaseCredits(
                                    productId: getProductId(1000),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            CreditPackRow(
                              title: t.premium.credit_5000,
                              videoEstimate: t.premium.approx_videos(
                                count: 142,
                              ),
                              priceText: getProductPrice(5000),
                              tagText: t.premium.best_value,
                              isSelected: selectedPackageIndex == 5,
                              onTap: () {
                                context.read<IapBloc>().add(
                                  const IapEvent.selectCreditPackage(index: 5),
                                );
                                context.read<IapBloc>().add(
                                  IapEvent.purchaseCredits(
                                    productId: getProductId(5000),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            GradientButton(
                              label: t.common.btn_continue,
                              width: double.infinity,
                              height: 62.0,
                              gradient: AppColors.primaryGradient,
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.5,
                              ),
                              trailingIcon: const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                              onPressed: () {
                                final data = getPackageData(
                                  selectedPackageIndex,
                                );
                                final credits = data['credits'] as int;
                                context.read<IapBloc>().add(
                                  IapEvent.purchaseCredits(
                                    productId: getProductId(credits),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Footer container inside ScrollView
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Text(
                              t.premium.auto_renewable,
                              style: const TextStyle(
                                color: AppColors.subText,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),

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
                                      fontSize: 13,
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
                                      fontSize: 13,
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
                                    context.read<IapBloc>().add(
                                      const IapEvent.restore(),
                                    );
                                  },
                                  child: Text(
                                    t.premium.restore,
                                    style: const TextStyle(
                                      color: AppColors.subText,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),

                            // iTunes disclaimer
                            Text(
                              t.premium.itunes_disclaimer,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.35),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).padding.bottom + 24,
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
        );
      },
    );
  }
}
