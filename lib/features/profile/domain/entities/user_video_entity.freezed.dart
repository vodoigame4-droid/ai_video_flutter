// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_video_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserVideoEntity {

 String get id; String get title; String get imageUrl; String get status;// 'generating' or 'done'
 double get progress;// 0.0 to 1.0
 String get createdAt; bool get isLiked;
/// Create a copy of UserVideoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserVideoEntityCopyWith<UserVideoEntity> get copyWith => _$UserVideoEntityCopyWithImpl<UserVideoEntity>(this as UserVideoEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserVideoEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,status,progress,createdAt,isLiked);

@override
String toString() {
  return 'UserVideoEntity(id: $id, title: $title, imageUrl: $imageUrl, status: $status, progress: $progress, createdAt: $createdAt, isLiked: $isLiked)';
}


}

/// @nodoc
abstract mixin class $UserVideoEntityCopyWith<$Res>  {
  factory $UserVideoEntityCopyWith(UserVideoEntity value, $Res Function(UserVideoEntity) _then) = _$UserVideoEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String imageUrl, String status, double progress, String createdAt, bool isLiked
});




}
/// @nodoc
class _$UserVideoEntityCopyWithImpl<$Res>
    implements $UserVideoEntityCopyWith<$Res> {
  _$UserVideoEntityCopyWithImpl(this._self, this._then);

  final UserVideoEntity _self;
  final $Res Function(UserVideoEntity) _then;

/// Create a copy of UserVideoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? status = null,Object? progress = null,Object? createdAt = null,Object? isLiked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserVideoEntity].
extension UserVideoEntityPatterns on UserVideoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserVideoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserVideoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserVideoEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserVideoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserVideoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserVideoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl,  String status,  double progress,  String createdAt,  bool isLiked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserVideoEntity() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.status,_that.progress,_that.createdAt,_that.isLiked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl,  String status,  double progress,  String createdAt,  bool isLiked)  $default,) {final _that = this;
switch (_that) {
case _UserVideoEntity():
return $default(_that.id,_that.title,_that.imageUrl,_that.status,_that.progress,_that.createdAt,_that.isLiked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String imageUrl,  String status,  double progress,  String createdAt,  bool isLiked)?  $default,) {final _that = this;
switch (_that) {
case _UserVideoEntity() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.status,_that.progress,_that.createdAt,_that.isLiked);case _:
  return null;

}
}

}

/// @nodoc


class _UserVideoEntity implements UserVideoEntity {
  const _UserVideoEntity({required this.id, required this.title, required this.imageUrl, required this.status, required this.progress, required this.createdAt, required this.isLiked});
  

@override final  String id;
@override final  String title;
@override final  String imageUrl;
@override final  String status;
// 'generating' or 'done'
@override final  double progress;
// 0.0 to 1.0
@override final  String createdAt;
@override final  bool isLiked;

/// Create a copy of UserVideoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserVideoEntityCopyWith<_UserVideoEntity> get copyWith => __$UserVideoEntityCopyWithImpl<_UserVideoEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserVideoEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,status,progress,createdAt,isLiked);

@override
String toString() {
  return 'UserVideoEntity(id: $id, title: $title, imageUrl: $imageUrl, status: $status, progress: $progress, createdAt: $createdAt, isLiked: $isLiked)';
}


}

/// @nodoc
abstract mixin class _$UserVideoEntityCopyWith<$Res> implements $UserVideoEntityCopyWith<$Res> {
  factory _$UserVideoEntityCopyWith(_UserVideoEntity value, $Res Function(_UserVideoEntity) _then) = __$UserVideoEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String imageUrl, String status, double progress, String createdAt, bool isLiked
});




}
/// @nodoc
class __$UserVideoEntityCopyWithImpl<$Res>
    implements _$UserVideoEntityCopyWith<$Res> {
  __$UserVideoEntityCopyWithImpl(this._self, this._then);

  final _UserVideoEntity _self;
  final $Res Function(_UserVideoEntity) _then;

/// Create a copy of UserVideoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? status = null,Object? progress = null,Object? createdAt = null,Object? isLiked = null,}) {
  return _then(_UserVideoEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
