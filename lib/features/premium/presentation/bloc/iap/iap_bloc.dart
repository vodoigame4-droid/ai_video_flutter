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
          // Annually is selected by default for IAP
          emit(const IapState.ready(isWeeklySelected: false));
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
        purchase: () async {
          LogUtils.d('IapBloc: Initiating Purchase');
          bool isWeekly = false;

          state.mapOrNull(
            ready: (s) => isWeekly = s.isWeeklySelected,
            success: (s) => isWeekly = s.isWeeklySelected,
            error: (s) => isWeekly = s.isWeeklySelected,
          );

          emit(const IapState.loading());
          await Future.delayed(const Duration(milliseconds: 1500));

          LogUtils.d('IapBloc: Purchase Success');
          emit(IapState.success(
            message: isWeekly ? 'Weekly Subscription purchased!' : 'Annual Subscription purchased!',
            isWeeklySelected: isWeekly,
          ));

          emit(IapState.ready(isWeeklySelected: isWeekly));
        },
      );
    });
  }
}
