import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:core_business/core_business.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late UpdateReviewerUseCase updateReviewerUseCase;
  late DeveloperBloc developerBloc;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    updateReviewerUseCase = UpdateReviewerUseCase(authRepository: mockAuthRepository);
    developerBloc = DeveloperBloc(updateReviewerUseCase: updateReviewerUseCase);
  });

  tearDown(() {
    developerBloc.close();
  });

  group('DeveloperBloc Tests', () {
    test('initial state should be DeveloperState.initial()', () {
      expect(developerBloc.state, const DeveloperState.initial());
    });

    blocTest<DeveloperBloc, DeveloperState>(
      'increments tap count on tap event',
      build: () => developerBloc,
      act: (bloc) {
        bloc.add(const DeveloperEvent.tap());
        bloc.add(const DeveloperEvent.tap());
      },
      expect: () => [
        const DeveloperState.update(tapCount: 1, navigateToDebug: false),
        const DeveloperState.update(tapCount: 2, navigateToDebug: false),
      ],
    );

    blocTest<DeveloperBloc, DeveloperState>(
      'resets state on reset event',
      build: () => developerBloc,
      act: (bloc) {
        bloc.add(const DeveloperEvent.tap());
        bloc.add(const DeveloperEvent.reset());
      },
      expect: () => [
        const DeveloperState.update(tapCount: 1, navigateToDebug: false),
        const DeveloperState.initial(),
      ],
    );

    blocTest<DeveloperBloc, DeveloperState>(
      'triggers reviewer update and emits reviewerSuccess on 20th tap',
      setUp: () {
        when(() => mockAuthRepository.updateReviewer())
            .thenAnswer((_) async => const Resource.success(null));
      },
      build: () => developerBloc,
      act: (bloc) {
        for (int i = 0; i < 20; i++) {
          bloc.add(const DeveloperEvent.tap());
        }
      },
      expect: () => [
        ...List.generate(
          19,
          (index) => DeveloperState.update(tapCount: index + 1, navigateToDebug: false),
        ),
        const DeveloperState.loading(),
        const DeveloperState.reviewerSuccess(),
      ],
      verify: (_) {
        verify(() => mockAuthRepository.updateReviewer()).called(1);
      },
    );

    blocTest<DeveloperBloc, DeveloperState>(
      'triggers reviewer update and emits reviewerFailure on error',
      setUp: () {
        when(() => mockAuthRepository.updateReviewer())
            .thenAnswer((_) async => const Resource.error(Failure.server(statusCode: 500, message: 'Update failed')));
      },
      build: () => developerBloc,
      act: (bloc) {
        for (int i = 0; i < 20; i++) {
          bloc.add(const DeveloperEvent.tap());
        }
      },
      expect: () => [
        ...List.generate(
          19,
          (index) => DeveloperState.update(tapCount: index + 1, navigateToDebug: false),
        ),
        const DeveloperState.loading(),
        const DeveloperState.reviewerFailure(message: 'ER_SERVER_ERROR'),
      ],
      verify: (_) {
        verify(() => mockAuthRepository.updateReviewer()).called(1);
      },
    );
  });
}
