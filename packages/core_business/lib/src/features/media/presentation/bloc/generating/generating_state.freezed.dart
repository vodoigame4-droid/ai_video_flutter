// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generating_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeneratingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneratingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GeneratingState()';
}


}

/// @nodoc
class $GeneratingStateCopyWith<$Res>  {
$GeneratingStateCopyWith(GeneratingState _, $Res Function(GeneratingState) __);
}


/// Adds pattern-matching-related methods to [GeneratingState].
extension GeneratingStatePatterns on GeneratingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Generating value)?  generating,TResult Function( _Success value)?  success,TResult Function( _NotifiedAndExited value)?  notifiedAndExited,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Generating() when generating != null:
return generating(_that);case _Success() when success != null:
return success(_that);case _NotifiedAndExited() when notifiedAndExited != null:
return notifiedAndExited(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Generating value)  generating,required TResult Function( _Success value)  success,required TResult Function( _NotifiedAndExited value)  notifiedAndExited,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Generating():
return generating(_that);case _Success():
return success(_that);case _NotifiedAndExited():
return notifiedAndExited(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Generating value)?  generating,TResult? Function( _Success value)?  success,TResult? Function( _NotifiedAndExited value)?  notifiedAndExited,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Generating() when generating != null:
return generating(_that);case _Success() when success != null:
return success(_that);case _NotifiedAndExited() when notifiedAndExited != null:
return notifiedAndExited(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( double progress,  String title,  String? imageUrl)?  generating,TResult Function( String videoId,  String title,  String? imageUrl,  String videoUrl,  String createdAt)?  success,TResult Function( bool isPermissionGranted)?  notifiedAndExited,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Generating() when generating != null:
return generating(_that.progress,_that.title,_that.imageUrl);case _Success() when success != null:
return success(_that.videoId,_that.title,_that.imageUrl,_that.videoUrl,_that.createdAt);case _NotifiedAndExited() when notifiedAndExited != null:
return notifiedAndExited(_that.isPermissionGranted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( double progress,  String title,  String? imageUrl)  generating,required TResult Function( String videoId,  String title,  String? imageUrl,  String videoUrl,  String createdAt)  success,required TResult Function( bool isPermissionGranted)  notifiedAndExited,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Generating():
return generating(_that.progress,_that.title,_that.imageUrl);case _Success():
return success(_that.videoId,_that.title,_that.imageUrl,_that.videoUrl,_that.createdAt);case _NotifiedAndExited():
return notifiedAndExited(_that.isPermissionGranted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( double progress,  String title,  String? imageUrl)?  generating,TResult? Function( String videoId,  String title,  String? imageUrl,  String videoUrl,  String createdAt)?  success,TResult? Function( bool isPermissionGranted)?  notifiedAndExited,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Generating() when generating != null:
return generating(_that.progress,_that.title,_that.imageUrl);case _Success() when success != null:
return success(_that.videoId,_that.title,_that.imageUrl,_that.videoUrl,_that.createdAt);case _NotifiedAndExited() when notifiedAndExited != null:
return notifiedAndExited(_that.isPermissionGranted);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements GeneratingState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GeneratingState.initial()';
}


}




/// @nodoc


class _Generating implements GeneratingState {
  const _Generating({required this.progress, required this.title, required this.imageUrl});
  

 final  double progress;
 final  String title;
 final  String? imageUrl;

/// Create a copy of GeneratingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneratingCopyWith<_Generating> get copyWith => __$GeneratingCopyWithImpl<_Generating>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Generating&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,progress,title,imageUrl);

@override
String toString() {
  return 'GeneratingState.generating(progress: $progress, title: $title, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$GeneratingCopyWith<$Res> implements $GeneratingStateCopyWith<$Res> {
  factory _$GeneratingCopyWith(_Generating value, $Res Function(_Generating) _then) = __$GeneratingCopyWithImpl;
@useResult
$Res call({
 double progress, String title, String? imageUrl
});




}
/// @nodoc
class __$GeneratingCopyWithImpl<$Res>
    implements _$GeneratingCopyWith<$Res> {
  __$GeneratingCopyWithImpl(this._self, this._then);

  final _Generating _self;
  final $Res Function(_Generating) _then;

/// Create a copy of GeneratingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,Object? title = null,Object? imageUrl = freezed,}) {
  return _then(_Generating(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Success implements GeneratingState {
  const _Success({required this.videoId, required this.title, required this.imageUrl, required this.videoUrl, required this.createdAt});
  

 final  String videoId;
 final  String title;
 final  String? imageUrl;
 final  String videoUrl;
 final  String createdAt;

/// Create a copy of GeneratingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,videoId,title,imageUrl,videoUrl,createdAt);

@override
String toString() {
  return 'GeneratingState.success(videoId: $videoId, title: $title, imageUrl: $imageUrl, videoUrl: $videoUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $GeneratingStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 String videoId, String title, String? imageUrl, String videoUrl, String createdAt
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of GeneratingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? videoId = null,Object? title = null,Object? imageUrl = freezed,Object? videoUrl = null,Object? createdAt = null,}) {
  return _then(_Success(
videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NotifiedAndExited implements GeneratingState {
  const _NotifiedAndExited({required this.isPermissionGranted});
  

 final  bool isPermissionGranted;

/// Create a copy of GeneratingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotifiedAndExitedCopyWith<_NotifiedAndExited> get copyWith => __$NotifiedAndExitedCopyWithImpl<_NotifiedAndExited>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotifiedAndExited&&(identical(other.isPermissionGranted, isPermissionGranted) || other.isPermissionGranted == isPermissionGranted));
}


@override
int get hashCode => Object.hash(runtimeType,isPermissionGranted);

@override
String toString() {
  return 'GeneratingState.notifiedAndExited(isPermissionGranted: $isPermissionGranted)';
}


}

/// @nodoc
abstract mixin class _$NotifiedAndExitedCopyWith<$Res> implements $GeneratingStateCopyWith<$Res> {
  factory _$NotifiedAndExitedCopyWith(_NotifiedAndExited value, $Res Function(_NotifiedAndExited) _then) = __$NotifiedAndExitedCopyWithImpl;
@useResult
$Res call({
 bool isPermissionGranted
});




}
/// @nodoc
class __$NotifiedAndExitedCopyWithImpl<$Res>
    implements _$NotifiedAndExitedCopyWith<$Res> {
  __$NotifiedAndExitedCopyWithImpl(this._self, this._then);

  final _NotifiedAndExited _self;
  final $Res Function(_NotifiedAndExited) _then;

/// Create a copy of GeneratingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPermissionGranted = null,}) {
  return _then(_NotifiedAndExited(
isPermissionGranted: null == isPermissionGranted ? _self.isPermissionGranted : isPermissionGranted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
