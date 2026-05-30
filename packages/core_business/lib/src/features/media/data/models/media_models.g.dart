// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedListModel<T> _$PaginatedListModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginatedListModel<T>(
  data: (_readPaginatedData(json, 'data') as List<dynamic>)
      .map(fromJsonT)
      .toList(),
  meta: PaginationMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaginatedListModelToJson<T>(
  PaginatedListModel<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data.map(toJsonT).toList(),
  'meta': instance.meta,
};

_ThemeModel _$ThemeModelFromJson(Map<String, dynamic> json) => _ThemeModel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  resultUrl: json['resultUrl'] as String?,
  sourceUrl: json['sourceUrl'] as String?,
  sourceUrls: (json['sourceUrls'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  thumbnailUrl: json['thumbnailUrl'] as String?,
  prompt: json['prompt'] as String?,
  type: json['type'] as String?,
  orgId: (_readOrgId(json, 'orgId') as num).toInt(),
);

Map<String, dynamic> _$ThemeModelToJson(_ThemeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'resultUrl': instance.resultUrl,
      'sourceUrl': instance.sourceUrl,
      'sourceUrls': instance.sourceUrls,
      'thumbnailUrl': instance.thumbnailUrl,
      'prompt': instance.prompt,
      'type': instance.type,
      'orgId': instance.orgId,
    };

_HomeCategoryModel _$HomeCategoryModelFromJson(Map<String, dynamic> json) =>
    _HomeCategoryModel(
      id: _readStringId(json, 'id') as String,
      name: json['name'] as String,
      theme: (json['themes'] as List<dynamic>?)
          ?.map((e) => ThemeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeCategoryModelToJson(_HomeCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'themes': instance.theme,
    };

_CreateTgvRequestModel _$CreateTgvRequestModelFromJson(
  Map<String, dynamic> json,
) => _CreateTgvRequestModel(
  imageUrl: json['imageUrl'] as String,
  name: json['name'] as String,
  prompt: json['prompt'] as String,
  themeId: json['themeId'] as String,
  isHd: json['isHd'] as bool,
  isLongTime: json['isLongTime'] as bool,
  themeType: json['themeType'] as String,
  themeOrgId: (json['themeOrgId'] as num).toInt(),
  serviceType: json['serviceType'] as String? ?? 'IMAGE_TO_VIDEO',
);

Map<String, dynamic> _$CreateTgvRequestModelToJson(
  _CreateTgvRequestModel instance,
) => <String, dynamic>{
  'imageUrl': instance.imageUrl,
  'name': instance.name,
  'prompt': instance.prompt,
  'themeId': instance.themeId,
  'isHd': instance.isHd,
  'isLongTime': instance.isLongTime,
  'themeType': instance.themeType,
  'themeOrgId': instance.themeOrgId,
  'serviceType': instance.serviceType,
};

_MediaModel _$MediaModelFromJson(Map<String, dynamic> json) => _MediaModel(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String?,
  imageUrls: (json['imageUrls'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  imageQuantity: (json['imageQuantity'] as num?)?.toInt() ?? 1,
  requestId: json['requestId'] as String? ?? '',
  resultUrl: json['resultUrl'] as String?,
  finishedTime: json['finishedTime'] as String?,
  prompt: json['prompt'] as String,
  isHd: json['isHd'] as bool? ?? false,
  isLongTime: json['isLongTime'] as bool? ?? false,
  themeId: json['themeId'] as String,
  thumbnailUrl: json['thumbnailUrl'] as String?,
  status: json['status'] as String,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$MediaModelToJson(_MediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'imageUrls': instance.imageUrls,
      'imageQuantity': instance.imageQuantity,
      'requestId': instance.requestId,
      'resultUrl': instance.resultUrl,
      'finishedTime': instance.finishedTime,
      'prompt': instance.prompt,
      'isHd': instance.isHd,
      'isLongTime': instance.isLongTime,
      'themeId': instance.themeId,
      'thumbnailUrl': instance.thumbnailUrl,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };

_MediaStatusModel _$MediaStatusModelFromJson(Map<String, dynamic> json) =>
    _MediaStatusModel(
      id: json['id'] as String,
      status: json['status'] as String,
      resultUrl: json['resultUrl'] as String?,
      finishedTime: json['finishedTime'] as String?,
    );

Map<String, dynamic> _$MediaStatusModelToJson(_MediaStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'resultUrl': instance.resultUrl,
      'finishedTime': instance.finishedTime,
    };

_PaginationMetaModel _$PaginationMetaModelFromJson(Map<String, dynamic> json) =>
    _PaginationMetaModel(
      page: (json['page'] as num).toInt(),
      take: (json['take'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      pageCount: (_readPageCount(json, 'pageCount') as num).toInt(),
    );

Map<String, dynamic> _$PaginationMetaModelToJson(
  _PaginationMetaModel instance,
) => <String, dynamic>{
  'page': instance.page,
  'take': instance.take,
  'total': instance.total,
  'pageCount': instance.pageCount,
};

_UploadResponseModel _$UploadResponseModelFromJson(Map<String, dynamic> json) =>
    _UploadResponseModel(url: json['url'] as String);

Map<String, dynamic> _$UploadResponseModelToJson(
  _UploadResponseModel instance,
) => <String, dynamic>{'url': instance.url};
