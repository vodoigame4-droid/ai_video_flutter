import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_video_entity.freezed.dart';

@freezed
abstract class UserVideoEntity with _$UserVideoEntity {
  const factory UserVideoEntity({
    required String id,
    required String title,
    required String imageUrl,
    required String status, // 'generating' or 'done'
    required double progress, // 0.0 to 1.0
    required String createdAt,
    required bool isLiked,
  }) = _UserVideoEntity;
}
