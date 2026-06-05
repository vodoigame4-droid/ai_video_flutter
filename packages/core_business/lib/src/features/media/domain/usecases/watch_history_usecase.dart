import '../../../../core/resources/resource.dart';
import '../entities/media_entities.dart';
import '../repositories/media_repository.dart';

class WatchHistoryUseCase {
  final MediaRepository _repository;

  WatchHistoryUseCase(this._repository);

  Stream<Resource<List<MediaEntity>>> call() {
    return _repository.watchHistory();
  }
}
