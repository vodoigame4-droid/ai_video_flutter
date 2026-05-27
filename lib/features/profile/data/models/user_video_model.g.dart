// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserVideoModel _$UserVideoModelFromJson(Map<String, dynamic> json) =>
    _UserVideoModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      status: json['status'] as String,
      progress: (json['progress'] as num).toDouble(),
      createdAt: json['createdAt'] as String,
      isLiked: json['isLiked'] as bool,
    );

Map<String, dynamic> _$UserVideoModelToJson(_UserVideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'status': instance.status,
      'progress': instance.progress,
      'createdAt': instance.createdAt,
      'isLiked': instance.isLiked,
    };
