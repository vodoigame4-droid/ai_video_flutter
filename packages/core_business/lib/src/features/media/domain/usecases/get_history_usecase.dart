import '../../../../core/resources/resource.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/media_entities.dart';
import '../repositories/media_repository.dart';

class GetHistoryParams {
  final int? page;
  final int? take;

  GetHistoryParams({this.page, this.take});
}

class GetHistoryUseCase implements UseCase<PaginatedListEntity<MediaEntity>, GetHistoryParams> {
  final MediaRepository mediaRepository;

  GetHistoryUseCase({required this.mediaRepository});

  @override
  Future<Resource<PaginatedListEntity<MediaEntity>>> call(GetHistoryParams params) {
    return mediaRepository.getHistory(
      page: params.page,
      take: params.take,
    );
  }
}
