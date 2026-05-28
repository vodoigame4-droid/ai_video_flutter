import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/log_utils.dart';
import 'buy_credits_event.dart';
import 'buy_credits_state.dart';

class BuyCreditsBloc extends Bloc<BuyCreditsEvent, BuyCreditsState> {
  BuyCreditsBloc() : super(const BuyCreditsState.initial()) {
    on<BuyCreditsEvent>((event, emit) async {
      await event.when(
        init: () async {
          LogUtils.d('BuyCreditsBloc: Initializing');
          emit(const BuyCreditsState.ready(isVideoRevealed: false));
        },
        toggleReveal: () async {
          LogUtils.d('BuyCreditsBloc: Toggle Reveal');
          state.mapOrNull(
            ready: (s) => emit(s.copyWith(isVideoRevealed: !s.isVideoRevealed)),
            success: (s) => emit(s.copyWith(isVideoRevealed: !s.isVideoRevealed)),
            error: (s) => emit(s.copyWith(isVideoRevealed: !s.isVideoRevealed)),
          );
        },
        purchaseCredits: (credits, priceText) async {
          LogUtils.d('BuyCreditsBloc: Purchase $credits Credits for $priceText');
          bool isRevealed = false;

          state.mapOrNull(
            ready: (s) => isRevealed = s.isVideoRevealed,
            success: (s) => isRevealed = s.isVideoRevealed,
            error: (s) => isRevealed = s.isVideoRevealed,
          );

          emit(const BuyCreditsState.loading());
          await Future.delayed(const Duration(milliseconds: 1500));

          LogUtils.d('BuyCreditsBloc: Purchase Credits Success');
          emit(BuyCreditsState.success(
            message: 'Successfully purchased $credits Credits!',
            isVideoRevealed: isRevealed,
          ));

          emit(BuyCreditsState.ready(isVideoRevealed: isRevealed));
        },
      );
    });
  }
}
