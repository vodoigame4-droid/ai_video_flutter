import '../../../../core/resources/resource.dart';
import '../../data/models/auth_models.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Resource<UserEntity>> login(String deviceId, String? refCode);
  Future<Resource<UserEntity>> refresh(RefreshRequestModel request);
  Future<Resource<UserEntity>> getProfile();
  Future<Resource<UserEntity>> updateProfile(UpdateUserRequestModel request);
}
