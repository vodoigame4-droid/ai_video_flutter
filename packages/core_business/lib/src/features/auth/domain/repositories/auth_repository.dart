import '../../../../core/resources/resource.dart';
import '../../data/models/auth_models.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  UserEntity? get cachedUser;
  Future<Resource<UserEntity>> login(String deviceId, String? refCode);
  Future<Resource<UserEntity>> refresh(RefreshRequestModel request);
  Future<Resource<UserEntity>> getProfile();
  Future<Resource<UserEntity>> updateProfile(UpdateUserRequestModel request);
  Stream<UserEntity> watchProfile();
  Future<Resource<void>> rateApp();
  Future<Resource<UserEntity>> updateReviewer();
}

