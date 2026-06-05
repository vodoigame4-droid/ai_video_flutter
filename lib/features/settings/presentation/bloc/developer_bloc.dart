import 'package:flutter_bloc/flutter_bloc.dart';
import 'developer_event.dart';
import 'developer_state.dart';

class DeveloperBloc extends Bloc<DeveloperEvent, DeveloperState> {
  DeveloperBloc() : super(const DeveloperState.initial()) {
    on<DeveloperEvent>((event, emit) {
      event.when(
        tap: () {
          final currentCount = state.maybeWhen(
            update: (count, _) => count,
            orElse: () => 0,
          );
          final nextCount = currentCount + 1;
          if (nextCount >= 7) {
            emit(const DeveloperState.update(tapCount: 0, navigateToDebug: true));
          } else {
            emit(DeveloperState.update(tapCount: nextCount, navigateToDebug: false));
          }
        },
        reset: () {
          emit(const DeveloperState.initial());
        },
      );
    });
  }
}
