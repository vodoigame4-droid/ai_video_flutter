import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/log_utils.dart';
import 'iap_event.dart';
import 'iap_state.dart';

class IapBloc extends Bloc<IapEvent, IapState> {
  IapBloc() : super(const IapState.initial()) {
    on<IapEvent>((event, emit) async {
      await event.when(
        init: () async {
          LogUtils.d('IapBloc: Initializing');
          // Annually is selected by default for IAP, video not revealed by default
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
          await Future.delayed(const Duration(milliseconds: 1500));

          LogUtils.d('IapBloc: Purchase Success');
          emit(IapState.success(
            message: isWeekly ? 'Weekly Subscription purchased!' : 'Annual Subscription purchased!',
            isWeeklySelected: isWeekly,
            isVideoRevealed: isRevealed,
          ));

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
          await Future.delayed(const Duration(milliseconds: 1500));

          LogUtils.d('IapBloc: Purchase Credits Success');
          emit(IapState.success(
            message: 'Successfully purchased $credits Credits!',
            isWeeklySelected: isWeekly,
            isVideoRevealed: isRevealed,
          ));

          emit(IapState.ready(isWeeklySelected: isWeekly, isVideoRevealed: isRevealed));
        },
      );
    });
  }
}
