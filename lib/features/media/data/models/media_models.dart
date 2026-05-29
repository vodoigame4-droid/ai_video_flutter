import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/media_entities.dart';

part 'media_models.freezed.dart';
part 'media_models.g.dart';

@freezed
abstract class ThemeModel with _$ThemeModel {
  const factory ThemeModel({
    required String id,
    required String name,
    required String description,
    required String resultUrl,
    required String sourceUrl,
    required List<String>? sourceUrls,
    required String thumbnailUrl,
    required String prompt,
    required String type,
    required int orgId,
  }) = _ThemeModel;

  factory ThemeModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeModelFromJson(json);
}

extension ThemeModelX on ThemeModel {
  ThemeEntity toEntity() => ThemeEntity(
        id: id,
        name: name,
        description: description,
        resultUrl: resultUrl,
        sourceUrl: sourceUrl,
        sourceUrls: sourceUrls ?? [],
        thumbnailUrl: thumbnailUrl,
        prompt: prompt,
        type: type,
        orgId: orgId,
      );
}

@freezed
abstract class HomeCategoryModel with _$HomeCategoryModel {
  const factory HomeCategoryModel({
    required int id,
    required String name,
    required List<ThemeModel>? theme,
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
    required String imageUrl,
    required List<String>? imageUrls,
    required int imageQuantity,
    required String requestId,
    required String? resultUrl,
    required String? finishedTime,
    required String prompt,
    required bool isHd,
    required bool isLongTime,
    required String themeId,
    required String? thumbnailUrl,
    required String status,
    required String createdAt,
  }) = _MediaModel;

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);
}

extension MediaModelX on MediaModel {
  MediaEntity toEntity() => MediaEntity(
        id: id,
        name: name,
        imageUrl: imageUrl,
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
    required String? resultUrl,
    required String? finishedTime,
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
    required int pageCount,
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
