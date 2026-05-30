import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_entities.freezed.dart';

@freezed
abstract class ThemeEntity with _$ThemeEntity {
  const factory ThemeEntity({
    required String id,
    required String name,
    required String description,
    required String resultUrl,
    required String sourceUrl,
    required List<String> sourceUrls,
    required String thumbnailUrl,
    required String prompt,
    required String type,
    required int orgId,
  }) = _ThemeEntity;
}

@freezed
abstract class HomeCategoryEntity with _$HomeCategoryEntity {
  const factory HomeCategoryEntity({
    required String id,
    required String name,
    required List<ThemeEntity>? theme,
  }) = _HomeCategoryEntity;
}

@freezed
abstract class MediaEntity with _$MediaEntity {
  const factory MediaEntity({
    required String id,
    required String name,
    required String imageUrl,
    required List<String>? imageUrls,
    required int imageQuantity,
    required String requestId,
    required String? resultUrl,
    required DateTime? finishedTime,
    required String prompt,
    required bool isHd,
    required bool isLongTime,
    required String themeId,
    required String? thumbnailUrl,
    required String status,
    required DateTime createdAt,
  }) = _MediaEntity;
}

@freezed
abstract class MediaStatusEntity with _$MediaStatusEntity {
  const factory MediaStatusEntity({
    required String id,
    required String status,
    required String? resultUrl,
    required DateTime? finishedTime,
  }) = _MediaStatusEntity;
}

@freezed
abstract class PaginationMetaEntity with _$PaginationMetaEntity {
  const factory PaginationMetaEntity({
    required int page,
    required int take,
    required int total,
    required int pageCount,
  }) = _PaginationMetaEntity;
}

@freezed
abstract class PaginatedListEntity<T> with _$PaginatedListEntity<T> {
  const factory PaginatedListEntity({
    required List<T> data,
    required PaginationMetaEntity meta,
  }) = _PaginatedListEntity<T>;
}
