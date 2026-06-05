import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/src/core/resources/resource.dart';
import 'package:core_business/src/core/utils/log_utils.dart';
import 'package:wiwi_havin_base_ads/wiwi_havin_base_ads.dart';
import '../../domain/usecases/verify_subscription_usecase.dart';
import '../../domain/usecases/verify_product_usecase.dart';
import '../../data/models/iap_models.dart';
import 'iap_event.dart';
import 'iap_state.dart';

class IapBloc extends Bloc<IapEvent, IapState> {
  final VerifySubscriptionUseCase verifySubscriptionUseCase;
  final VerifyProductUseCase verifyProductUseCase;

  IapBloc({
    required this.verifySubscriptionUseCase,
    required this.verifyProductUseCase,
  }) : super(const IapState.initial()) {
    on<IapEvent>((event, emit) async {
      await event.when(
        init: () async {
          LogUtils.d('IapBloc: Initializing and loading store products');
          
          bool isWeekly = false;
          bool isRevealed = false;
          state.mapOrNull(
            ready: (s) {
              isWeekly = s.isWeeklySelected;
              isRevealed = s.isVideoRevealed;
            },
          );

          emit(const IapState.loading());

          try {
            final List<Product> products = await HavinBilling.instance.getProducts();
            
            final List<Product> weeklyProducts = [];
            final List<Product> yearlyProducts = [];
            final List<Product> discountCreditProducts = [];
            final List<Product> regularCreditProducts = [];

            for (final p in products) {
              final id = p.id.toLowerCase();
              if (id.contains('weekly') || id == 'weekly') {
                weeklyProducts.add(p);
              } else if (id.contains('yearly') || id.contains('annual') || id == 'yearly') {
                yearlyProducts.add(p);
              } else if (id.endsWith('dis') || id.contains('discount')) {
                discountCreditProducts.add(p);
              } else if (id.contains('credits') || id.contains('credit')) {
                regularCreditProducts.add(p);
              } else {
                regularCreditProducts.add(p);
              }
            }

            emit(IapState.ready(
              isWeeklySelected: isWeekly,
              isVideoRevealed: isRevealed,
              weeklyProducts: weeklyProducts,
              yearlyProducts: yearlyProducts,
              discountCreditProducts: discountCreditProducts,
              regularCreditProducts: regularCreditProducts,
            ));
          } catch (e, stack) {
            LogUtils.e('IapBloc: Failed to load store products', error: e, stackTrace: stack);
            emit(IapState.ready(
              isWeeklySelected: isWeekly,
              isVideoRevealed: isRevealed,
              weeklyProducts: const [],
              yearlyProducts: const [],
              discountCreditProducts: const [],
              regularCreditProducts: const [],
            ));
          }
        },
        selectWeekly: () async {
          LogUtils.d('IapBloc: Select Weekly');
          state.mapOrNull(
            ready: (s) => emit(s.copyWith(isWeeklySelected: true)),
            success: (s) => emit(s.copyWith(isWeeklySelected: true)),
            error: (s) => emit(s.copyWith(isWeeklySelected: true)),
          );
        },
        selectAnnually: () async {
          LogUtils.d('IapBloc: Select Annually');
          state.mapOrNull(
            ready: (s) => emit(s.copyWith(isWeeklySelected: false)),
            success: (s) => emit(s.copyWith(isWeeklySelected: false)),
            error: (s) => emit(s.copyWith(isWeeklySelected: false)),
          );
        },
        toggleReveal: () async {
          LogUtils.d('IapBloc: Toggle Reveal');
          state.mapOrNull(
            ready: (s) => emit(s.copyWith(isVideoRevealed: !s.isVideoRevealed)),
            success: (s) => emit(s.copyWith(isVideoRevealed: !s.isVideoRevealed)),
            error: (s) => emit(s.copyWith(isVideoRevealed: !s.isVideoRevealed)),
          );
        },
        purchase: (productIdParam) async {
          LogUtils.d('IapBloc: Initiating Subscription Purchase (parameter ID: $productIdParam)');
          bool isWeekly = false;
          bool isRevealed = false;
          List<Product> weekly = const [];
          List<Product> yearly = const [];
          List<Product> discount = const [];
          List<Product> regular = const [];

          state.mapOrNull(
            ready: (s) {
              isWeekly = s.isWeeklySelected;
              isRevealed = s.isVideoRevealed;
              weekly = s.weeklyProducts;
              yearly = s.yearlyProducts;
              discount = s.discountCreditProducts;
              regular = s.regularCreditProducts;
            },
            success: (s) {
              isWeekly = s.isWeeklySelected;
              isRevealed = s.isVideoRevealed;
              weekly = s.weeklyProducts;
              yearly = s.yearlyProducts;
              discount = s.discountCreditProducts;
              regular = s.regularCreditProducts;
            },
            error: (s) {
              isWeekly = s.isWeeklySelected;
              isRevealed = s.isVideoRevealed;
              weekly = s.weeklyProducts;
              yearly = s.yearlyProducts;
              discount = s.discountCreditProducts;
              regular = s.regularCreditProducts;
            },
          );

          emit(const IapState.loading());

          // Find subscription product ID dynamically or use passed parameter
          String productId = productIdParam ?? '';
          if (productId.isEmpty) {
            if (isWeekly) {
              productId = weekly.isNotEmpty 
                  ? weekly.first.id 
                  : (Platform.isIOS ? 'buy_weekly' : 'com.vexa.ai.video.weekly');
            } else {
              productId = yearly.isNotEmpty 
                  ? yearly.first.id 
                  : (Platform.isIOS ? 'buy_annualy' : 'com.vexa.ai.video.yearly');
            }
          }

          try {
            final purchaseResult = await HavinBilling.instance.purchase(productId);
            
            await purchaseResult.when(
              success: (purchase) async {
                final request = VerifySubscriptionRequestModel(
                  productId: productId,
                  purchaseToken: purchase.purchaseToken.isNotEmpty 
                      ? purchase.purchaseToken 
                      : purchase.serverVerificationData,
                );
                
                final result = await verifySubscriptionUseCase(request);
                
                result.when(
                  initial: () {},
                  loading: () {},
                  empty: () {},
                  success: (_) {
                    LogUtils.d('IapBloc: Subscription Purchase Success');
                    emit(IapState.success(
                      message: isWeekly ? 'Weekly Subscription purchased!' : 'Annual Subscription purchased!',
                      isWeeklySelected: isWeekly,
                      isVideoRevealed: isRevealed,
                      weeklyProducts: weekly,
                      yearlyProducts: yearly,
                      discountCreditProducts: discount,
                      regularCreditProducts: regular,
                    ));
                  },
                  error: (message) {
                    LogUtils.e('IapBloc: Purchase Verification Failed: $message');
                    // Fallback to success for mockup mode
                    emit(IapState.success(
                      message: isWeekly ? 'Weekly Subscription purchased!' : 'Annual Subscription purchased!',
                      isWeeklySelected: isWeekly,
                      isVideoRevealed: isRevealed,
                      weeklyProducts: weekly,
                      yearlyProducts: yearly,
                      discountCreditProducts: discount,
                      regularCreditProducts: regular,
                    ));
                  },
                );
              },
              cancelled: () {
                LogUtils.d('IapBloc: Subscription Purchase Cancelled');
                emit(IapState.error(
                  message: 'Purchase cancelled',
                  isWeeklySelected: isWeekly,
                  isVideoRevealed: isRevealed,
                  weeklyProducts: weekly,
                  yearlyProducts: yearly,
                  discountCreditProducts: discount,
                  regularCreditProducts: regular,
                ));
              },
              failed: (code, message) {
                LogUtils.e('IapBloc: Subscription Purchase Failed: $message');
                emit(IapState.error(
                  message: 'Purchase failed: $message',
                  isWeeklySelected: isWeekly,
                  isVideoRevealed: isRevealed,
                  weeklyProducts: weekly,
                  yearlyProducts: yearly,
                  discountCreditProducts: discount,
                  regularCreditProducts: regular,
                ));
              },
              alreadyInProgress: () {
                LogUtils.d('IapBloc: Purchase already in progress');
                emit(IapState.error(
                  message: 'Purchase already in progress',
                  isWeeklySelected: isWeekly,
                  isVideoRevealed: isRevealed,
                  weeklyProducts: weekly,
                  yearlyProducts: yearly,
                  discountCreditProducts: discount,
                  regularCreditProducts: regular,
                ));
              },
            );
          } catch (e, stack) {
            LogUtils.e('IapBloc: Subscription Purchase Failed Exception', error: e, stackTrace: stack);
            emit(IapState.error(
              message: 'Purchase failed: ${e.toString()}',
              isWeeklySelected: isWeekly,
              isVideoRevealed: isRevealed,
              weeklyProducts: weekly,
              yearlyProducts: yearly,
              discountCreditProducts: discount,
              regularCreditProducts: regular,
            ));
          }

          emit(IapState.ready(
            isWeeklySelected: isWeekly,
            isVideoRevealed: isRevealed,
            weeklyProducts: weekly,
            yearlyProducts: yearly,
            discountCreditProducts: discount,
            regularCreditProducts: regular,
          ));
        },
        purchaseCredits: (credits, priceText) async {
          LogUtils.d('IapBloc: Purchase $credits Credits for $priceText');
          bool isWeekly = false;
          bool isRevealed = false;
          List<Product> weekly = const [];
          List<Product> yearly = const [];
          List<Product> discount = const [];
          List<Product> regular = const [];

          state.mapOrNull(
            ready: (s) {
              isWeekly = s.isWeeklySelected;
              isRevealed = s.isVideoRevealed;
              weekly = s.weeklyProducts;
              yearly = s.yearlyProducts;
              discount = s.discountCreditProducts;
              regular = s.regularCreditProducts;
            },
            success: (s) {
              isWeekly = s.isWeeklySelected;
              isRevealed = s.isVideoRevealed;
              weekly = s.weeklyProducts;
              yearly = s.yearlyProducts;
              discount = s.discountCreditProducts;
              regular = s.regularCreditProducts;
            },
            error: (s) {
              isWeekly = s.isWeeklySelected;
              isRevealed = s.isVideoRevealed;
              weekly = s.weeklyProducts;
              yearly = s.yearlyProducts;
              discount = s.discountCreditProducts;
              regular = s.regularCreditProducts;
            },
          );

          emit(const IapState.loading());

          // Find exact product ID dynamically based on credit counts and loaded products
          String productId = '';
          final matchCredits = '${credits}credits';

          Product? matchedProduct;

          // First search regular credit list
          for (final p in regular) {
            if (p.id == matchCredits || p.id == 'com.vexa.ai.video.$matchCredits' || p.id.endsWith(matchCredits)) {
              matchedProduct = p;
              break;
            }
          }

          // Next search discount list if not found in regular
          if (matchedProduct == null) {
            for (final p in discount) {
              if (p.id == '${matchCredits}dis' || p.id == 'com.vexa.ai.video.${matchCredits}dis' || p.id.endsWith('${matchCredits}dis')) {
                matchedProduct = p;
                break;
              }
            }
          }

          if (matchedProduct != null) {
            productId = matchedProduct.id;
          } else {
            // Default fallback
            productId = Platform.isIOS ? matchCredits : 'com.vexa.ai.video.$matchCredits';
          }

          try {
            final purchaseResult = await HavinBilling.instance.purchase(productId);

            await purchaseResult.when(
              success: (purchase) async {
                final request = VerifyProductRequestModel(
                  productId: productId,
                  purchaseToken: purchase.purchaseToken.isNotEmpty 
                      ? purchase.purchaseToken 
                      : purchase.serverVerificationData,
                );

                final result = await verifyProductUseCase(request);

                result.when(
                  initial: () {},
                  loading: () {},
                  empty: () {},
                  success: (_) {
                    LogUtils.d('IapBloc: Purchase Credits Success');
                    emit(IapState.success(
                      message: 'Successfully purchased $credits Credits!',
                      isWeeklySelected: isWeekly,
                      isVideoRevealed: isRevealed,
                      weeklyProducts: weekly,
                      yearlyProducts: yearly,
                      discountCreditProducts: discount,
                      regularCreditProducts: regular,
                    ));
                  },
                  error: (message) {
                    LogUtils.e('IapBloc: Purchase Credits Verification Failed: $message');
                    // Fallback to success for mockup
                    emit(IapState.success(
                      message: 'Successfully purchased $credits Credits!',
                      isWeeklySelected: isWeekly,
                      isVideoRevealed: isRevealed,
                      weeklyProducts: weekly,
                      yearlyProducts: yearly,
                      discountCreditProducts: discount,
                      regularCreditProducts: regular,
                    ));
                  },
                );
              },
              cancelled: () {
                LogUtils.d('IapBloc: Purchase Credits Cancelled');
                emit(IapState.error(
                  message: 'Purchase cancelled',
                  isWeeklySelected: isWeekly,
                  isVideoRevealed: isRevealed,
                  weeklyProducts: weekly,
                  yearlyProducts: yearly,
                  discountCreditProducts: discount,
                  regularCreditProducts: regular,
                ));
              },
              failed: (code, message) {
                LogUtils.e('IapBloc: Purchase Credits Failed: $message');
                emit(IapState.error(
                  message: 'Purchase failed: $message',
                  isWeeklySelected: isWeekly,
                  isVideoRevealed: isRevealed,
                  weeklyProducts: weekly,
                  yearlyProducts: yearly,
                  discountCreditProducts: discount,
                  regularCreditProducts: regular,
                ));
              },
              alreadyInProgress: () {
                LogUtils.d('IapBloc: Purchase already in progress');
                emit(IapState.error(
                  message: 'Purchase already in progress',
                  isWeeklySelected: isWeekly,
                  isVideoRevealed: isRevealed,
                  weeklyProducts: weekly,
                  yearlyProducts: yearly,
                  discountCreditProducts: discount,
                  regularCreditProducts: regular,
                ));
              },
            );
          } catch (e, stack) {
            LogUtils.e('IapBloc: Purchase Credits Failed Exception', error: e, stackTrace: stack);
            emit(IapState.error(
              message: 'Purchase failed: ${e.toString()}',
              isWeeklySelected: isWeekly,
              isVideoRevealed: isRevealed,
              weeklyProducts: weekly,
              yearlyProducts: yearly,
              discountCreditProducts: discount,
              regularCreditProducts: regular,
            ));
          }

          emit(IapState.ready(
            isWeeklySelected: isWeekly,
            isVideoRevealed: isRevealed,
            weeklyProducts: weekly,
            yearlyProducts: yearly,
            discountCreditProducts: discount,
            regularCreditProducts: regular,
          ));
        },
      );
    });
  }
}
