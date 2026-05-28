import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/log_utils.dart';
import 'paywall_video_event.dart';
import 'paywall_video_state.dart';

class PaywallVideoBloc extends Bloc<PaywallVideoEvent, PaywallVideoState> {
  PaywallVideoBloc() : super(const PaywallVideoState.initial()) {
    on<PaywallVideoEvent>((event, emit) async {
      await event.when(
        init: () async {
          LogUtils.d('PaywallVideoBloc: Initializing');
          emit(const PaywallVideoState.ready(
            isWeeklySelected: true,
            isVideoRevealed: false,
          ));
        },
        selectWeekly: () async {
          LogUtils.d('PaywallVideoBloc: Select Weekly');
          state.mapOrNull(
            ready: (s) => emit(s.copyWith(isWeeklySelected: true)),
            success: (s) => emit(s.copyWith(isWeeklySelected: true)),
            error: (s) => emit(s.copyWith(isWeeklySelected: true)),
          );
        },
        selectAnnually: () async {
          LogUtils.d('PaywallVideoBloc: Select Annually');
          state.mapOrNull(
            ready: (s) => emit(s.copyWith(isWeeklySelected: false)),
            success: (s) => emit(s.copyWith(isWeeklySelected: false)),
            error: (s) => emit(s.copyWith(isWeeklySelected: false)),
          );
        },
        toggleReveal: () async {
          LogUtils.d('PaywallVideoBloc: Toggle Reveal');
          state.mapOrNull(
            ready: (s) => emit(s.copyWith(isVideoRevealed: !s.isVideoRevealed)),
            success: (s) => emit(s.copyWith(isVideoRevealed: !s.isVideoRevealed)),
            error: (s) => emit(s.copyWith(isVideoRevealed: !s.isVideoRevealed)),
          );
        },
        purchase: () async {
          LogUtils.d('PaywallVideoBloc: Initiating Purchase');
          bool isWeekly = true;
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

          emit(const PaywallVideoState.loading());
          await Future.delayed(const Duration(milliseconds: 1500));

          LogUtils.d('PaywallVideoBloc: Purchase Success');
          emit(PaywallVideoState.success(
            message: isWeekly ? 'Weekly Subscription purchased!' : 'Annual Subscription purchased!',
            isWeeklySelected: isWeekly,
            isVideoRevealed: isRevealed,
          ));

          // Reset back to ready state immediately so popup doesn't block future interactions
          emit(PaywallVideoState.ready(
            isWeeklySelected: isWeekly,
            isVideoRevealed: isRevealed,
          ));
        },
      );
    });
  }
}
