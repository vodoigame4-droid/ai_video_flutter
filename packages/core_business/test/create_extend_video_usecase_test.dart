import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:core_business/core_business.dart';
import 'package:core_business/src/features/media/domain/repositories/media_repository.dart';
import 'package:core_business/src/features/media/data/models/media_models.dart';
import 'package:core_business/src/features/media/domain/usecases/create_extend_video_usecase.dart';

class MockMediaRepository extends Mock implements MediaRepository {}

class FakeCreateTgvRequestModel extends Fake implements CreateTgvRequestModel {}

void main() {
  late MockMediaRepository mockRepository;
  late CreateExtendVideoUseCase useCase;

  setUpAll(() {
    registerFallbackValue(FakeCreateTgvRequestModel());
  });

  setUp(() {
    mockRepository = MockMediaRepository();
    useCase = CreateExtendVideoUseCase(mediaRepository: mockRepository);
  });

  group('CreateExtendVideoUseCase Tests', () {
    test('should map EXTEND_VIDEO parameters to DANCING_IMAGE serviceType and call createTgv on repository', () async {
      // Arrange
      final params = CreateExtendVideoParams(
        imageUrl: 'https://example.com/image.jpg',
        videoUrl: 'https://example.com/video.mp4',
        name: 'Test Extend Video',
        prompt: 'Make it longer',
        isHd: true,
        isLongTime: false,
      );

      final mediaEntity = MediaEntity(
        id: '123',
        name: 'Test Extend Video',
        imageUrl: 'https://example.com/image.jpg',
        imageUrls: const ['https://example.com/image.jpg'],
        imageQuantity: 1,
        requestId: 'req-123',
        resultUrl: 'https://example.com/result.mp4',
        finishedTime: DateTime.now(),
        prompt: 'Make it longer',
        isHd: true,
        isLongTime: false,
        themeId: '1',
        thumbnailUrl: 'https://example.com/thumb.jpg',
        status: 'completed',
        createdAt: DateTime.now(),
      );

      when(() => mockRepository.createTgv(any()))
          .thenAnswer((_) async => Resource.success(mediaEntity));

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, isA<Resource<MediaEntity>>());
      result.whenOrNull(
        success: (data) {
          expect(data, mediaEntity);
        },
      );

      // Verify repository was called with correct parameters mapped
      verify(() => mockRepository.createTgv(
        any(
          that: isA<CreateTgvRequestModel>()
              .having((req) => req.imageUrl, 'imageUrl', 'https://example.com/image.jpg')
              .having((req) => req.videoUrl, 'videoUrl', 'https://example.com/video.mp4')
              .having((req) => req.name, 'name', 'Test Extend Video')
              .having((req) => req.prompt, 'prompt', 'Make it longer')
              .having((req) => req.isHd, 'isHd', true)
              .having((req) => req.isLongTime, 'isLongTime', false)
              .having((req) => req.serviceType, 'serviceType', 'DANCING_IMAGE'), // Mapped serviceType
        ),
      )).called(1);
    });
  });
}
