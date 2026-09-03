import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/resource.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../auth/domain/usecases/update_reviewer_usecase.dart';
import 'developer_event.dart';
import 'developer_state.dart';

class DeveloperBloc extends Bloc<DeveloperEvent, DeveloperState> {
  final UpdateReviewerUseCase _updateReviewerUseCase;

  DateTime? _lastTapTime;

  static const int _targetTapCount = 20;
  static const Duration _maxTapInterval = Duration(milliseconds: 1500);

  DeveloperBloc({required UpdateReviewerUseCase updateReviewerUseCase})
      : _updateReviewerUseCase = updateReviewerUseCase,
        super(const DeveloperState.initial()) {
    on<DeveloperEvent>((event, emit) async {
      await event.when(
        tap: () async {
          final isLoading = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );
          if (isLoading) return;

          final now = DateTime.now();
          int currentCount = state.maybeWhen(
            update: (count, _) => count,
            orElse: () => 0,
          );

          if (_lastTapTime != null &&
              now.difference(_lastTapTime!) > _maxTapInterval) {
            currentCount = 0;
          }
          _lastTapTime = now;

          final nextCount = currentCount + 1;

          if (nextCount >= _targetTapCount) {
            _lastTapTime = null;
            emit(const DeveloperState.loading());

            final result = await _updateReviewerUseCase(NoParams());
            result.when(
              initial: () => emit(const DeveloperState.initial()),
              loading: () {},
              empty: () => emit(const DeveloperState.initial()),
              success: (_) {
                emit(const DeveloperState.reviewerSuccess());
              },
              error: (failure) {
                emit(
                  DeveloperState.reviewerFailure(
                    message: failure.toErrorCodeOrMessage(),
                  ),
                );
              },
            );
          } else {
            emit(
              DeveloperState.update(
                tapCount: nextCount,
                navigateToDebug: false,
              ),
            );
          }
        },
        reset: () {
          _lastTapTime = null;
          emit(const DeveloperState.initial());
        },
      );
    });
  }
}
