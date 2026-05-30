import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/src/core/resources/resource.dart';
import 'package:core_business/src/core/utils/log_utils.dart';
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
          LogUtils.d('IapBloc: Initializing');
          emit(const IapState.ready(isWeeklySelected: false, isVideoRevealed: false));
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
        purchase: () async {
          LogUtils.d('IapBloc: Initiating Purchase');
          bool isWeekly = false;
          bool isRevealed = false;

          state.mapOrNull(
            ready: (s) {
              isWeekly = s.isWeeklySelected;
              isRevealed = s.isVideoRevealed;
            },
            success: (s) {
              isWeekly = s.isWeeklySelected;
              isRevealed = s.isVideoRevealed;
            },
            error: (s) {
              isWeekly = s.isWeeklySelected;
              isRevealed = s.isVideoRevealed;
            },
          );

          emit(const IapState.loading());

          // Construct API request to verify on server
          final productId = isWeekly ? 'com.vexa.ai.video.weekly' : 'com.vexa.ai.video.yearly';
          final request = VerifySubscriptionRequestModel(
            productId: productId,
            purchaseToken: 'mock_google_purchase_token_for_white_label',
          );
          
          final result = await verifySubscriptionUseCase(request);
          
          result.when(
            initial: () {},
            loading: () {},
            empty: () {},
            success: (_) {
              LogUtils.d('IapBloc: Purchase Success');
              emit(IapState.success(
                message: isWeekly ? 'Weekly Subscription purchased!' : 'Annual Subscription purchased!',
                isWeeklySelected: isWeekly,
                isVideoRevealed: isRevealed,
              ));
            },
            error: (message) {
              LogUtils.e('IapBloc: Purchase Verification Failed: $message');
              // Fallback to success for mockup mode if API fails or isn't reachable
              emit(IapState.success(
                message: isWeekly ? 'Weekly Subscription purchased!' : 'Annual Subscription purchased!',
                isWeeklySelected: isWeekly,
                isVideoRevealed: isRevealed,
              ));
            },
          );

          emit(IapState.ready(isWeeklySelected: isWeekly, isVideoRevealed: isRevealed));
        },
        purchaseCredits: (credits, priceText) async {
          LogUtils.d('IapBloc: Purchase $credits Credits for $priceText');
          bool isWeekly = false;
          bool isRevealed = false;

          state.mapOrNull(
            ready: (s) {
              isWeekly = s.isWeeklySelected;
              isRevealed = s.isVideoRevealed;
            },
            success: (s) {
              isWeekly = s.isWeeklySelected;
              isRevealed = s.isVideoRevealed;
            },
            error: (s) {
              isWeekly = s.isWeeklySelected;
              isRevealed = s.isVideoRevealed;
            },
          );

          emit(const IapState.loading());

          final productId = 'com.vexa.ai.video.${credits}credits';
          final request = VerifyProductRequestModel(
            productId: productId,
            purchaseToken: 'mock_google_purchase_token_for_credits',
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
              ));
            },
            error: (message) {
              LogUtils.e('IapBloc: Purchase Credits Verification Failed: $message');
              // Fallback to success for mockup
              emit(IapState.success(
                message: 'Successfully purchased $credits Credits!',
                isWeeklySelected: isWeekly,
                isVideoRevealed: isRevealed,
              ));
            },
          );

          emit(IapState.ready(isWeeklySelected: isWeekly, isVideoRevealed: isRevealed));
        },
      );
    });
  }
}
