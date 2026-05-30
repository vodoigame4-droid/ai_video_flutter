import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/media_entities.dart';
import '../repositories/media_repository.dart';

class GetHomeCategoriesUseCase implements UseCase<List<HomeCategoryEntity>, NoParams> {
  final MediaRepository mediaRepository;

  GetHomeCategoriesUseCase({required this.mediaRepository});

  @override
  Future<Resource<List<HomeCategoryEntity>>> call(NoParams params) {
    return mediaRepository.getHomeCategories();
  }
}
