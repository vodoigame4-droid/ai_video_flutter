import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_video_entity.dart';

part 'user_video_model.freezed.dart';
part 'user_video_model.g.dart';

@freezed
abstract class UserVideoModel with _$UserVideoModel {
  const factory UserVideoModel({
    required String id,
    required String title,
    required String imageUrl,
    required String status, // 'generating' or 'done'
    required double progress, // 0.0 to 1.0
    required String createdAt,
    required bool isLiked,
  }) = _UserVideoModel;

  factory UserVideoModel.fromJson(Map<String, dynamic> json) =>
      _$UserVideoModelFromJson(json);
}

extension UserVideoModelX on UserVideoModel {
  UserVideoEntity toEntity() => UserVideoEntity(
        id: id,
        title: title,
        imageUrl: imageUrl,
        status: status,
        progress: progress,
        createdAt: createdAt,
        isLiked: isLiked,
      );
}
