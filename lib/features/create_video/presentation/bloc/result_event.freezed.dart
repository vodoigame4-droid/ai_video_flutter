// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResultEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResultEvent()';
}


}

/// @nodoc
class $ResultEventCopyWith<$Res>  {
$ResultEventCopyWith(ResultEvent _, $Res Function(ResultEvent) __);
}


/// Adds pattern-matching-related methods to [ResultEvent].
extension ResultEventPatterns on ResultEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _TogglePlay value)?  togglePlay,TResult Function( _ToggleMute value)?  toggleMute,TResult Function( _UpdatePlaying value)?  updatePlaying,TResult Function( _UpdateBuffering value)?  updateBuffering,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _TogglePlay() when togglePlay != null:
return togglePlay(_that);case _ToggleMute() when toggleMute != null:
return toggleMute(_that);case _UpdatePlaying() when updatePlaying != null:
return updatePlaying(_that);case _UpdateBuffering() when updateBuffering != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _TogglePlay value)  togglePlay,required TResult Function( _ToggleMute value)  toggleMute,required TResult Function( _UpdatePlaying value)  updatePlaying,required TResult Function( _UpdateBuffering value)  updateBuffering,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _TogglePlay():
return togglePlay(_that);case _ToggleMute():
return toggleMute(_that);case _UpdatePlaying():
return updatePlaying(_that);case _UpdateBuffering():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _TogglePlay value)?  togglePlay,TResult? Function( _ToggleMute value)?  toggleMute,TResult? Function( _UpdatePlaying value)?  updatePlaying,TResult? Function( _UpdateBuffering value)?  updateBuffering,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _TogglePlay() when togglePlay != null:
return togglePlay(_that);case _ToggleMute() when toggleMute != null:
return toggleMute(_that);case _UpdatePlaying() when updatePlaying != null:
return updatePlaying(_that);case _UpdateBuffering() when updateBuffering != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String videoId,  String title,  String? imageUrl,  String videoUrl,  String createdAt)?  init,TResult Function()?  togglePlay,TResult Function()?  toggleMute,TResult Function( bool isPlaying)?  updatePlaying,TResult Function( bool isBuffering)?  updateBuffering,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.videoId,_that.title,_that.imageUrl,_that.videoUrl,_that.createdAt);case _TogglePlay() when togglePlay != null:
return togglePlay();case _ToggleMute() when toggleMute != null:
return toggleMute();case _UpdatePlaying() when updatePlaying != null:
return updatePlaying(_that.isPlaying);case _UpdateBuffering() when updateBuffering != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String videoId,  String title,  String? imageUrl,  String videoUrl,  String createdAt)  init,required TResult Function()  togglePlay,required TResult Function()  toggleMute,required TResult Function( bool isPlaying)  updatePlaying,required TResult Function( bool isBuffering)  updateBuffering,}) {final _that = this;
switch (_that) {
case _Init():
return init(_that.videoId,_that.title,_that.imageUrl,_that.videoUrl,_that.createdAt);case _TogglePlay():
return togglePlay();case _ToggleMute():
return toggleMute();case _UpdatePlaying():
return updatePlaying(_that.isPlaying);case _UpdateBuffering():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String videoId,  String title,  String? imageUrl,  String videoUrl,  String createdAt)?  init,TResult? Function()?  togglePlay,TResult? Function()?  toggleMute,TResult? Function( bool isPlaying)?  updatePlaying,TResult? Function( bool isBuffering)?  updateBuffering,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.videoId,_that.title,_that.imageUrl,_that.videoUrl,_that.createdAt);case _TogglePlay() when togglePlay != null:
return togglePlay();case _ToggleMute() when toggleMute != null:
return toggleMute();case _UpdatePlaying() when updatePlaying != null:
return updatePlaying(_that.isPlaying);case _UpdateBuffering() when updateBuffering != null:
return updateBuffering(_that.isBuffering);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements ResultEvent {
  const _Init({required this.videoId, required this.title, required this.imageUrl, required this.videoUrl, required this.createdAt});
  

 final  String videoId;
 final  String title;
 final  String? imageUrl;
 final  String videoUrl;
 final  String createdAt;

/// Create a copy of ResultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitCopyWith<_Init> get copyWith => __$InitCopyWithImpl<_Init>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,videoId,title,imageUrl,videoUrl,createdAt);

@override
String toString() {
  return 'ResultEvent.init(videoId: $videoId, title: $title, imageUrl: $imageUrl, videoUrl: $videoUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$InitCopyWith<$Res> implements $ResultEventCopyWith<$Res> {
  factory _$InitCopyWith(_Init value, $Res Function(_Init) _then) = __$InitCopyWithImpl;
@useResult
$Res call({
 String videoId, String title, String? imageUrl, String videoUrl, String createdAt
});




}
/// @nodoc
class __$InitCopyWithImpl<$Res>
    implements _$InitCopyWith<$Res> {
  __$InitCopyWithImpl(this._self, this._then);

  final _Init _self;
  final $Res Function(_Init) _then;

/// Create a copy of ResultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? videoId = null,Object? title = null,Object? imageUrl = freezed,Object? videoUrl = null,Object? createdAt = null,}) {
  return _then(_Init(
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


class _TogglePlay implements ResultEvent {
  const _TogglePlay();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TogglePlay);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResultEvent.togglePlay()';
}


}




/// @nodoc


class _ToggleMute implements ResultEvent {
  const _ToggleMute();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleMute);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResultEvent.toggleMute()';
}


}




/// @nodoc


class _UpdatePlaying implements ResultEvent {
  const _UpdatePlaying(this.isPlaying);
  

 final  bool isPlaying;

/// Create a copy of ResultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePlayingCopyWith<_UpdatePlaying> get copyWith => __$UpdatePlayingCopyWithImpl<_UpdatePlaying>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePlaying&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying);

@override
String toString() {
  return 'ResultEvent.updatePlaying(isPlaying: $isPlaying)';
}


}

/// @nodoc
abstract mixin class _$UpdatePlayingCopyWith<$Res> implements $ResultEventCopyWith<$Res> {
  factory _$UpdatePlayingCopyWith(_UpdatePlaying value, $Res Function(_UpdatePlaying) _then) = __$UpdatePlayingCopyWithImpl;
@useResult
$Res call({
 bool isPlaying
});




}
/// @nodoc
class __$UpdatePlayingCopyWithImpl<$Res>
    implements _$UpdatePlayingCopyWith<$Res> {
  __$UpdatePlayingCopyWithImpl(this._self, this._then);

  final _UpdatePlaying _self;
  final $Res Function(_UpdatePlaying) _then;

/// Create a copy of ResultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPlaying = null,}) {
  return _then(_UpdatePlaying(
null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _UpdateBuffering implements ResultEvent {
  const _UpdateBuffering(this.isBuffering);
  

 final  bool isBuffering;

/// Create a copy of ResultEvent
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
  return 'ResultEvent.updateBuffering(isBuffering: $isBuffering)';
}


}

/// @nodoc
abstract mixin class _$UpdateBufferingCopyWith<$Res> implements $ResultEventCopyWith<$Res> {
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

/// Create a copy of ResultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isBuffering = null,}) {
  return _then(_UpdateBuffering(
null == isBuffering ? _self.isBuffering : isBuffering // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
