// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeEntity {

 String get id; String get name; String get description; String get resultUrl; String get sourceUrl; List<String> get sourceUrls; String get thumbnailUrl; String get prompt; String get type; int get orgId;
/// Create a copy of ThemeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeEntityCopyWith<ThemeEntity> get copyWith => _$ThemeEntityCopyWithImpl<ThemeEntity>(this as ThemeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.resultUrl, resultUrl) || other.resultUrl == resultUrl)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&const DeepCollectionEquality().equals(other.sourceUrls, sourceUrls)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.type, type) || other.type == type)&&(identical(other.orgId, orgId) || other.orgId == orgId));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,resultUrl,sourceUrl,const DeepCollectionEquality().hash(sourceUrls),thumbnailUrl,prompt,type,orgId);

@override
String toString() {
  return 'ThemeEntity(id: $id, name: $name, description: $description, resultUrl: $resultUrl, sourceUrl: $sourceUrl, sourceUrls: $sourceUrls, thumbnailUrl: $thumbnailUrl, prompt: $prompt, type: $type, orgId: $orgId)';
}


}

/// @nodoc
abstract mixin class $ThemeEntityCopyWith<$Res>  {
  factory $ThemeEntityCopyWith(ThemeEntity value, $Res Function(ThemeEntity) _then) = _$ThemeEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String resultUrl, String sourceUrl, List<String> sourceUrls, String thumbnailUrl, String prompt, String type, int orgId
});




}
/// @nodoc
class _$ThemeEntityCopyWithImpl<$Res>
    implements $ThemeEntityCopyWith<$Res> {
  _$ThemeEntityCopyWithImpl(this._self, this._then);

  final ThemeEntity _self;
  final $Res Function(ThemeEntity) _then;

/// Create a copy of ThemeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? resultUrl = null,Object? sourceUrl = null,Object? sourceUrls = null,Object? thumbnailUrl = null,Object? prompt = null,Object? type = null,Object? orgId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,resultUrl: null == resultUrl ? _self.resultUrl : resultUrl // ignore: cast_nullable_to_non_nullable
as String,sourceUrl: null == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String,sourceUrls: null == sourceUrls ? _self.sourceUrls : sourceUrls // ignore: cast_nullable_to_non_nullable
as List<String>,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeEntity].
extension ThemeEntityPatterns on ThemeEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeEntity value)  $default,){
final _that = this;
switch (_that) {
case _ThemeEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String resultUrl,  String sourceUrl,  List<String> sourceUrls,  String thumbnailUrl,  String prompt,  String type,  int orgId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.resultUrl,_that.sourceUrl,_that.sourceUrls,_that.thumbnailUrl,_that.prompt,_that.type,_that.orgId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String resultUrl,  String sourceUrl,  List<String> sourceUrls,  String thumbnailUrl,  String prompt,  String type,  int orgId)  $default,) {final _that = this;
switch (_that) {
case _ThemeEntity():
return $default(_that.id,_that.name,_that.description,_that.resultUrl,_that.sourceUrl,_that.sourceUrls,_that.thumbnailUrl,_that.prompt,_that.type,_that.orgId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String resultUrl,  String sourceUrl,  List<String> sourceUrls,  String thumbnailUrl,  String prompt,  String type,  int orgId)?  $default,) {final _that = this;
switch (_that) {
case _ThemeEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.resultUrl,_that.sourceUrl,_that.sourceUrls,_that.thumbnailUrl,_that.prompt,_that.type,_that.orgId);case _:
  return null;

}
}

}

/// @nodoc


class _ThemeEntity implements ThemeEntity {
  const _ThemeEntity({required this.id, required this.name, required this.description, required this.resultUrl, required this.sourceUrl, required final  List<String> sourceUrls, required this.thumbnailUrl, required this.prompt, required this.type, required this.orgId}): _sourceUrls = sourceUrls;
  

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String resultUrl;
@override final  String sourceUrl;
 final  List<String> _sourceUrls;
@override List<String> get sourceUrls {
  if (_sourceUrls is EqualUnmodifiableListView) return _sourceUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sourceUrls);
}

@override final  String thumbnailUrl;
@override final  String prompt;
@override final  String type;
@override final  int orgId;

/// Create a copy of ThemeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeEntityCopyWith<_ThemeEntity> get copyWith => __$ThemeEntityCopyWithImpl<_ThemeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.resultUrl, resultUrl) || other.resultUrl == resultUrl)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&const DeepCollectionEquality().equals(other._sourceUrls, _sourceUrls)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.type, type) || other.type == type)&&(identical(other.orgId, orgId) || other.orgId == orgId));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,resultUrl,sourceUrl,const DeepCollectionEquality().hash(_sourceUrls),thumbnailUrl,prompt,type,orgId);

@override
String toString() {
  return 'ThemeEntity(id: $id, name: $name, description: $description, resultUrl: $resultUrl, sourceUrl: $sourceUrl, sourceUrls: $sourceUrls, thumbnailUrl: $thumbnailUrl, prompt: $prompt, type: $type, orgId: $orgId)';
}


}

/// @nodoc
abstract mixin class _$ThemeEntityCopyWith<$Res> implements $ThemeEntityCopyWith<$Res> {
  factory _$ThemeEntityCopyWith(_ThemeEntity value, $Res Function(_ThemeEntity) _then) = __$ThemeEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String resultUrl, String sourceUrl, List<String> sourceUrls, String thumbnailUrl, String prompt, String type, int orgId
});




}
/// @nodoc
class __$ThemeEntityCopyWithImpl<$Res>
    implements _$ThemeEntityCopyWith<$Res> {
  __$ThemeEntityCopyWithImpl(this._self, this._then);

  final _ThemeEntity _self;
  final $Res Function(_ThemeEntity) _then;

/// Create a copy of ThemeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? resultUrl = null,Object? sourceUrl = null,Object? sourceUrls = null,Object? thumbnailUrl = null,Object? prompt = null,Object? type = null,Object? orgId = null,}) {
  return _then(_ThemeEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,resultUrl: null == resultUrl ? _self.resultUrl : resultUrl // ignore: cast_nullable_to_non_nullable
as String,sourceUrl: null == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String,sourceUrls: null == sourceUrls ? _self._sourceUrls : sourceUrls // ignore: cast_nullable_to_non_nullable
as List<String>,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$HomeCategoryEntity {

 int get id; String get name; List<ThemeEntity>? get theme;
/// Create a copy of HomeCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeCategoryEntityCopyWith<HomeCategoryEntity> get copyWith => _$HomeCategoryEntityCopyWithImpl<HomeCategoryEntity>(this as HomeCategoryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeCategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.theme, theme));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(theme));

@override
String toString() {
  return 'HomeCategoryEntity(id: $id, name: $name, theme: $theme)';
}


}

/// @nodoc
abstract mixin class $HomeCategoryEntityCopyWith<$Res>  {
  factory $HomeCategoryEntityCopyWith(HomeCategoryEntity value, $Res Function(HomeCategoryEntity) _then) = _$HomeCategoryEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, List<ThemeEntity>? theme
});




}
/// @nodoc
class _$HomeCategoryEntityCopyWithImpl<$Res>
    implements $HomeCategoryEntityCopyWith<$Res> {
  _$HomeCategoryEntityCopyWithImpl(this._self, this._then);

  final HomeCategoryEntity _self;
  final $Res Function(HomeCategoryEntity) _then;

/// Create a copy of HomeCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? theme = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as List<ThemeEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeCategoryEntity].
extension HomeCategoryEntityPatterns on HomeCategoryEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeCategoryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeCategoryEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeCategoryEntity value)  $default,){
final _that = this;
switch (_that) {
case _HomeCategoryEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeCategoryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HomeCategoryEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  List<ThemeEntity>? theme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeCategoryEntity() when $default != null:
return $default(_that.id,_that.name,_that.theme);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  List<ThemeEntity>? theme)  $default,) {final _that = this;
switch (_that) {
case _HomeCategoryEntity():
return $default(_that.id,_that.name,_that.theme);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  List<ThemeEntity>? theme)?  $default,) {final _that = this;
switch (_that) {
case _HomeCategoryEntity() when $default != null:
return $default(_that.id,_that.name,_that.theme);case _:
  return null;

}
}

}

/// @nodoc


class _HomeCategoryEntity implements HomeCategoryEntity {
  const _HomeCategoryEntity({required this.id, required this.name, required final  List<ThemeEntity>? theme}): _theme = theme;
  

@override final  int id;
@override final  String name;
 final  List<ThemeEntity>? _theme;
@override List<ThemeEntity>? get theme {
  final value = _theme;
  if (value == null) return null;
  if (_theme is EqualUnmodifiableListView) return _theme;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HomeCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeCategoryEntityCopyWith<_HomeCategoryEntity> get copyWith => __$HomeCategoryEntityCopyWithImpl<_HomeCategoryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeCategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._theme, _theme));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_theme));

@override
String toString() {
  return 'HomeCategoryEntity(id: $id, name: $name, theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$HomeCategoryEntityCopyWith<$Res> implements $HomeCategoryEntityCopyWith<$Res> {
  factory _$HomeCategoryEntityCopyWith(_HomeCategoryEntity value, $Res Function(_HomeCategoryEntity) _then) = __$HomeCategoryEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, List<ThemeEntity>? theme
});




}
/// @nodoc
class __$HomeCategoryEntityCopyWithImpl<$Res>
    implements _$HomeCategoryEntityCopyWith<$Res> {
  __$HomeCategoryEntityCopyWithImpl(this._self, this._then);

  final _HomeCategoryEntity _self;
  final $Res Function(_HomeCategoryEntity) _then;

/// Create a copy of HomeCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? theme = freezed,}) {
  return _then(_HomeCategoryEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,theme: freezed == theme ? _self._theme : theme // ignore: cast_nullable_to_non_nullable
as List<ThemeEntity>?,
  ));
}


}

/// @nodoc
mixin _$MediaEntity {

 String get id; String get name; String get imageUrl; List<String>? get imageUrls; int get imageQuantity; String get requestId; String? get resultUrl; DateTime? get finishedTime; String get prompt; bool get isHd; bool get isLongTime; String get themeId; String? get thumbnailUrl; String get status; DateTime get createdAt;
/// Create a copy of MediaEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaEntityCopyWith<MediaEntity> get copyWith => _$MediaEntityCopyWithImpl<MediaEntity>(this as MediaEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&(identical(other.imageQuantity, imageQuantity) || other.imageQuantity == imageQuantity)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.resultUrl, resultUrl) || other.resultUrl == resultUrl)&&(identical(other.finishedTime, finishedTime) || other.finishedTime == finishedTime)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.isHd, isHd) || other.isHd == isHd)&&(identical(other.isLongTime, isLongTime) || other.isLongTime == isLongTime)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,const DeepCollectionEquality().hash(imageUrls),imageQuantity,requestId,resultUrl,finishedTime,prompt,isHd,isLongTime,themeId,thumbnailUrl,status,createdAt);

@override
String toString() {
  return 'MediaEntity(id: $id, name: $name, imageUrl: $imageUrl, imageUrls: $imageUrls, imageQuantity: $imageQuantity, requestId: $requestId, resultUrl: $resultUrl, finishedTime: $finishedTime, prompt: $prompt, isHd: $isHd, isLongTime: $isLongTime, themeId: $themeId, thumbnailUrl: $thumbnailUrl, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MediaEntityCopyWith<$Res>  {
  factory $MediaEntityCopyWith(MediaEntity value, $Res Function(MediaEntity) _then) = _$MediaEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String imageUrl, List<String>? imageUrls, int imageQuantity, String requestId, String? resultUrl, DateTime? finishedTime, String prompt, bool isHd, bool isLongTime, String themeId, String? thumbnailUrl, String status, DateTime createdAt
});




}
/// @nodoc
class _$MediaEntityCopyWithImpl<$Res>
    implements $MediaEntityCopyWith<$Res> {
  _$MediaEntityCopyWithImpl(this._self, this._then);

  final MediaEntity _self;
  final $Res Function(MediaEntity) _then;

/// Create a copy of MediaEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? imageUrls = freezed,Object? imageQuantity = null,Object? requestId = null,Object? resultUrl = freezed,Object? finishedTime = freezed,Object? prompt = null,Object? isHd = null,Object? isLongTime = null,Object? themeId = null,Object? thumbnailUrl = freezed,Object? status = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrls: freezed == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,imageQuantity: null == imageQuantity ? _self.imageQuantity : imageQuantity // ignore: cast_nullable_to_non_nullable
as int,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,resultUrl: freezed == resultUrl ? _self.resultUrl : resultUrl // ignore: cast_nullable_to_non_nullable
as String?,finishedTime: freezed == finishedTime ? _self.finishedTime : finishedTime // ignore: cast_nullable_to_non_nullable
as DateTime?,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,isHd: null == isHd ? _self.isHd : isHd // ignore: cast_nullable_to_non_nullable
as bool,isLongTime: null == isLongTime ? _self.isLongTime : isLongTime // ignore: cast_nullable_to_non_nullable
as bool,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaEntity].
extension MediaEntityPatterns on MediaEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaEntity value)  $default,){
final _that = this;
switch (_that) {
case _MediaEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MediaEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String imageUrl,  List<String>? imageUrls,  int imageQuantity,  String requestId,  String? resultUrl,  DateTime? finishedTime,  String prompt,  bool isHd,  bool isLongTime,  String themeId,  String? thumbnailUrl,  String status,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaEntity() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.imageUrls,_that.imageQuantity,_that.requestId,_that.resultUrl,_that.finishedTime,_that.prompt,_that.isHd,_that.isLongTime,_that.themeId,_that.thumbnailUrl,_that.status,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String imageUrl,  List<String>? imageUrls,  int imageQuantity,  String requestId,  String? resultUrl,  DateTime? finishedTime,  String prompt,  bool isHd,  bool isLongTime,  String themeId,  String? thumbnailUrl,  String status,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _MediaEntity():
return $default(_that.id,_that.name,_that.imageUrl,_that.imageUrls,_that.imageQuantity,_that.requestId,_that.resultUrl,_that.finishedTime,_that.prompt,_that.isHd,_that.isLongTime,_that.themeId,_that.thumbnailUrl,_that.status,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String imageUrl,  List<String>? imageUrls,  int imageQuantity,  String requestId,  String? resultUrl,  DateTime? finishedTime,  String prompt,  bool isHd,  bool isLongTime,  String themeId,  String? thumbnailUrl,  String status,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MediaEntity() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.imageUrls,_that.imageQuantity,_that.requestId,_that.resultUrl,_that.finishedTime,_that.prompt,_that.isHd,_that.isLongTime,_that.themeId,_that.thumbnailUrl,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _MediaEntity implements MediaEntity {
  const _MediaEntity({required this.id, required this.name, required this.imageUrl, required final  List<String>? imageUrls, required this.imageQuantity, required this.requestId, required this.resultUrl, required this.finishedTime, required this.prompt, required this.isHd, required this.isLongTime, required this.themeId, required this.thumbnailUrl, required this.status, required this.createdAt}): _imageUrls = imageUrls;
  

@override final  String id;
@override final  String name;
@override final  String imageUrl;
 final  List<String>? _imageUrls;
@override List<String>? get imageUrls {
  final value = _imageUrls;
  if (value == null) return null;
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int imageQuantity;
@override final  String requestId;
@override final  String? resultUrl;
@override final  DateTime? finishedTime;
@override final  String prompt;
@override final  bool isHd;
@override final  bool isLongTime;
@override final  String themeId;
@override final  String? thumbnailUrl;
@override final  String status;
@override final  DateTime createdAt;

/// Create a copy of MediaEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaEntityCopyWith<_MediaEntity> get copyWith => __$MediaEntityCopyWithImpl<_MediaEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&(identical(other.imageQuantity, imageQuantity) || other.imageQuantity == imageQuantity)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.resultUrl, resultUrl) || other.resultUrl == resultUrl)&&(identical(other.finishedTime, finishedTime) || other.finishedTime == finishedTime)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.isHd, isHd) || other.isHd == isHd)&&(identical(other.isLongTime, isLongTime) || other.isLongTime == isLongTime)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,const DeepCollectionEquality().hash(_imageUrls),imageQuantity,requestId,resultUrl,finishedTime,prompt,isHd,isLongTime,themeId,thumbnailUrl,status,createdAt);

@override
String toString() {
  return 'MediaEntity(id: $id, name: $name, imageUrl: $imageUrl, imageUrls: $imageUrls, imageQuantity: $imageQuantity, requestId: $requestId, resultUrl: $resultUrl, finishedTime: $finishedTime, prompt: $prompt, isHd: $isHd, isLongTime: $isLongTime, themeId: $themeId, thumbnailUrl: $thumbnailUrl, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MediaEntityCopyWith<$Res> implements $MediaEntityCopyWith<$Res> {
  factory _$MediaEntityCopyWith(_MediaEntity value, $Res Function(_MediaEntity) _then) = __$MediaEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String imageUrl, List<String>? imageUrls, int imageQuantity, String requestId, String? resultUrl, DateTime? finishedTime, String prompt, bool isHd, bool isLongTime, String themeId, String? thumbnailUrl, String status, DateTime createdAt
});




}
/// @nodoc
class __$MediaEntityCopyWithImpl<$Res>
    implements _$MediaEntityCopyWith<$Res> {
  __$MediaEntityCopyWithImpl(this._self, this._then);

  final _MediaEntity _self;
  final $Res Function(_MediaEntity) _then;

/// Create a copy of MediaEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? imageUrls = freezed,Object? imageQuantity = null,Object? requestId = null,Object? resultUrl = freezed,Object? finishedTime = freezed,Object? prompt = null,Object? isHd = null,Object? isLongTime = null,Object? themeId = null,Object? thumbnailUrl = freezed,Object? status = null,Object? createdAt = null,}) {
  return _then(_MediaEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrls: freezed == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,imageQuantity: null == imageQuantity ? _self.imageQuantity : imageQuantity // ignore: cast_nullable_to_non_nullable
as int,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,resultUrl: freezed == resultUrl ? _self.resultUrl : resultUrl // ignore: cast_nullable_to_non_nullable
as String?,finishedTime: freezed == finishedTime ? _self.finishedTime : finishedTime // ignore: cast_nullable_to_non_nullable
as DateTime?,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,isHd: null == isHd ? _self.isHd : isHd // ignore: cast_nullable_to_non_nullable
as bool,isLongTime: null == isLongTime ? _self.isLongTime : isLongTime // ignore: cast_nullable_to_non_nullable
as bool,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$MediaStatusEntity {

 String get id; String get status; String? get resultUrl; DateTime? get finishedTime;
/// Create a copy of MediaStatusEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaStatusEntityCopyWith<MediaStatusEntity> get copyWith => _$MediaStatusEntityCopyWithImpl<MediaStatusEntity>(this as MediaStatusEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaStatusEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.resultUrl, resultUrl) || other.resultUrl == resultUrl)&&(identical(other.finishedTime, finishedTime) || other.finishedTime == finishedTime));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,resultUrl,finishedTime);

@override
String toString() {
  return 'MediaStatusEntity(id: $id, status: $status, resultUrl: $resultUrl, finishedTime: $finishedTime)';
}


}

/// @nodoc
abstract mixin class $MediaStatusEntityCopyWith<$Res>  {
  factory $MediaStatusEntityCopyWith(MediaStatusEntity value, $Res Function(MediaStatusEntity) _then) = _$MediaStatusEntityCopyWithImpl;
@useResult
$Res call({
 String id, String status, String? resultUrl, DateTime? finishedTime
});




}
/// @nodoc
class _$MediaStatusEntityCopyWithImpl<$Res>
    implements $MediaStatusEntityCopyWith<$Res> {
  _$MediaStatusEntityCopyWithImpl(this._self, this._then);

  final MediaStatusEntity _self;
  final $Res Function(MediaStatusEntity) _then;

/// Create a copy of MediaStatusEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? resultUrl = freezed,Object? finishedTime = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,resultUrl: freezed == resultUrl ? _self.resultUrl : resultUrl // ignore: cast_nullable_to_non_nullable
as String?,finishedTime: freezed == finishedTime ? _self.finishedTime : finishedTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaStatusEntity].
extension MediaStatusEntityPatterns on MediaStatusEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaStatusEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaStatusEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaStatusEntity value)  $default,){
final _that = this;
switch (_that) {
case _MediaStatusEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaStatusEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MediaStatusEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status,  String? resultUrl,  DateTime? finishedTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaStatusEntity() when $default != null:
return $default(_that.id,_that.status,_that.resultUrl,_that.finishedTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status,  String? resultUrl,  DateTime? finishedTime)  $default,) {final _that = this;
switch (_that) {
case _MediaStatusEntity():
return $default(_that.id,_that.status,_that.resultUrl,_that.finishedTime);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status,  String? resultUrl,  DateTime? finishedTime)?  $default,) {final _that = this;
switch (_that) {
case _MediaStatusEntity() when $default != null:
return $default(_that.id,_that.status,_that.resultUrl,_that.finishedTime);case _:
  return null;

}
}

}

/// @nodoc


class _MediaStatusEntity implements MediaStatusEntity {
  const _MediaStatusEntity({required this.id, required this.status, required this.resultUrl, required this.finishedTime});
  

@override final  String id;
@override final  String status;
@override final  String? resultUrl;
@override final  DateTime? finishedTime;

/// Create a copy of MediaStatusEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaStatusEntityCopyWith<_MediaStatusEntity> get copyWith => __$MediaStatusEntityCopyWithImpl<_MediaStatusEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaStatusEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.resultUrl, resultUrl) || other.resultUrl == resultUrl)&&(identical(other.finishedTime, finishedTime) || other.finishedTime == finishedTime));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,resultUrl,finishedTime);

@override
String toString() {
  return 'MediaStatusEntity(id: $id, status: $status, resultUrl: $resultUrl, finishedTime: $finishedTime)';
}


}

/// @nodoc
abstract mixin class _$MediaStatusEntityCopyWith<$Res> implements $MediaStatusEntityCopyWith<$Res> {
  factory _$MediaStatusEntityCopyWith(_MediaStatusEntity value, $Res Function(_MediaStatusEntity) _then) = __$MediaStatusEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String status, String? resultUrl, DateTime? finishedTime
});




}
/// @nodoc
class __$MediaStatusEntityCopyWithImpl<$Res>
    implements _$MediaStatusEntityCopyWith<$Res> {
  __$MediaStatusEntityCopyWithImpl(this._self, this._then);

  final _MediaStatusEntity _self;
  final $Res Function(_MediaStatusEntity) _then;

/// Create a copy of MediaStatusEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? resultUrl = freezed,Object? finishedTime = freezed,}) {
  return _then(_MediaStatusEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,resultUrl: freezed == resultUrl ? _self.resultUrl : resultUrl // ignore: cast_nullable_to_non_nullable
as String?,finishedTime: freezed == finishedTime ? _self.finishedTime : finishedTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$PaginationMetaEntity {

 int get page; int get take; int get total; int get pageCount;
/// Create a copy of PaginationMetaEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationMetaEntityCopyWith<PaginationMetaEntity> get copyWith => _$PaginationMetaEntityCopyWithImpl<PaginationMetaEntity>(this as PaginationMetaEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationMetaEntity&&(identical(other.page, page) || other.page == page)&&(identical(other.take, take) || other.take == take)&&(identical(other.total, total) || other.total == total)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount));
}


@override
int get hashCode => Object.hash(runtimeType,page,take,total,pageCount);

@override
String toString() {
  return 'PaginationMetaEntity(page: $page, take: $take, total: $total, pageCount: $pageCount)';
}


}

/// @nodoc
abstract mixin class $PaginationMetaEntityCopyWith<$Res>  {
  factory $PaginationMetaEntityCopyWith(PaginationMetaEntity value, $Res Function(PaginationMetaEntity) _then) = _$PaginationMetaEntityCopyWithImpl;
@useResult
$Res call({
 int page, int take, int total, int pageCount
});




}
/// @nodoc
class _$PaginationMetaEntityCopyWithImpl<$Res>
    implements $PaginationMetaEntityCopyWith<$Res> {
  _$PaginationMetaEntityCopyWithImpl(this._self, this._then);

  final PaginationMetaEntity _self;
  final $Res Function(PaginationMetaEntity) _then;

/// Create a copy of PaginationMetaEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? take = null,Object? total = null,Object? pageCount = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,take: null == take ? _self.take : take // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationMetaEntity].
extension PaginationMetaEntityPatterns on PaginationMetaEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationMetaEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationMetaEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationMetaEntity value)  $default,){
final _that = this;
switch (_that) {
case _PaginationMetaEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationMetaEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationMetaEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int take,  int total,  int pageCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationMetaEntity() when $default != null:
return $default(_that.page,_that.take,_that.total,_that.pageCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int take,  int total,  int pageCount)  $default,) {final _that = this;
switch (_that) {
case _PaginationMetaEntity():
return $default(_that.page,_that.take,_that.total,_that.pageCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int take,  int total,  int pageCount)?  $default,) {final _that = this;
switch (_that) {
case _PaginationMetaEntity() when $default != null:
return $default(_that.page,_that.take,_that.total,_that.pageCount);case _:
  return null;

}
}

}

/// @nodoc


class _PaginationMetaEntity implements PaginationMetaEntity {
  const _PaginationMetaEntity({required this.page, required this.take, required this.total, required this.pageCount});
  

@override final  int page;
@override final  int take;
@override final  int total;
@override final  int pageCount;

/// Create a copy of PaginationMetaEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationMetaEntityCopyWith<_PaginationMetaEntity> get copyWith => __$PaginationMetaEntityCopyWithImpl<_PaginationMetaEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationMetaEntity&&(identical(other.page, page) || other.page == page)&&(identical(other.take, take) || other.take == take)&&(identical(other.total, total) || other.total == total)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount));
}


@override
int get hashCode => Object.hash(runtimeType,page,take,total,pageCount);

@override
String toString() {
  return 'PaginationMetaEntity(page: $page, take: $take, total: $total, pageCount: $pageCount)';
}


}

/// @nodoc
abstract mixin class _$PaginationMetaEntityCopyWith<$Res> implements $PaginationMetaEntityCopyWith<$Res> {
  factory _$PaginationMetaEntityCopyWith(_PaginationMetaEntity value, $Res Function(_PaginationMetaEntity) _then) = __$PaginationMetaEntityCopyWithImpl;
@override @useResult
$Res call({
 int page, int take, int total, int pageCount
});




}
/// @nodoc
class __$PaginationMetaEntityCopyWithImpl<$Res>
    implements _$PaginationMetaEntityCopyWith<$Res> {
  __$PaginationMetaEntityCopyWithImpl(this._self, this._then);

  final _PaginationMetaEntity _self;
  final $Res Function(_PaginationMetaEntity) _then;

/// Create a copy of PaginationMetaEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? take = null,Object? total = null,Object? pageCount = null,}) {
  return _then(_PaginationMetaEntity(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,take: null == take ? _self.take : take // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$PaginatedListEntity<T> {

 List<T> get data; PaginationMetaEntity get meta;
/// Create a copy of PaginatedListEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedListEntityCopyWith<T, PaginatedListEntity<T>> get copyWith => _$PaginatedListEntityCopyWithImpl<T, PaginatedListEntity<T>>(this as PaginatedListEntity<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedListEntity<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.meta, meta) || other.meta == meta));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),meta);

@override
String toString() {
  return 'PaginatedListEntity<$T>(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $PaginatedListEntityCopyWith<T,$Res>  {
  factory $PaginatedListEntityCopyWith(PaginatedListEntity<T> value, $Res Function(PaginatedListEntity<T>) _then) = _$PaginatedListEntityCopyWithImpl;
@useResult
$Res call({
 List<T> data, PaginationMetaEntity meta
});


$PaginationMetaEntityCopyWith<$Res> get meta;

}
/// @nodoc
class _$PaginatedListEntityCopyWithImpl<T,$Res>
    implements $PaginatedListEntityCopyWith<T, $Res> {
  _$PaginatedListEntityCopyWithImpl(this._self, this._then);

  final PaginatedListEntity<T> _self;
  final $Res Function(PaginatedListEntity<T>) _then;

/// Create a copy of PaginatedListEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? meta = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<T>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMetaEntity,
  ));
}
/// Create a copy of PaginatedListEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaEntityCopyWith<$Res> get meta {
  
  return $PaginationMetaEntityCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaginatedListEntity].
extension PaginatedListEntityPatterns<T> on PaginatedListEntity<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedListEntity<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedListEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedListEntity<T> value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedListEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedListEntity<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedListEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> data,  PaginationMetaEntity meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedListEntity() when $default != null:
return $default(_that.data,_that.meta);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> data,  PaginationMetaEntity meta)  $default,) {final _that = this;
switch (_that) {
case _PaginatedListEntity():
return $default(_that.data,_that.meta);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> data,  PaginationMetaEntity meta)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedListEntity() when $default != null:
return $default(_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc


class _PaginatedListEntity<T> implements PaginatedListEntity<T> {
  const _PaginatedListEntity({required final  List<T> data, required this.meta}): _data = data;
  

 final  List<T> _data;
@override List<T> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationMetaEntity meta;

/// Create a copy of PaginatedListEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedListEntityCopyWith<T, _PaginatedListEntity<T>> get copyWith => __$PaginatedListEntityCopyWithImpl<T, _PaginatedListEntity<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedListEntity<T>&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.meta, meta) || other.meta == meta));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),meta);

@override
String toString() {
  return 'PaginatedListEntity<$T>(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$PaginatedListEntityCopyWith<T,$Res> implements $PaginatedListEntityCopyWith<T, $Res> {
  factory _$PaginatedListEntityCopyWith(_PaginatedListEntity<T> value, $Res Function(_PaginatedListEntity<T>) _then) = __$PaginatedListEntityCopyWithImpl;
@override @useResult
$Res call({
 List<T> data, PaginationMetaEntity meta
});


@override $PaginationMetaEntityCopyWith<$Res> get meta;

}
/// @nodoc
class __$PaginatedListEntityCopyWithImpl<T,$Res>
    implements _$PaginatedListEntityCopyWith<T, $Res> {
  __$PaginatedListEntityCopyWithImpl(this._self, this._then);

  final _PaginatedListEntity<T> _self;
  final $Res Function(_PaginatedListEntity<T>) _then;

/// Create a copy of PaginatedListEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? meta = null,}) {
  return _then(_PaginatedListEntity<T>(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMetaEntity,
  ));
}

/// Create a copy of PaginatedListEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaEntityCopyWith<$Res> get meta {
  
  return $PaginationMetaEntityCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
