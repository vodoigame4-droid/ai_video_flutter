import 'package:core_business/core_business.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late UpdateReviewerUseCase updateReviewerUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    updateReviewerUseCase = UpdateReviewerUseCase(authRepository: mockAuthRepository);
  });

  test('UpdateReviewerUseCase calls authRepository.updateReviewer()', () async {
    final user = UserEntity(
      id: 'test_id',
      deviceId: 'test_device',
      name: 'Test User',
      email: 'test@example.com',
      avatarUrl: '',
      inviteCode: '',
      status: 'active',
      credits: 100,
      extraCredits: 0,
      subscribeCredits: 0,
      isRated: false,
      isVip: false,
      freeSuggestions: 5,
      activeSubId: null,
      refUsersCount: 0,
      createdAt: DateTime.now(),
    );

    when(() => mockAuthRepository.updateReviewer()).thenAnswer(
      (_) async => Resource.success(user),
    );

    final result = await updateReviewerUseCase(const NoParams());

    expect(result, isA<Resource<UserEntity>>());
    result.mapOrNull(
      success: (data) => expect(data.data.id, equals('test_id')),
    );

    verify(() => mockAuthRepository.updateReviewer()).called(1);
  });
}
