// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThemeModel {

 String get id; String get name; String get description; String get resultUrl; String get sourceUrl; List<String>? get sourceUrls; String get thumbnailUrl; String get prompt; String get type; int get orgId;
/// Create a copy of ThemeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeModelCopyWith<ThemeModel> get copyWith => _$ThemeModelCopyWithImpl<ThemeModel>(this as ThemeModel, _$identity);

  /// Serializes this ThemeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.resultUrl, resultUrl) || other.resultUrl == resultUrl)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&const DeepCollectionEquality().equals(other.sourceUrls, sourceUrls)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.type, type) || other.type == type)&&(identical(other.orgId, orgId) || other.orgId == orgId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,resultUrl,sourceUrl,const DeepCollectionEquality().hash(sourceUrls),thumbnailUrl,prompt,type,orgId);

@override
String toString() {
  return 'ThemeModel(id: $id, name: $name, description: $description, resultUrl: $resultUrl, sourceUrl: $sourceUrl, sourceUrls: $sourceUrls, thumbnailUrl: $thumbnailUrl, prompt: $prompt, type: $type, orgId: $orgId)';
}


}

/// @nodoc
abstract mixin class $ThemeModelCopyWith<$Res>  {
  factory $ThemeModelCopyWith(ThemeModel value, $Res Function(ThemeModel) _then) = _$ThemeModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String resultUrl, String sourceUrl, List<String>? sourceUrls, String thumbnailUrl, String prompt, String type, int orgId
});




}
/// @nodoc
class _$ThemeModelCopyWithImpl<$Res>
    implements $ThemeModelCopyWith<$Res> {
  _$ThemeModelCopyWithImpl(this._self, this._then);

  final ThemeModel _self;
  final $Res Function(ThemeModel) _then;

/// Create a copy of ThemeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? resultUrl = null,Object? sourceUrl = null,Object? sourceUrls = freezed,Object? thumbnailUrl = null,Object? prompt = null,Object? type = null,Object? orgId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,resultUrl: null == resultUrl ? _self.resultUrl : resultUrl // ignore: cast_nullable_to_non_nullable
as String,sourceUrl: null == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String,sourceUrls: freezed == sourceUrls ? _self.sourceUrls : sourceUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeModel].
extension ThemeModelPatterns on ThemeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeModel value)  $default,){
final _that = this;
switch (_that) {
case _ThemeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeModel value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String resultUrl,  String sourceUrl,  List<String>? sourceUrls,  String thumbnailUrl,  String prompt,  String type,  int orgId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String resultUrl,  String sourceUrl,  List<String>? sourceUrls,  String thumbnailUrl,  String prompt,  String type,  int orgId)  $default,) {final _that = this;
switch (_that) {
case _ThemeModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String resultUrl,  String sourceUrl,  List<String>? sourceUrls,  String thumbnailUrl,  String prompt,  String type,  int orgId)?  $default,) {final _that = this;
switch (_that) {
case _ThemeModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.resultUrl,_that.sourceUrl,_that.sourceUrls,_that.thumbnailUrl,_that.prompt,_that.type,_that.orgId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThemeModel implements ThemeModel {
  const _ThemeModel({required this.id, required this.name, required this.description, required this.resultUrl, required this.sourceUrl, required final  List<String>? sourceUrls, required this.thumbnailUrl, required this.prompt, required this.type, required this.orgId}): _sourceUrls = sourceUrls;
  factory _ThemeModel.fromJson(Map<String, dynamic> json) => _$ThemeModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String resultUrl;
@override final  String sourceUrl;
 final  List<String>? _sourceUrls;
@override List<String>? get sourceUrls {
  final value = _sourceUrls;
  if (value == null) return null;
  if (_sourceUrls is EqualUnmodifiableListView) return _sourceUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String thumbnailUrl;
@override final  String prompt;
@override final  String type;
@override final  int orgId;

/// Create a copy of ThemeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeModelCopyWith<_ThemeModel> get copyWith => __$ThemeModelCopyWithImpl<_ThemeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThemeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.resultUrl, resultUrl) || other.resultUrl == resultUrl)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&const DeepCollectionEquality().equals(other._sourceUrls, _sourceUrls)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.type, type) || other.type == type)&&(identical(other.orgId, orgId) || other.orgId == orgId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,resultUrl,sourceUrl,const DeepCollectionEquality().hash(_sourceUrls),thumbnailUrl,prompt,type,orgId);

@override
String toString() {
  return 'ThemeModel(id: $id, name: $name, description: $description, resultUrl: $resultUrl, sourceUrl: $sourceUrl, sourceUrls: $sourceUrls, thumbnailUrl: $thumbnailUrl, prompt: $prompt, type: $type, orgId: $orgId)';
}


}

/// @nodoc
abstract mixin class _$ThemeModelCopyWith<$Res> implements $ThemeModelCopyWith<$Res> {
  factory _$ThemeModelCopyWith(_ThemeModel value, $Res Function(_ThemeModel) _then) = __$ThemeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String resultUrl, String sourceUrl, List<String>? sourceUrls, String thumbnailUrl, String prompt, String type, int orgId
});




}
/// @nodoc
class __$ThemeModelCopyWithImpl<$Res>
    implements _$ThemeModelCopyWith<$Res> {
  __$ThemeModelCopyWithImpl(this._self, this._then);

  final _ThemeModel _self;
  final $Res Function(_ThemeModel) _then;

/// Create a copy of ThemeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? resultUrl = null,Object? sourceUrl = null,Object? sourceUrls = freezed,Object? thumbnailUrl = null,Object? prompt = null,Object? type = null,Object? orgId = null,}) {
  return _then(_ThemeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,resultUrl: null == resultUrl ? _self.resultUrl : resultUrl // ignore: cast_nullable_to_non_nullable
as String,sourceUrl: null == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String,sourceUrls: freezed == sourceUrls ? _self._sourceUrls : sourceUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$HomeCategoryModel {

 int get id; String get name; List<ThemeModel>? get theme;
/// Create a copy of HomeCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeCategoryModelCopyWith<HomeCategoryModel> get copyWith => _$HomeCategoryModelCopyWithImpl<HomeCategoryModel>(this as HomeCategoryModel, _$identity);

  /// Serializes this HomeCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.theme, theme));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(theme));

@override
String toString() {
  return 'HomeCategoryModel(id: $id, name: $name, theme: $theme)';
}


}

/// @nodoc
abstract mixin class $HomeCategoryModelCopyWith<$Res>  {
  factory $HomeCategoryModelCopyWith(HomeCategoryModel value, $Res Function(HomeCategoryModel) _then) = _$HomeCategoryModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, List<ThemeModel>? theme
});




}
/// @nodoc
class _$HomeCategoryModelCopyWithImpl<$Res>
    implements $HomeCategoryModelCopyWith<$Res> {
  _$HomeCategoryModelCopyWithImpl(this._self, this._then);

  final HomeCategoryModel _self;
  final $Res Function(HomeCategoryModel) _then;

/// Create a copy of HomeCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? theme = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as List<ThemeModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeCategoryModel].
extension HomeCategoryModelPatterns on HomeCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _HomeCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _HomeCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  List<ThemeModel>? theme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeCategoryModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  List<ThemeModel>? theme)  $default,) {final _that = this;
switch (_that) {
case _HomeCategoryModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  List<ThemeModel>? theme)?  $default,) {final _that = this;
switch (_that) {
case _HomeCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.theme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeCategoryModel implements HomeCategoryModel {
  const _HomeCategoryModel({required this.id, required this.name, required final  List<ThemeModel>? theme}): _theme = theme;
  factory _HomeCategoryModel.fromJson(Map<String, dynamic> json) => _$HomeCategoryModelFromJson(json);

@override final  int id;
@override final  String name;
 final  List<ThemeModel>? _theme;
@override List<ThemeModel>? get theme {
  final value = _theme;
  if (value == null) return null;
  if (_theme is EqualUnmodifiableListView) return _theme;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HomeCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeCategoryModelCopyWith<_HomeCategoryModel> get copyWith => __$HomeCategoryModelCopyWithImpl<_HomeCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._theme, _theme));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_theme));

@override
String toString() {
  return 'HomeCategoryModel(id: $id, name: $name, theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$HomeCategoryModelCopyWith<$Res> implements $HomeCategoryModelCopyWith<$Res> {
  factory _$HomeCategoryModelCopyWith(_HomeCategoryModel value, $Res Function(_HomeCategoryModel) _then) = __$HomeCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, List<ThemeModel>? theme
});




}
/// @nodoc
class __$HomeCategoryModelCopyWithImpl<$Res>
    implements _$HomeCategoryModelCopyWith<$Res> {
  __$HomeCategoryModelCopyWithImpl(this._self, this._then);

  final _HomeCategoryModel _self;
  final $Res Function(_HomeCategoryModel) _then;

/// Create a copy of HomeCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? theme = freezed,}) {
  return _then(_HomeCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,theme: freezed == theme ? _self._theme : theme // ignore: cast_nullable_to_non_nullable
as List<ThemeModel>?,
  ));
}


}


/// @nodoc
mixin _$CreateTgvRequestModel {

 String get imageUrl; String get name; String get prompt; String get themeId; bool get isHd; bool get isLongTime; String get themeType; int get themeOrgId;
/// Create a copy of CreateTgvRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTgvRequestModelCopyWith<CreateTgvRequestModel> get copyWith => _$CreateTgvRequestModelCopyWithImpl<CreateTgvRequestModel>(this as CreateTgvRequestModel, _$identity);

  /// Serializes this CreateTgvRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTgvRequestModel&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.name, name) || other.name == name)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.isHd, isHd) || other.isHd == isHd)&&(identical(other.isLongTime, isLongTime) || other.isLongTime == isLongTime)&&(identical(other.themeType, themeType) || other.themeType == themeType)&&(identical(other.themeOrgId, themeOrgId) || other.themeOrgId == themeOrgId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,name,prompt,themeId,isHd,isLongTime,themeType,themeOrgId);

@override
String toString() {
  return 'CreateTgvRequestModel(imageUrl: $imageUrl, name: $name, prompt: $prompt, themeId: $themeId, isHd: $isHd, isLongTime: $isLongTime, themeType: $themeType, themeOrgId: $themeOrgId)';
}


}

/// @nodoc
abstract mixin class $CreateTgvRequestModelCopyWith<$Res>  {
  factory $CreateTgvRequestModelCopyWith(CreateTgvRequestModel value, $Res Function(CreateTgvRequestModel) _then) = _$CreateTgvRequestModelCopyWithImpl;
@useResult
$Res call({
 String imageUrl, String name, String prompt, String themeId, bool isHd, bool isLongTime, String themeType, int themeOrgId
});




}
/// @nodoc
class _$CreateTgvRequestModelCopyWithImpl<$Res>
    implements $CreateTgvRequestModelCopyWith<$Res> {
  _$CreateTgvRequestModelCopyWithImpl(this._self, this._then);

  final CreateTgvRequestModel _self;
  final $Res Function(CreateTgvRequestModel) _then;

/// Create a copy of CreateTgvRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imageUrl = null,Object? name = null,Object? prompt = null,Object? themeId = null,Object? isHd = null,Object? isLongTime = null,Object? themeType = null,Object? themeOrgId = null,}) {
  return _then(_self.copyWith(
imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,isHd: null == isHd ? _self.isHd : isHd // ignore: cast_nullable_to_non_nullable
as bool,isLongTime: null == isLongTime ? _self.isLongTime : isLongTime // ignore: cast_nullable_to_non_nullable
as bool,themeType: null == themeType ? _self.themeType : themeType // ignore: cast_nullable_to_non_nullable
as String,themeOrgId: null == themeOrgId ? _self.themeOrgId : themeOrgId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTgvRequestModel].
extension CreateTgvRequestModelPatterns on CreateTgvRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTgvRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTgvRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTgvRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateTgvRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTgvRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTgvRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String imageUrl,  String name,  String prompt,  String themeId,  bool isHd,  bool isLongTime,  String themeType,  int themeOrgId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTgvRequestModel() when $default != null:
return $default(_that.imageUrl,_that.name,_that.prompt,_that.themeId,_that.isHd,_that.isLongTime,_that.themeType,_that.themeOrgId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String imageUrl,  String name,  String prompt,  String themeId,  bool isHd,  bool isLongTime,  String themeType,  int themeOrgId)  $default,) {final _that = this;
switch (_that) {
case _CreateTgvRequestModel():
return $default(_that.imageUrl,_that.name,_that.prompt,_that.themeId,_that.isHd,_that.isLongTime,_that.themeType,_that.themeOrgId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String imageUrl,  String name,  String prompt,  String themeId,  bool isHd,  bool isLongTime,  String themeType,  int themeOrgId)?  $default,) {final _that = this;
switch (_that) {
case _CreateTgvRequestModel() when $default != null:
return $default(_that.imageUrl,_that.name,_that.prompt,_that.themeId,_that.isHd,_that.isLongTime,_that.themeType,_that.themeOrgId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTgvRequestModel implements CreateTgvRequestModel {
  const _CreateTgvRequestModel({required this.imageUrl, required this.name, required this.prompt, required this.themeId, required this.isHd, required this.isLongTime, required this.themeType, required this.themeOrgId});
  factory _CreateTgvRequestModel.fromJson(Map<String, dynamic> json) => _$CreateTgvRequestModelFromJson(json);

@override final  String imageUrl;
@override final  String name;
@override final  String prompt;
@override final  String themeId;
@override final  bool isHd;
@override final  bool isLongTime;
@override final  String themeType;
@override final  int themeOrgId;

/// Create a copy of CreateTgvRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTgvRequestModelCopyWith<_CreateTgvRequestModel> get copyWith => __$CreateTgvRequestModelCopyWithImpl<_CreateTgvRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTgvRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTgvRequestModel&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.name, name) || other.name == name)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.isHd, isHd) || other.isHd == isHd)&&(identical(other.isLongTime, isLongTime) || other.isLongTime == isLongTime)&&(identical(other.themeType, themeType) || other.themeType == themeType)&&(identical(other.themeOrgId, themeOrgId) || other.themeOrgId == themeOrgId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,name,prompt,themeId,isHd,isLongTime,themeType,themeOrgId);

@override
String toString() {
  return 'CreateTgvRequestModel(imageUrl: $imageUrl, name: $name, prompt: $prompt, themeId: $themeId, isHd: $isHd, isLongTime: $isLongTime, themeType: $themeType, themeOrgId: $themeOrgId)';
}


}

/// @nodoc
abstract mixin class _$CreateTgvRequestModelCopyWith<$Res> implements $CreateTgvRequestModelCopyWith<$Res> {
  factory _$CreateTgvRequestModelCopyWith(_CreateTgvRequestModel value, $Res Function(_CreateTgvRequestModel) _then) = __$CreateTgvRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String imageUrl, String name, String prompt, String themeId, bool isHd, bool isLongTime, String themeType, int themeOrgId
});




}
/// @nodoc
class __$CreateTgvRequestModelCopyWithImpl<$Res>
    implements _$CreateTgvRequestModelCopyWith<$Res> {
  __$CreateTgvRequestModelCopyWithImpl(this._self, this._then);

  final _CreateTgvRequestModel _self;
  final $Res Function(_CreateTgvRequestModel) _then;

/// Create a copy of CreateTgvRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageUrl = null,Object? name = null,Object? prompt = null,Object? themeId = null,Object? isHd = null,Object? isLongTime = null,Object? themeType = null,Object? themeOrgId = null,}) {
  return _then(_CreateTgvRequestModel(
imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,isHd: null == isHd ? _self.isHd : isHd // ignore: cast_nullable_to_non_nullable
as bool,isLongTime: null == isLongTime ? _self.isLongTime : isLongTime // ignore: cast_nullable_to_non_nullable
as bool,themeType: null == themeType ? _self.themeType : themeType // ignore: cast_nullable_to_non_nullable
as String,themeOrgId: null == themeOrgId ? _self.themeOrgId : themeOrgId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MediaModel {

 String get id; String get name; String get imageUrl; List<String>? get imageUrls; int get imageQuantity; String get requestId; String? get resultUrl; String? get finishedTime; String get prompt; bool get isHd; bool get isLongTime; String get themeId; String? get thumbnailUrl; String get status; String get createdAt;
/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaModelCopyWith<MediaModel> get copyWith => _$MediaModelCopyWithImpl<MediaModel>(this as MediaModel, _$identity);

  /// Serializes this MediaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&(identical(other.imageQuantity, imageQuantity) || other.imageQuantity == imageQuantity)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.resultUrl, resultUrl) || other.resultUrl == resultUrl)&&(identical(other.finishedTime, finishedTime) || other.finishedTime == finishedTime)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.isHd, isHd) || other.isHd == isHd)&&(identical(other.isLongTime, isLongTime) || other.isLongTime == isLongTime)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,const DeepCollectionEquality().hash(imageUrls),imageQuantity,requestId,resultUrl,finishedTime,prompt,isHd,isLongTime,themeId,thumbnailUrl,status,createdAt);

@override
String toString() {
  return 'MediaModel(id: $id, name: $name, imageUrl: $imageUrl, imageUrls: $imageUrls, imageQuantity: $imageQuantity, requestId: $requestId, resultUrl: $resultUrl, finishedTime: $finishedTime, prompt: $prompt, isHd: $isHd, isLongTime: $isLongTime, themeId: $themeId, thumbnailUrl: $thumbnailUrl, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MediaModelCopyWith<$Res>  {
  factory $MediaModelCopyWith(MediaModel value, $Res Function(MediaModel) _then) = _$MediaModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String imageUrl, List<String>? imageUrls, int imageQuantity, String requestId, String? resultUrl, String? finishedTime, String prompt, bool isHd, bool isLongTime, String themeId, String? thumbnailUrl, String status, String createdAt
});




}
/// @nodoc
class _$MediaModelCopyWithImpl<$Res>
    implements $MediaModelCopyWith<$Res> {
  _$MediaModelCopyWithImpl(this._self, this._then);

  final MediaModel _self;
  final $Res Function(MediaModel) _then;

/// Create a copy of MediaModel
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
as String?,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,isHd: null == isHd ? _self.isHd : isHd // ignore: cast_nullable_to_non_nullable
as bool,isLongTime: null == isLongTime ? _self.isLongTime : isLongTime // ignore: cast_nullable_to_non_nullable
as bool,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaModel].
extension MediaModelPatterns on MediaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaModel value)  $default,){
final _that = this;
switch (_that) {
case _MediaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaModel value)?  $default,){
final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String imageUrl,  List<String>? imageUrls,  int imageQuantity,  String requestId,  String? resultUrl,  String? finishedTime,  String prompt,  bool isHd,  bool isLongTime,  String themeId,  String? thumbnailUrl,  String status,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String imageUrl,  List<String>? imageUrls,  int imageQuantity,  String requestId,  String? resultUrl,  String? finishedTime,  String prompt,  bool isHd,  bool isLongTime,  String themeId,  String? thumbnailUrl,  String status,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _MediaModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String imageUrl,  List<String>? imageUrls,  int imageQuantity,  String requestId,  String? resultUrl,  String? finishedTime,  String prompt,  bool isHd,  bool isLongTime,  String themeId,  String? thumbnailUrl,  String status,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.imageUrls,_that.imageQuantity,_that.requestId,_that.resultUrl,_that.finishedTime,_that.prompt,_that.isHd,_that.isLongTime,_that.themeId,_that.thumbnailUrl,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaModel implements MediaModel {
  const _MediaModel({required this.id, required this.name, required this.imageUrl, required final  List<String>? imageUrls, required this.imageQuantity, required this.requestId, required this.resultUrl, required this.finishedTime, required this.prompt, required this.isHd, required this.isLongTime, required this.themeId, required this.thumbnailUrl, required this.status, required this.createdAt}): _imageUrls = imageUrls;
  factory _MediaModel.fromJson(Map<String, dynamic> json) => _$MediaModelFromJson(json);

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
@override final  String? finishedTime;
@override final  String prompt;
@override final  bool isHd;
@override final  bool isLongTime;
@override final  String themeId;
@override final  String? thumbnailUrl;
@override final  String status;
@override final  String createdAt;

/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaModelCopyWith<_MediaModel> get copyWith => __$MediaModelCopyWithImpl<_MediaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&(identical(other.imageQuantity, imageQuantity) || other.imageQuantity == imageQuantity)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.resultUrl, resultUrl) || other.resultUrl == resultUrl)&&(identical(other.finishedTime, finishedTime) || other.finishedTime == finishedTime)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.isHd, isHd) || other.isHd == isHd)&&(identical(other.isLongTime, isLongTime) || other.isLongTime == isLongTime)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,const DeepCollectionEquality().hash(_imageUrls),imageQuantity,requestId,resultUrl,finishedTime,prompt,isHd,isLongTime,themeId,thumbnailUrl,status,createdAt);

@override
String toString() {
  return 'MediaModel(id: $id, name: $name, imageUrl: $imageUrl, imageUrls: $imageUrls, imageQuantity: $imageQuantity, requestId: $requestId, resultUrl: $resultUrl, finishedTime: $finishedTime, prompt: $prompt, isHd: $isHd, isLongTime: $isLongTime, themeId: $themeId, thumbnailUrl: $thumbnailUrl, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MediaModelCopyWith<$Res> implements $MediaModelCopyWith<$Res> {
  factory _$MediaModelCopyWith(_MediaModel value, $Res Function(_MediaModel) _then) = __$MediaModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String imageUrl, List<String>? imageUrls, int imageQuantity, String requestId, String? resultUrl, String? finishedTime, String prompt, bool isHd, bool isLongTime, String themeId, String? thumbnailUrl, String status, String createdAt
});




}
/// @nodoc
class __$MediaModelCopyWithImpl<$Res>
    implements _$MediaModelCopyWith<$Res> {
  __$MediaModelCopyWithImpl(this._self, this._then);

  final _MediaModel _self;
  final $Res Function(_MediaModel) _then;

/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? imageUrls = freezed,Object? imageQuantity = null,Object? requestId = null,Object? resultUrl = freezed,Object? finishedTime = freezed,Object? prompt = null,Object? isHd = null,Object? isLongTime = null,Object? themeId = null,Object? thumbnailUrl = freezed,Object? status = null,Object? createdAt = null,}) {
  return _then(_MediaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrls: freezed == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,imageQuantity: null == imageQuantity ? _self.imageQuantity : imageQuantity // ignore: cast_nullable_to_non_nullable
as int,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,resultUrl: freezed == resultUrl ? _self.resultUrl : resultUrl // ignore: cast_nullable_to_non_nullable
as String?,finishedTime: freezed == finishedTime ? _self.finishedTime : finishedTime // ignore: cast_nullable_to_non_nullable
as String?,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,isHd: null == isHd ? _self.isHd : isHd // ignore: cast_nullable_to_non_nullable
as bool,isLongTime: null == isLongTime ? _self.isLongTime : isLongTime // ignore: cast_nullable_to_non_nullable
as bool,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MediaStatusModel {

 String get id; String get status; String? get resultUrl; String? get finishedTime;
/// Create a copy of MediaStatusModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaStatusModelCopyWith<MediaStatusModel> get copyWith => _$MediaStatusModelCopyWithImpl<MediaStatusModel>(this as MediaStatusModel, _$identity);

  /// Serializes this MediaStatusModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaStatusModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.resultUrl, resultUrl) || other.resultUrl == resultUrl)&&(identical(other.finishedTime, finishedTime) || other.finishedTime == finishedTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,resultUrl,finishedTime);

@override
String toString() {
  return 'MediaStatusModel(id: $id, status: $status, resultUrl: $resultUrl, finishedTime: $finishedTime)';
}


}

/// @nodoc
abstract mixin class $MediaStatusModelCopyWith<$Res>  {
  factory $MediaStatusModelCopyWith(MediaStatusModel value, $Res Function(MediaStatusModel) _then) = _$MediaStatusModelCopyWithImpl;
@useResult
$Res call({
 String id, String status, String? resultUrl, String? finishedTime
});




}
/// @nodoc
class _$MediaStatusModelCopyWithImpl<$Res>
    implements $MediaStatusModelCopyWith<$Res> {
  _$MediaStatusModelCopyWithImpl(this._self, this._then);

  final MediaStatusModel _self;
  final $Res Function(MediaStatusModel) _then;

/// Create a copy of MediaStatusModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? resultUrl = freezed,Object? finishedTime = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,resultUrl: freezed == resultUrl ? _self.resultUrl : resultUrl // ignore: cast_nullable_to_non_nullable
as String?,finishedTime: freezed == finishedTime ? _self.finishedTime : finishedTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaStatusModel].
extension MediaStatusModelPatterns on MediaStatusModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaStatusModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaStatusModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaStatusModel value)  $default,){
final _that = this;
switch (_that) {
case _MediaStatusModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaStatusModel value)?  $default,){
final _that = this;
switch (_that) {
case _MediaStatusModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status,  String? resultUrl,  String? finishedTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaStatusModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status,  String? resultUrl,  String? finishedTime)  $default,) {final _that = this;
switch (_that) {
case _MediaStatusModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status,  String? resultUrl,  String? finishedTime)?  $default,) {final _that = this;
switch (_that) {
case _MediaStatusModel() when $default != null:
return $default(_that.id,_that.status,_that.resultUrl,_that.finishedTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaStatusModel implements MediaStatusModel {
  const _MediaStatusModel({required this.id, required this.status, required this.resultUrl, required this.finishedTime});
  factory _MediaStatusModel.fromJson(Map<String, dynamic> json) => _$MediaStatusModelFromJson(json);

@override final  String id;
@override final  String status;
@override final  String? resultUrl;
@override final  String? finishedTime;

/// Create a copy of MediaStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaStatusModelCopyWith<_MediaStatusModel> get copyWith => __$MediaStatusModelCopyWithImpl<_MediaStatusModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaStatusModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaStatusModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.resultUrl, resultUrl) || other.resultUrl == resultUrl)&&(identical(other.finishedTime, finishedTime) || other.finishedTime == finishedTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,resultUrl,finishedTime);

@override
String toString() {
  return 'MediaStatusModel(id: $id, status: $status, resultUrl: $resultUrl, finishedTime: $finishedTime)';
}


}

/// @nodoc
abstract mixin class _$MediaStatusModelCopyWith<$Res> implements $MediaStatusModelCopyWith<$Res> {
  factory _$MediaStatusModelCopyWith(_MediaStatusModel value, $Res Function(_MediaStatusModel) _then) = __$MediaStatusModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String status, String? resultUrl, String? finishedTime
});




}
/// @nodoc
class __$MediaStatusModelCopyWithImpl<$Res>
    implements _$MediaStatusModelCopyWith<$Res> {
  __$MediaStatusModelCopyWithImpl(this._self, this._then);

  final _MediaStatusModel _self;
  final $Res Function(_MediaStatusModel) _then;

/// Create a copy of MediaStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? resultUrl = freezed,Object? finishedTime = freezed,}) {
  return _then(_MediaStatusModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,resultUrl: freezed == resultUrl ? _self.resultUrl : resultUrl // ignore: cast_nullable_to_non_nullable
as String?,finishedTime: freezed == finishedTime ? _self.finishedTime : finishedTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaginationMetaModel {

 int get page; int get take; int get total; int get pageCount;
/// Create a copy of PaginationMetaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationMetaModelCopyWith<PaginationMetaModel> get copyWith => _$PaginationMetaModelCopyWithImpl<PaginationMetaModel>(this as PaginationMetaModel, _$identity);

  /// Serializes this PaginationMetaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationMetaModel&&(identical(other.page, page) || other.page == page)&&(identical(other.take, take) || other.take == take)&&(identical(other.total, total) || other.total == total)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,take,total,pageCount);

@override
String toString() {
  return 'PaginationMetaModel(page: $page, take: $take, total: $total, pageCount: $pageCount)';
}


}

/// @nodoc
abstract mixin class $PaginationMetaModelCopyWith<$Res>  {
  factory $PaginationMetaModelCopyWith(PaginationMetaModel value, $Res Function(PaginationMetaModel) _then) = _$PaginationMetaModelCopyWithImpl;
@useResult
$Res call({
 int page, int take, int total, int pageCount
});




}
/// @nodoc
class _$PaginationMetaModelCopyWithImpl<$Res>
    implements $PaginationMetaModelCopyWith<$Res> {
  _$PaginationMetaModelCopyWithImpl(this._self, this._then);

  final PaginationMetaModel _self;
  final $Res Function(PaginationMetaModel) _then;

/// Create a copy of PaginationMetaModel
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


/// Adds pattern-matching-related methods to [PaginationMetaModel].
extension PaginationMetaModelPatterns on PaginationMetaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationMetaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationMetaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationMetaModel value)  $default,){
final _that = this;
switch (_that) {
case _PaginationMetaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationMetaModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationMetaModel() when $default != null:
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
case _PaginationMetaModel() when $default != null:
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
case _PaginationMetaModel():
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
case _PaginationMetaModel() when $default != null:
return $default(_that.page,_that.take,_that.total,_that.pageCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationMetaModel implements PaginationMetaModel {
  const _PaginationMetaModel({required this.page, required this.take, required this.total, required this.pageCount});
  factory _PaginationMetaModel.fromJson(Map<String, dynamic> json) => _$PaginationMetaModelFromJson(json);

@override final  int page;
@override final  int take;
@override final  int total;
@override final  int pageCount;

/// Create a copy of PaginationMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationMetaModelCopyWith<_PaginationMetaModel> get copyWith => __$PaginationMetaModelCopyWithImpl<_PaginationMetaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationMetaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationMetaModel&&(identical(other.page, page) || other.page == page)&&(identical(other.take, take) || other.take == take)&&(identical(other.total, total) || other.total == total)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,take,total,pageCount);

@override
String toString() {
  return 'PaginationMetaModel(page: $page, take: $take, total: $total, pageCount: $pageCount)';
}


}

/// @nodoc
abstract mixin class _$PaginationMetaModelCopyWith<$Res> implements $PaginationMetaModelCopyWith<$Res> {
  factory _$PaginationMetaModelCopyWith(_PaginationMetaModel value, $Res Function(_PaginationMetaModel) _then) = __$PaginationMetaModelCopyWithImpl;
@override @useResult
$Res call({
 int page, int take, int total, int pageCount
});




}
/// @nodoc
class __$PaginationMetaModelCopyWithImpl<$Res>
    implements _$PaginationMetaModelCopyWith<$Res> {
  __$PaginationMetaModelCopyWithImpl(this._self, this._then);

  final _PaginationMetaModel _self;
  final $Res Function(_PaginationMetaModel) _then;

/// Create a copy of PaginationMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? take = null,Object? total = null,Object? pageCount = null,}) {
  return _then(_PaginationMetaModel(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,take: null == take ? _self.take : take // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$UploadResponseModel {

 String get url;
/// Create a copy of UploadResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadResponseModelCopyWith<UploadResponseModel> get copyWith => _$UploadResponseModelCopyWithImpl<UploadResponseModel>(this as UploadResponseModel, _$identity);

  /// Serializes this UploadResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadResponseModel&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'UploadResponseModel(url: $url)';
}


}

/// @nodoc
abstract mixin class $UploadResponseModelCopyWith<$Res>  {
  factory $UploadResponseModelCopyWith(UploadResponseModel value, $Res Function(UploadResponseModel) _then) = _$UploadResponseModelCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$UploadResponseModelCopyWithImpl<$Res>
    implements $UploadResponseModelCopyWith<$Res> {
  _$UploadResponseModelCopyWithImpl(this._self, this._then);

  final UploadResponseModel _self;
  final $Res Function(UploadResponseModel) _then;

/// Create a copy of UploadResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadResponseModel].
extension UploadResponseModelPatterns on UploadResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _UploadResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _UploadResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadResponseModel() when $default != null:
return $default(_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url)  $default,) {final _that = this;
switch (_that) {
case _UploadResponseModel():
return $default(_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url)?  $default,) {final _that = this;
switch (_that) {
case _UploadResponseModel() when $default != null:
return $default(_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UploadResponseModel implements UploadResponseModel {
  const _UploadResponseModel({required this.url});
  factory _UploadResponseModel.fromJson(Map<String, dynamic> json) => _$UploadResponseModelFromJson(json);

@override final  String url;

/// Create a copy of UploadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadResponseModelCopyWith<_UploadResponseModel> get copyWith => __$UploadResponseModelCopyWithImpl<_UploadResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadResponseModel&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'UploadResponseModel(url: $url)';
}


}

/// @nodoc
abstract mixin class _$UploadResponseModelCopyWith<$Res> implements $UploadResponseModelCopyWith<$Res> {
  factory _$UploadResponseModelCopyWith(_UploadResponseModel value, $Res Function(_UploadResponseModel) _then) = __$UploadResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String url
});




}
/// @nodoc
class __$UploadResponseModelCopyWithImpl<$Res>
    implements _$UploadResponseModelCopyWith<$Res> {
  __$UploadResponseModelCopyWithImpl(this._self, this._then);

  final _UploadResponseModel _self;
  final $Res Function(_UploadResponseModel) _then;

/// Create a copy of UploadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_UploadResponseModel(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
