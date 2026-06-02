// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_trim_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VideoTrimEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoTrimEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoTrimEvent()';
}


}

/// @nodoc
class $VideoTrimEventCopyWith<$Res>  {
$VideoTrimEventCopyWith(VideoTrimEvent _, $Res Function(VideoTrimEvent) __);
}


/// Adds pattern-matching-related methods to [VideoTrimEvent].
extension VideoTrimEventPatterns on VideoTrimEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadVideo value)?  loadVideo,TResult Function( _SaveVideo value)?  saveVideo,TResult Function( _UpdatePlayback value)?  updatePlayback,TResult Function( _UpdateRange value)?  updateRange,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadVideo() when loadVideo != null:
return loadVideo(_that);case _SaveVideo() when saveVideo != null:
return saveVideo(_that);case _UpdatePlayback() when updatePlayback != null:
return updatePlayback(_that);case _UpdateRange() when updateRange != null:
return updateRange(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadVideo value)  loadVideo,required TResult Function( _SaveVideo value)  saveVideo,required TResult Function( _UpdatePlayback value)  updatePlayback,required TResult Function( _UpdateRange value)  updateRange,}){
final _that = this;
switch (_that) {
case _LoadVideo():
return loadVideo(_that);case _SaveVideo():
return saveVideo(_that);case _UpdatePlayback():
return updatePlayback(_that);case _UpdateRange():
return updateRange(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadVideo value)?  loadVideo,TResult? Function( _SaveVideo value)?  saveVideo,TResult? Function( _UpdatePlayback value)?  updatePlayback,TResult? Function( _UpdateRange value)?  updateRange,}){
final _that = this;
switch (_that) {
case _LoadVideo() when loadVideo != null:
return loadVideo(_that);case _SaveVideo() when saveVideo != null:
return saveVideo(_that);case _UpdatePlayback() when updatePlayback != null:
return updatePlayback(_that);case _UpdateRange() when updateRange != null:
return updateRange(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String videoPath,  Trimmer trimmer)?  loadVideo,TResult Function( Trimmer trimmer,  double startValue,  double endValue)?  saveVideo,TResult Function( bool isPlaying)?  updatePlayback,TResult Function( double startValue,  double endValue)?  updateRange,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadVideo() when loadVideo != null:
return loadVideo(_that.videoPath,_that.trimmer);case _SaveVideo() when saveVideo != null:
return saveVideo(_that.trimmer,_that.startValue,_that.endValue);case _UpdatePlayback() when updatePlayback != null:
return updatePlayback(_that.isPlaying);case _UpdateRange() when updateRange != null:
return updateRange(_that.startValue,_that.endValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String videoPath,  Trimmer trimmer)  loadVideo,required TResult Function( Trimmer trimmer,  double startValue,  double endValue)  saveVideo,required TResult Function( bool isPlaying)  updatePlayback,required TResult Function( double startValue,  double endValue)  updateRange,}) {final _that = this;
switch (_that) {
case _LoadVideo():
return loadVideo(_that.videoPath,_that.trimmer);case _SaveVideo():
return saveVideo(_that.trimmer,_that.startValue,_that.endValue);case _UpdatePlayback():
return updatePlayback(_that.isPlaying);case _UpdateRange():
return updateRange(_that.startValue,_that.endValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String videoPath,  Trimmer trimmer)?  loadVideo,TResult? Function( Trimmer trimmer,  double startValue,  double endValue)?  saveVideo,TResult? Function( bool isPlaying)?  updatePlayback,TResult? Function( double startValue,  double endValue)?  updateRange,}) {final _that = this;
switch (_that) {
case _LoadVideo() when loadVideo != null:
return loadVideo(_that.videoPath,_that.trimmer);case _SaveVideo() when saveVideo != null:
return saveVideo(_that.trimmer,_that.startValue,_that.endValue);case _UpdatePlayback() when updatePlayback != null:
return updatePlayback(_that.isPlaying);case _UpdateRange() when updateRange != null:
return updateRange(_that.startValue,_that.endValue);case _:
  return null;

}
}

}

/// @nodoc


class _LoadVideo implements VideoTrimEvent {
  const _LoadVideo({required this.videoPath, required this.trimmer});
  

 final  String videoPath;
 final  Trimmer trimmer;

/// Create a copy of VideoTrimEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadVideoCopyWith<_LoadVideo> get copyWith => __$LoadVideoCopyWithImpl<_LoadVideo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadVideo&&(identical(other.videoPath, videoPath) || other.videoPath == videoPath)&&(identical(other.trimmer, trimmer) || other.trimmer == trimmer));
}


@override
int get hashCode => Object.hash(runtimeType,videoPath,trimmer);

@override
String toString() {
  return 'VideoTrimEvent.loadVideo(videoPath: $videoPath, trimmer: $trimmer)';
}


}

/// @nodoc
abstract mixin class _$LoadVideoCopyWith<$Res> implements $VideoTrimEventCopyWith<$Res> {
  factory _$LoadVideoCopyWith(_LoadVideo value, $Res Function(_LoadVideo) _then) = __$LoadVideoCopyWithImpl;
@useResult
$Res call({
 String videoPath, Trimmer trimmer
});




}
/// @nodoc
class __$LoadVideoCopyWithImpl<$Res>
    implements _$LoadVideoCopyWith<$Res> {
  __$LoadVideoCopyWithImpl(this._self, this._then);

  final _LoadVideo _self;
  final $Res Function(_LoadVideo) _then;

/// Create a copy of VideoTrimEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? videoPath = null,Object? trimmer = null,}) {
  return _then(_LoadVideo(
videoPath: null == videoPath ? _self.videoPath : videoPath // ignore: cast_nullable_to_non_nullable
as String,trimmer: null == trimmer ? _self.trimmer : trimmer // ignore: cast_nullable_to_non_nullable
as Trimmer,
  ));
}


}

/// @nodoc


class _SaveVideo implements VideoTrimEvent {
  const _SaveVideo({required this.trimmer, required this.startValue, required this.endValue});
  

 final  Trimmer trimmer;
 final  double startValue;
 final  double endValue;

/// Create a copy of VideoTrimEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveVideoCopyWith<_SaveVideo> get copyWith => __$SaveVideoCopyWithImpl<_SaveVideo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveVideo&&(identical(other.trimmer, trimmer) || other.trimmer == trimmer)&&(identical(other.startValue, startValue) || other.startValue == startValue)&&(identical(other.endValue, endValue) || other.endValue == endValue));
}


@override
int get hashCode => Object.hash(runtimeType,trimmer,startValue,endValue);

@override
String toString() {
  return 'VideoTrimEvent.saveVideo(trimmer: $trimmer, startValue: $startValue, endValue: $endValue)';
}


}

/// @nodoc
abstract mixin class _$SaveVideoCopyWith<$Res> implements $VideoTrimEventCopyWith<$Res> {
  factory _$SaveVideoCopyWith(_SaveVideo value, $Res Function(_SaveVideo) _then) = __$SaveVideoCopyWithImpl;
@useResult
$Res call({
 Trimmer trimmer, double startValue, double endValue
});




}
/// @nodoc
class __$SaveVideoCopyWithImpl<$Res>
    implements _$SaveVideoCopyWith<$Res> {
  __$SaveVideoCopyWithImpl(this._self, this._then);

  final _SaveVideo _self;
  final $Res Function(_SaveVideo) _then;

/// Create a copy of VideoTrimEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trimmer = null,Object? startValue = null,Object? endValue = null,}) {
  return _then(_SaveVideo(
trimmer: null == trimmer ? _self.trimmer : trimmer // ignore: cast_nullable_to_non_nullable
as Trimmer,startValue: null == startValue ? _self.startValue : startValue // ignore: cast_nullable_to_non_nullable
as double,endValue: null == endValue ? _self.endValue : endValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _UpdatePlayback implements VideoTrimEvent {
  const _UpdatePlayback(this.isPlaying);
  

 final  bool isPlaying;

/// Create a copy of VideoTrimEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePlaybackCopyWith<_UpdatePlayback> get copyWith => __$UpdatePlaybackCopyWithImpl<_UpdatePlayback>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePlayback&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying);

@override
String toString() {
  return 'VideoTrimEvent.updatePlayback(isPlaying: $isPlaying)';
}


}

/// @nodoc
abstract mixin class _$UpdatePlaybackCopyWith<$Res> implements $VideoTrimEventCopyWith<$Res> {
  factory _$UpdatePlaybackCopyWith(_UpdatePlayback value, $Res Function(_UpdatePlayback) _then) = __$UpdatePlaybackCopyWithImpl;
@useResult
$Res call({
 bool isPlaying
});




}
/// @nodoc
class __$UpdatePlaybackCopyWithImpl<$Res>
    implements _$UpdatePlaybackCopyWith<$Res> {
  __$UpdatePlaybackCopyWithImpl(this._self, this._then);

  final _UpdatePlayback _self;
  final $Res Function(_UpdatePlayback) _then;

/// Create a copy of VideoTrimEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPlaying = null,}) {
  return _then(_UpdatePlayback(
null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _UpdateRange implements VideoTrimEvent {
  const _UpdateRange(this.startValue, this.endValue);
  

 final  double startValue;
 final  double endValue;

/// Create a copy of VideoTrimEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateRangeCopyWith<_UpdateRange> get copyWith => __$UpdateRangeCopyWithImpl<_UpdateRange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateRange&&(identical(other.startValue, startValue) || other.startValue == startValue)&&(identical(other.endValue, endValue) || other.endValue == endValue));
}


@override
int get hashCode => Object.hash(runtimeType,startValue,endValue);

@override
String toString() {
  return 'VideoTrimEvent.updateRange(startValue: $startValue, endValue: $endValue)';
}


}

/// @nodoc
abstract mixin class _$UpdateRangeCopyWith<$Res> implements $VideoTrimEventCopyWith<$Res> {
  factory _$UpdateRangeCopyWith(_UpdateRange value, $Res Function(_UpdateRange) _then) = __$UpdateRangeCopyWithImpl;
@useResult
$Res call({
 double startValue, double endValue
});




}
/// @nodoc
class __$UpdateRangeCopyWithImpl<$Res>
    implements _$UpdateRangeCopyWith<$Res> {
  __$UpdateRangeCopyWithImpl(this._self, this._then);

  final _UpdateRange _self;
  final $Res Function(_UpdateRange) _then;

/// Create a copy of VideoTrimEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? startValue = null,Object? endValue = null,}) {
  return _then(_UpdateRange(
null == startValue ? _self.startValue : startValue // ignore: cast_nullable_to_non_nullable
as double,null == endValue ? _self.endValue : endValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
