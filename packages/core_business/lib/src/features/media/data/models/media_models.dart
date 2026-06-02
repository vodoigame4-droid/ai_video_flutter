import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/media_entities.dart';

part 'media_models.freezed.dart';
part 'media_models.g.dart';

Object? _readStringId(Map json, String key) {
  return json['id']?.toString();
}

Object? _readOrgId(Map json, String key) {
  final val = json['orgId'] ?? json['org_id'];
  if (val is num) return val.toInt();
  if (val is String) return int.tryParse(val) ?? 0;
  return 0;
}

Object? _readPaginatedData(Map json, String key) {
  return json['data'] ?? json['docs'] ?? const [];
}

Object? _readPageCount(Map json, String key) {
  return json['pageCount'] ?? json['totalPage'] ?? 0;
}

Object? _readImageUrl(Map json, String key) => json['imageUrl'] ?? json['image_url'];
Object? _readImageUrls(Map json, String key) => json['imageUrls'] ?? json['image_urls'];
Object? _readImageQuantity(Map json, String key) => json['imageQuantity'] ?? json['image_quantity'];
Object? _readRequestId(Map json, String key) => json['requestId'] ?? json['request_id'];
Object? _readResultUrl(Map json, String key) => json['resultUrl'] ?? json['result_url'];
Object? _readFinishedTime(Map json, String key) => json['finishedTime'] ?? json['finished_time'];
Object? _readThemeId(Map json, String key) => json['themeId'] ?? json['theme_id'];
Object? _readThumbnailUrl(Map json, String key) => json['thumbnailUrl'] ?? json['thumbnail_url'];
Object? _readCreatedAt(Map json, String key) => json['createdAt'] ?? json['created_at'];
Object? _readSourceUrl(Map json, String key) => json['sourceUrl'] ?? json['source_url'];
Object? _readSourceUrls(Map json, String key) => json['sourceUrls'] ?? json['source_urls'];
Object? _readIsHd(Map json, String key) {
  final val = json['isHd'] ?? json['is_hd'];
  if (val is bool) return val;
  if (val is String) return val.toLowerCase() == 'true';
  return false;
}
Object? _readIsLongTime(Map json, String key) {
  final val = json['isLongTime'] ?? json['is_long_time'];
  if (val is bool) return val;
  if (val is String) return val.toLowerCase() == 'true';
  return false;
}

@freezed
abstract class ThemeModel with _$ThemeModel {
  const factory ThemeModel({
    required String id,
    required String name,
    required String? description,
    @JsonKey(readValue: _readResultUrl) required String? resultUrl,
    @JsonKey(readValue: _readSourceUrl) required String? sourceUrl,
    @JsonKey(readValue: _readSourceUrls) required List<String>? sourceUrls,
    @JsonKey(readValue: _readThumbnailUrl) required String? thumbnailUrl,
    required String? prompt,
    required String? type,
    @JsonKey(readValue: _readOrgId) required int orgId,
  }) = _ThemeModel;

  factory ThemeModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeModelFromJson(json);
}

extension ThemeModelX on ThemeModel {
  ThemeEntity toEntity() => ThemeEntity(
        id: id,
        name: name,
        description: description ?? '',
        resultUrl: resultUrl ?? '',
        sourceUrl: sourceUrl ?? '',
        sourceUrls: sourceUrls ?? [],
        thumbnailUrl: thumbnailUrl ?? '',
        prompt: prompt ?? '',
        type: type ?? '',
        orgId: orgId,
      );
}

@freezed
abstract class HomeCategoryModel with _$HomeCategoryModel {
  const factory HomeCategoryModel({
    @JsonKey(readValue: _readStringId) required String id,
    required String name,
    @JsonKey(name: 'themes') required List<ThemeModel>? theme,
  }) = _HomeCategoryModel;

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryModelFromJson(json);
}

extension HomeCategoryModelX on HomeCategoryModel {
  HomeCategoryEntity toEntity() => HomeCategoryEntity(
        id: id,
        name: name,
        theme: theme?.map((e) => e.toEntity()).toList(),
      );
}

@freezed
abstract class CreateTgvRequestModel with _$CreateTgvRequestModel {
  const factory CreateTgvRequestModel({
    required String imageUrl,
    required String name,
    required String prompt,
    required String themeId,
    required bool isHd,
    required bool isLongTime,
    required String themeType,
    required int themeOrgId,
    @Default('IMAGE_TO_VIDEO') String serviceType,
    String? videoUrl,
  }) = _CreateTgvRequestModel;

  factory CreateTgvRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTgvRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class MediaModel with _$MediaModel {
  const factory MediaModel({
    required String id,
    required String name,
    @JsonKey(readValue: _readImageUrl) required String? imageUrl,
    @JsonKey(readValue: _readImageUrls) required List<String>? imageUrls,
    @JsonKey(readValue: _readImageQuantity) @Default(1) int imageQuantity,
    @JsonKey(readValue: _readRequestId) @Default('') String requestId,
    @JsonKey(readValue: _readResultUrl) required String? resultUrl,
    @JsonKey(readValue: _readFinishedTime) required String? finishedTime,
    required String prompt,
    @JsonKey(readValue: _readIsHd) @Default(false) bool isHd,
    @JsonKey(readValue: _readIsLongTime) @Default(false) bool isLongTime,
    @JsonKey(readValue: _readThemeId) required String themeId,
    @JsonKey(readValue: _readThumbnailUrl) required String? thumbnailUrl,
    required String status,
    @JsonKey(readValue: _readCreatedAt) required String createdAt,
  }) = _MediaModel;

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);
}

extension MediaModelX on MediaModel {
  MediaEntity toEntity() => MediaEntity(
        id: id,
        name: name,
        imageUrl: imageUrl ?? '',
        imageUrls: imageUrls,
        imageQuantity: imageQuantity,
        requestId: requestId,
        resultUrl: resultUrl,
        finishedTime: finishedTime != null ? DateTime.tryParse(finishedTime!) : null,
        prompt: prompt,
        isHd: isHd,
        isLongTime: isLongTime,
        themeId: themeId,
        thumbnailUrl: thumbnailUrl,
        status: status,
        createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
      );
}

@freezed
abstract class MediaStatusModel with _$MediaStatusModel {
  const factory MediaStatusModel({
    required String id,
    required String status,
    @JsonKey(readValue: _readResultUrl) required String? resultUrl,
    @JsonKey(readValue: _readFinishedTime) required String? finishedTime,
  }) = _MediaStatusModel;

  factory MediaStatusModel.fromJson(Map<String, dynamic> json) =>
      _$MediaStatusModelFromJson(json);
}

extension MediaStatusModelX on MediaStatusModel {
  MediaStatusEntity toEntity() => MediaStatusEntity(
        id: id,
        status: status,
        resultUrl: resultUrl,
        finishedTime: finishedTime != null ? DateTime.tryParse(finishedTime!) : null,
      );
}

@freezed
abstract class PaginationMetaModel with _$PaginationMetaModel {
  const factory PaginationMetaModel({
    required int page,
    required int take,
    required int total,
    @JsonKey(readValue: _readPageCount) required int pageCount,
  }) = _PaginationMetaModel;

  factory PaginationMetaModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaModelFromJson(json);
}

extension PaginationMetaModelX on PaginationMetaModel {
  PaginationMetaEntity toEntity() => PaginationMetaEntity(
        page: page,
        take: take,
        total: total,
        pageCount: pageCount,
      );
}

@JsonSerializable(genericArgumentFactories: true)
class PaginatedListModel<T> {
  @JsonKey(readValue: _readPaginatedData)
  final List<T> data;
  final PaginationMetaModel meta;

  PaginatedListModel({required this.data, required this.meta});

  factory PaginatedListModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedListModelFromJson(json, fromJsonT);
}

@freezed
abstract class UploadResponseModel with _$UploadResponseModel {
  const factory UploadResponseModel({
    required String url,
  }) = _UploadResponseModel;

  factory UploadResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseModelFromJson(json);
}

@freezed
abstract class SuggestionRequestModel with _$SuggestionRequestModel {
  const factory SuggestionRequestModel({
    required String imageUrl,
  }) = _SuggestionRequestModel;

  factory SuggestionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SuggestionRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class SuggestionResponseModel with _$SuggestionResponseModel {
  const factory SuggestionResponseModel({
    required String prompt,
  }) = _SuggestionResponseModel;

  factory SuggestionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SuggestionResponseModelFromJson(json);
}
