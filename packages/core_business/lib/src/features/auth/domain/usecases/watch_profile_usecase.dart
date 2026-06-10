import '../../domain/entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class WatchProfileUseCase {
  final AuthRepository _repository;

  WatchProfileUseCase(this._repository);

  Stream<UserEntity> call() {
    return _repository.watchProfile();
  }

  UserEntity? get cachedUser => _repository.cachedUser;
}
