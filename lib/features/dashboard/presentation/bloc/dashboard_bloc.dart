import 'package:flutter_bloc/flutter_bloc.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState.initial()) {
    on<DashboardEvent>((event, emit) {
      event.when(
        init: () {
          emit(const DashboardState.currentTab(0));
        },
        changeTab: (index) {
          emit(DashboardState.currentTab(index));
        },
      );
    });
  }
}
