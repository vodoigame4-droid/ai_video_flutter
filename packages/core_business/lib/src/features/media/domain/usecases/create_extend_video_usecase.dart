import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/media_models.dart';
import '../entities/media_entities.dart';
import '../repositories/media_repository.dart';

class CreateExtendVideoParams {
  final String imageUrl;
  final String videoUrl;
  final String name;
  final String prompt;
  final bool isHd;
  final bool isLongTime;

  CreateExtendVideoParams({
    required this.imageUrl,
    required this.videoUrl,
    required this.name,
    required this.prompt,
    required this.isHd,
    required this.isLongTime,
  });
}

/// UseCase thực hiện nghiệp vụ Mở rộng Video (Extend Video) từ một video hiện tại.
///
/// Chú ý: Mặc dù đây là nghiệp vụ Mở rộng Video ở phía Client, nhưng được ánh xạ sang
/// serviceType 'DANCING_IMAGE' ở API do dùng chung cấu trúc đầu vào (ảnh + video) trên Backend.
class CreateExtendVideoUseCase implements UseCase<MediaEntity, CreateExtendVideoParams> {
  final MediaRepository mediaRepository;

  CreateExtendVideoUseCase({required this.mediaRepository});

  @override
  Future<Resource<MediaEntity>> call(CreateExtendVideoParams params) {
    final request = CreateTgvRequestModel(
      imageUrl: params.imageUrl,
      videoUrl: params.videoUrl,
      name: params.name,
      prompt: params.prompt,
      themeId: '1',
      themeType: 'TEMPLATE',
      themeOrgId: 1,
      isHd: params.isHd,
      isLongTime: params.isLongTime,
      // Ánh xạ sang DANCING_IMAGE vì Backend dùng chung luồng nhận diện video nguồn
      serviceType: 'DANCING_IMAGE',
    );
    return mediaRepository.createTgv(request);
  }
}
