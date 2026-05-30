// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_player_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VideoPlayerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoPlayerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoPlayerEvent()';
}


}

/// @nodoc
class $VideoPlayerEventCopyWith<$Res>  {
$VideoPlayerEventCopyWith(VideoPlayerEvent _, $Res Function(VideoPlayerEvent) __);
}


/// Adds pattern-matching-related methods to [VideoPlayerEvent].
extension VideoPlayerEventPatterns on VideoPlayerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _TogglePlay value)?  togglePlay,TResult Function( _ToggleMute value)?  toggleMute,TResult Function( _Seek value)?  seek,TResult Function( _UpdatePosition value)?  updatePosition,TResult Function( _UpdateDuration value)?  updateDuration,TResult Function( _UpdateBuffering value)?  updateBuffering,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _TogglePlay() when togglePlay != null:
return togglePlay(_that);case _ToggleMute() when toggleMute != null:
return toggleMute(_that);case _Seek() when seek != null:
return seek(_that);case _UpdatePosition() when updatePosition != null:
return updatePosition(_that);case _UpdateDuration() when updateDuration != null:
return updateDuration(_that);case _UpdateBuffering() when updateBuffering != null:
return updateBuffering(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _TogglePlay value)  togglePlay,required TResult Function( _ToggleMute value)  toggleMute,required TResult Function( _Seek value)  seek,required TResult Function( _UpdatePosition value)  updatePosition,required TResult Function( _UpdateDuration value)  updateDuration,required TResult Function( _UpdateBuffering value)  updateBuffering,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _TogglePlay():
return togglePlay(_that);case _ToggleMute():
return toggleMute(_that);case _Seek():
return seek(_that);case _UpdatePosition():
return updatePosition(_that);case _UpdateDuration():
return updateDuration(_that);case _UpdateBuffering():
return updateBuffering(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _TogglePlay value)?  togglePlay,TResult? Function( _ToggleMute value)?  toggleMute,TResult? Function( _Seek value)?  seek,TResult? Function( _UpdatePosition value)?  updatePosition,TResult? Function( _UpdateDuration value)?  updateDuration,TResult? Function( _UpdateBuffering value)?  updateBuffering,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _TogglePlay() when togglePlay != null:
return togglePlay(_that);case _ToggleMute() when toggleMute != null:
return toggleMute(_that);case _Seek() when seek != null:
return seek(_that);case _UpdatePosition() when updatePosition != null:
return updatePosition(_that);case _UpdateDuration() when updateDuration != null:
return updateDuration(_that);case _UpdateBuffering() when updateBuffering != null:
return updateBuffering(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String url)?  init,TResult Function()?  togglePlay,TResult Function()?  toggleMute,TResult Function( Duration position)?  seek,TResult Function( Duration position)?  updatePosition,TResult Function( Duration duration)?  updateDuration,TResult Function( bool isBuffering)?  updateBuffering,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.url);case _TogglePlay() when togglePlay != null:
return togglePlay();case _ToggleMute() when toggleMute != null:
return toggleMute();case _Seek() when seek != null:
return seek(_that.position);case _UpdatePosition() when updatePosition != null:
return updatePosition(_that.position);case _UpdateDuration() when updateDuration != null:
return updateDuration(_that.duration);case _UpdateBuffering() when updateBuffering != null:
return updateBuffering(_that.isBuffering);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String url)  init,required TResult Function()  togglePlay,required TResult Function()  toggleMute,required TResult Function( Duration position)  seek,required TResult Function( Duration position)  updatePosition,required TResult Function( Duration duration)  updateDuration,required TResult Function( bool isBuffering)  updateBuffering,}) {final _that = this;
switch (_that) {
case _Init():
return init(_that.url);case _TogglePlay():
return togglePlay();case _ToggleMute():
return toggleMute();case _Seek():
return seek(_that.position);case _UpdatePosition():
return updatePosition(_that.position);case _UpdateDuration():
return updateDuration(_that.duration);case _UpdateBuffering():
return updateBuffering(_that.isBuffering);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String url)?  init,TResult? Function()?  togglePlay,TResult? Function()?  toggleMute,TResult? Function( Duration position)?  seek,TResult? Function( Duration position)?  updatePosition,TResult? Function( Duration duration)?  updateDuration,TResult? Function( bool isBuffering)?  updateBuffering,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.url);case _TogglePlay() when togglePlay != null:
return togglePlay();case _ToggleMute() when toggleMute != null:
return toggleMute();case _Seek() when seek != null:
return seek(_that.position);case _UpdatePosition() when updatePosition != null:
return updatePosition(_that.position);case _UpdateDuration() when updateDuration != null:
return updateDuration(_that.duration);case _UpdateBuffering() when updateBuffering != null:
return updateBuffering(_that.isBuffering);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements VideoPlayerEvent {
  const _Init({required this.url});
  

 final  String url;

/// Create a copy of VideoPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitCopyWith<_Init> get copyWith => __$InitCopyWithImpl<_Init>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'VideoPlayerEvent.init(url: $url)';
}


}

/// @nodoc
abstract mixin class _$InitCopyWith<$Res> implements $VideoPlayerEventCopyWith<$Res> {
  factory _$InitCopyWith(_Init value, $Res Function(_Init) _then) = __$InitCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class __$InitCopyWithImpl<$Res>
    implements _$InitCopyWith<$Res> {
  __$InitCopyWithImpl(this._self, this._then);

  final _Init _self;
  final $Res Function(_Init) _then;

/// Create a copy of VideoPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_Init(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TogglePlay implements VideoPlayerEvent {
  const _TogglePlay();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TogglePlay);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoPlayerEvent.togglePlay()';
}


}




/// @nodoc


class _ToggleMute implements VideoPlayerEvent {
  const _ToggleMute();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleMute);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoPlayerEvent.toggleMute()';
}


}




/// @nodoc


class _Seek implements VideoPlayerEvent {
  const _Seek(this.position);
  

 final  Duration position;

/// Create a copy of VideoPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeekCopyWith<_Seek> get copyWith => __$SeekCopyWithImpl<_Seek>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seek&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,position);

@override
String toString() {
  return 'VideoPlayerEvent.seek(position: $position)';
}


}

/// @nodoc
abstract mixin class _$SeekCopyWith<$Res> implements $VideoPlayerEventCopyWith<$Res> {
  factory _$SeekCopyWith(_Seek value, $Res Function(_Seek) _then) = __$SeekCopyWithImpl;
@useResult
$Res call({
 Duration position
});




}
/// @nodoc
class __$SeekCopyWithImpl<$Res>
    implements _$SeekCopyWith<$Res> {
  __$SeekCopyWithImpl(this._self, this._then);

  final _Seek _self;
  final $Res Function(_Seek) _then;

/// Create a copy of VideoPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? position = null,}) {
  return _then(_Seek(
null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class _UpdatePosition implements VideoPlayerEvent {
  const _UpdatePosition(this.position);
  

 final  Duration position;

/// Create a copy of VideoPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePositionCopyWith<_UpdatePosition> get copyWith => __$UpdatePositionCopyWithImpl<_UpdatePosition>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePosition&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,position);

@override
String toString() {
  return 'VideoPlayerEvent.updatePosition(position: $position)';
}


}

/// @nodoc
abstract mixin class _$UpdatePositionCopyWith<$Res> implements $VideoPlayerEventCopyWith<$Res> {
  factory _$UpdatePositionCopyWith(_UpdatePosition value, $Res Function(_UpdatePosition) _then) = __$UpdatePositionCopyWithImpl;
@useResult
$Res call({
 Duration position
});




}
/// @nodoc
class __$UpdatePositionCopyWithImpl<$Res>
    implements _$UpdatePositionCopyWith<$Res> {
  __$UpdatePositionCopyWithImpl(this._self, this._then);

  final _UpdatePosition _self;
  final $Res Function(_UpdatePosition) _then;

/// Create a copy of VideoPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? position = null,}) {
  return _then(_UpdatePosition(
null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class _UpdateDuration implements VideoPlayerEvent {
  const _UpdateDuration(this.duration);
  

 final  Duration duration;

/// Create a copy of VideoPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDurationCopyWith<_UpdateDuration> get copyWith => __$UpdateDurationCopyWithImpl<_UpdateDuration>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDuration&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'VideoPlayerEvent.updateDuration(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$UpdateDurationCopyWith<$Res> implements $VideoPlayerEventCopyWith<$Res> {
  factory _$UpdateDurationCopyWith(_UpdateDuration value, $Res Function(_UpdateDuration) _then) = __$UpdateDurationCopyWithImpl;
@useResult
$Res call({
 Duration duration
});




}
/// @nodoc
class __$UpdateDurationCopyWithImpl<$Res>
    implements _$UpdateDurationCopyWith<$Res> {
  __$UpdateDurationCopyWithImpl(this._self, this._then);

  final _UpdateDuration _self;
  final $Res Function(_UpdateDuration) _then;

/// Create a copy of VideoPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_UpdateDuration(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class _UpdateBuffering implements VideoPlayerEvent {
  const _UpdateBuffering(this.isBuffering);
  

 final  bool isBuffering;

/// Create a copy of VideoPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateBufferingCopyWith<_UpdateBuffering> get copyWith => __$UpdateBufferingCopyWithImpl<_UpdateBuffering>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateBuffering&&(identical(other.isBuffering, isBuffering) || other.isBuffering == isBuffering));
}


@override
int get hashCode => Object.hash(runtimeType,isBuffering);

@override
String toString() {
  return 'VideoPlayerEvent.updateBuffering(isBuffering: $isBuffering)';
}


}

/// @nodoc
abstract mixin class _$UpdateBufferingCopyWith<$Res> implements $VideoPlayerEventCopyWith<$Res> {
  factory _$UpdateBufferingCopyWith(_UpdateBuffering value, $Res Function(_UpdateBuffering) _then) = __$UpdateBufferingCopyWithImpl;
@useResult
$Res call({
 bool isBuffering
});




}
/// @nodoc
class __$UpdateBufferingCopyWithImpl<$Res>
    implements _$UpdateBufferingCopyWith<$Res> {
  __$UpdateBufferingCopyWithImpl(this._self, this._then);

  final _UpdateBuffering _self;
  final $Res Function(_UpdateBuffering) _then;

/// Create a copy of VideoPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isBuffering = null,}) {
  return _then(_UpdateBuffering(
null == isBuffering ? _self.isBuffering : isBuffering // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
