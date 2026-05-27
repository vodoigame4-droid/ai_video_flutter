// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TemplateEntity {

 String get id; String get title; String get imageUrl; String get viewsCount; String get badgeType;
/// Create a copy of TemplateEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemplateEntityCopyWith<TemplateEntity> get copyWith => _$TemplateEntityCopyWithImpl<TemplateEntity>(this as TemplateEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.badgeType, badgeType) || other.badgeType == badgeType));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,viewsCount,badgeType);

@override
String toString() {
  return 'TemplateEntity(id: $id, title: $title, imageUrl: $imageUrl, viewsCount: $viewsCount, badgeType: $badgeType)';
}


}

/// @nodoc
abstract mixin class $TemplateEntityCopyWith<$Res>  {
  factory $TemplateEntityCopyWith(TemplateEntity value, $Res Function(TemplateEntity) _then) = _$TemplateEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String imageUrl, String viewsCount, String badgeType
});




}
/// @nodoc
class _$TemplateEntityCopyWithImpl<$Res>
    implements $TemplateEntityCopyWith<$Res> {
  _$TemplateEntityCopyWithImpl(this._self, this._then);

  final TemplateEntity _self;
  final $Res Function(TemplateEntity) _then;

/// Create a copy of TemplateEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? viewsCount = null,Object? badgeType = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as String,badgeType: null == badgeType ? _self.badgeType : badgeType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TemplateEntity].
extension TemplateEntityPatterns on TemplateEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TemplateEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TemplateEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TemplateEntity value)  $default,){
final _that = this;
switch (_that) {
case _TemplateEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TemplateEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TemplateEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl,  String viewsCount,  String badgeType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TemplateEntity() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.viewsCount,_that.badgeType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl,  String viewsCount,  String badgeType)  $default,) {final _that = this;
switch (_that) {
case _TemplateEntity():
return $default(_that.id,_that.title,_that.imageUrl,_that.viewsCount,_that.badgeType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String imageUrl,  String viewsCount,  String badgeType)?  $default,) {final _that = this;
switch (_that) {
case _TemplateEntity() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.viewsCount,_that.badgeType);case _:
  return null;

}
}

}

/// @nodoc


class _TemplateEntity implements TemplateEntity {
  const _TemplateEntity({required this.id, required this.title, required this.imageUrl, required this.viewsCount, required this.badgeType});
  

@override final  String id;
@override final  String title;
@override final  String imageUrl;
@override final  String viewsCount;
@override final  String badgeType;

/// Create a copy of TemplateEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TemplateEntityCopyWith<_TemplateEntity> get copyWith => __$TemplateEntityCopyWithImpl<_TemplateEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TemplateEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.badgeType, badgeType) || other.badgeType == badgeType));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,viewsCount,badgeType);

@override
String toString() {
  return 'TemplateEntity(id: $id, title: $title, imageUrl: $imageUrl, viewsCount: $viewsCount, badgeType: $badgeType)';
}


}

/// @nodoc
abstract mixin class _$TemplateEntityCopyWith<$Res> implements $TemplateEntityCopyWith<$Res> {
  factory _$TemplateEntityCopyWith(_TemplateEntity value, $Res Function(_TemplateEntity) _then) = __$TemplateEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String imageUrl, String viewsCount, String badgeType
});




}
/// @nodoc
class __$TemplateEntityCopyWithImpl<$Res>
    implements _$TemplateEntityCopyWith<$Res> {
  __$TemplateEntityCopyWithImpl(this._self, this._then);

  final _TemplateEntity _self;
  final $Res Function(_TemplateEntity) _then;

/// Create a copy of TemplateEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? viewsCount = null,Object? badgeType = null,}) {
  return _then(_TemplateEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as String,badgeType: null == badgeType ? _self.badgeType : badgeType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
