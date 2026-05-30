import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/media_entities.dart';
import '../repositories/media_repository.dart';

class GetThemesParams {
  final String? categoryId;
  final int? page;
  final int? take;
  final bool? isFeatured;

  GetThemesParams({
    this.categoryId,
    this.page,
    this.take,
    this.isFeatured,
  });
}

class GetThemesUseCase implements UseCase<PaginatedListEntity<ThemeEntity>, GetThemesParams> {
  final MediaRepository mediaRepository;

  GetThemesUseCase({required this.mediaRepository});

  @override
  Future<Resource<PaginatedListEntity<ThemeEntity>>> call(GetThemesParams params) {
    return mediaRepository.getThemes(
      categoryId: params.categoryId,
      page: params.page,
      take: params.take,
      isFeatured: params.isFeatured,
    );
  }
}
