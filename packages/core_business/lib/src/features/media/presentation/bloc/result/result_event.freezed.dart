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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _TogglePlay value)?  togglePlay,TResult Function( _ToggleMute value)?  toggleMute,TResult Function( _UpdatePlaying value)?  updatePlaying,TResult Function( _UpdateBuffering value)?  updateBuffering,TResult Function( _ChangeExtendPrompt value)?  changeExtendPrompt,TResult Function( _ClearPrompt value)?  clearExtendPrompt,TResult Function( _UseInspireMe value)?  useInspireMe,TResult Function( _ChangeExtendQuality value)?  changeExtendQuality,TResult Function( _ChangeExtendDuration value)?  changeExtendDuration,TResult Function( _DeleteVideo value)?  deleteVideo,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _TogglePlay() when togglePlay != null:
return togglePlay(_that);case _ToggleMute() when toggleMute != null:
return toggleMute(_that);case _UpdatePlaying() when updatePlaying != null:
return updatePlaying(_that);case _UpdateBuffering() when updateBuffering != null:
return updateBuffering(_that);case _ChangeExtendPrompt() when changeExtendPrompt != null:
return changeExtendPrompt(_that);case _ClearPrompt() when clearExtendPrompt != null:
return clearExtendPrompt(_that);case _UseInspireMe() when useInspireMe != null:
return useInspireMe(_that);case _ChangeExtendQuality() when changeExtendQuality != null:
return changeExtendQuality(_that);case _ChangeExtendDuration() when changeExtendDuration != null:
return changeExtendDuration(_that);case _DeleteVideo() when deleteVideo != null:
return deleteVideo(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _TogglePlay value)  togglePlay,required TResult Function( _ToggleMute value)  toggleMute,required TResult Function( _UpdatePlaying value)  updatePlaying,required TResult Function( _UpdateBuffering value)  updateBuffering,required TResult Function( _ChangeExtendPrompt value)  changeExtendPrompt,required TResult Function( _ClearPrompt value)  clearExtendPrompt,required TResult Function( _UseInspireMe value)  useInspireMe,required TResult Function( _ChangeExtendQuality value)  changeExtendQuality,required TResult Function( _ChangeExtendDuration value)  changeExtendDuration,required TResult Function( _DeleteVideo value)  deleteVideo,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _TogglePlay():
return togglePlay(_that);case _ToggleMute():
return toggleMute(_that);case _UpdatePlaying():
return updatePlaying(_that);case _UpdateBuffering():
return updateBuffering(_that);case _ChangeExtendPrompt():
return changeExtendPrompt(_that);case _ClearPrompt():
return clearExtendPrompt(_that);case _UseInspireMe():
return useInspireMe(_that);case _ChangeExtendQuality():
return changeExtendQuality(_that);case _ChangeExtendDuration():
return changeExtendDuration(_that);case _DeleteVideo():
return deleteVideo(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _TogglePlay value)?  togglePlay,TResult? Function( _ToggleMute value)?  toggleMute,TResult? Function( _UpdatePlaying value)?  updatePlaying,TResult? Function( _UpdateBuffering value)?  updateBuffering,TResult? Function( _ChangeExtendPrompt value)?  changeExtendPrompt,TResult? Function( _ClearPrompt value)?  clearExtendPrompt,TResult? Function( _UseInspireMe value)?  useInspireMe,TResult? Function( _ChangeExtendQuality value)?  changeExtendQuality,TResult? Function( _ChangeExtendDuration value)?  changeExtendDuration,TResult? Function( _DeleteVideo value)?  deleteVideo,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _TogglePlay() when togglePlay != null:
return togglePlay(_that);case _ToggleMute() when toggleMute != null:
return toggleMute(_that);case _UpdatePlaying() when updatePlaying != null:
return updatePlaying(_that);case _UpdateBuffering() when updateBuffering != null:
return updateBuffering(_that);case _ChangeExtendPrompt() when changeExtendPrompt != null:
return changeExtendPrompt(_that);case _ClearPrompt() when clearExtendPrompt != null:
return clearExtendPrompt(_that);case _UseInspireMe() when useInspireMe != null:
return useInspireMe(_that);case _ChangeExtendQuality() when changeExtendQuality != null:
return changeExtendQuality(_that);case _ChangeExtendDuration() when changeExtendDuration != null:
return changeExtendDuration(_that);case _DeleteVideo() when deleteVideo != null:
return deleteVideo(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String videoId,  String title,  String? imageUrl,  String videoUrl,  String createdAt)?  init,TResult Function()?  togglePlay,TResult Function()?  toggleMute,TResult Function( bool isPlaying)?  updatePlaying,TResult Function( bool isBuffering)?  updateBuffering,TResult Function( String prompt)?  changeExtendPrompt,TResult Function()?  clearExtendPrompt,TResult Function()?  useInspireMe,TResult Function( String quality)?  changeExtendQuality,TResult Function( String duration)?  changeExtendDuration,TResult Function()?  deleteVideo,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.videoId,_that.title,_that.imageUrl,_that.videoUrl,_that.createdAt);case _TogglePlay() when togglePlay != null:
return togglePlay();case _ToggleMute() when toggleMute != null:
return toggleMute();case _UpdatePlaying() when updatePlaying != null:
return updatePlaying(_that.isPlaying);case _UpdateBuffering() when updateBuffering != null:
return updateBuffering(_that.isBuffering);case _ChangeExtendPrompt() when changeExtendPrompt != null:
return changeExtendPrompt(_that.prompt);case _ClearPrompt() when clearExtendPrompt != null:
return clearExtendPrompt();case _UseInspireMe() when useInspireMe != null:
return useInspireMe();case _ChangeExtendQuality() when changeExtendQuality != null:
return changeExtendQuality(_that.quality);case _ChangeExtendDuration() when changeExtendDuration != null:
return changeExtendDuration(_that.duration);case _DeleteVideo() when deleteVideo != null:
return deleteVideo();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String videoId,  String title,  String? imageUrl,  String videoUrl,  String createdAt)  init,required TResult Function()  togglePlay,required TResult Function()  toggleMute,required TResult Function( bool isPlaying)  updatePlaying,required TResult Function( bool isBuffering)  updateBuffering,required TResult Function( String prompt)  changeExtendPrompt,required TResult Function()  clearExtendPrompt,required TResult Function()  useInspireMe,required TResult Function( String quality)  changeExtendQuality,required TResult Function( String duration)  changeExtendDuration,required TResult Function()  deleteVideo,}) {final _that = this;
switch (_that) {
case _Init():
return init(_that.videoId,_that.title,_that.imageUrl,_that.videoUrl,_that.createdAt);case _TogglePlay():
return togglePlay();case _ToggleMute():
return toggleMute();case _UpdatePlaying():
return updatePlaying(_that.isPlaying);case _UpdateBuffering():
return updateBuffering(_that.isBuffering);case _ChangeExtendPrompt():
return changeExtendPrompt(_that.prompt);case _ClearPrompt():
return clearExtendPrompt();case _UseInspireMe():
return useInspireMe();case _ChangeExtendQuality():
return changeExtendQuality(_that.quality);case _ChangeExtendDuration():
return changeExtendDuration(_that.duration);case _DeleteVideo():
return deleteVideo();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String videoId,  String title,  String? imageUrl,  String videoUrl,  String createdAt)?  init,TResult? Function()?  togglePlay,TResult? Function()?  toggleMute,TResult? Function( bool isPlaying)?  updatePlaying,TResult? Function( bool isBuffering)?  updateBuffering,TResult? Function( String prompt)?  changeExtendPrompt,TResult? Function()?  clearExtendPrompt,TResult? Function()?  useInspireMe,TResult? Function( String quality)?  changeExtendQuality,TResult? Function( String duration)?  changeExtendDuration,TResult? Function()?  deleteVideo,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.videoId,_that.title,_that.imageUrl,_that.videoUrl,_that.createdAt);case _TogglePlay() when togglePlay != null:
return togglePlay();case _ToggleMute() when toggleMute != null:
return toggleMute();case _UpdatePlaying() when updatePlaying != null:
return updatePlaying(_that.isPlaying);case _UpdateBuffering() when updateBuffering != null:
return updateBuffering(_that.isBuffering);case _ChangeExtendPrompt() when changeExtendPrompt != null:
return changeExtendPrompt(_that.prompt);case _ClearPrompt() when clearExtendPrompt != null:
return clearExtendPrompt();case _UseInspireMe() when useInspireMe != null:
return useInspireMe();case _ChangeExtendQuality() when changeExtendQuality != null:
return changeExtendQuality(_that.quality);case _ChangeExtendDuration() when changeExtendDuration != null:
return changeExtendDuration(_that.duration);case _DeleteVideo() when deleteVideo != null:
return deleteVideo();case _:
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

/// @nodoc


class _ChangeExtendPrompt implements ResultEvent {
  const _ChangeExtendPrompt(this.prompt);
  

 final  String prompt;

/// Create a copy of ResultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeExtendPromptCopyWith<_ChangeExtendPrompt> get copyWith => __$ChangeExtendPromptCopyWithImpl<_ChangeExtendPrompt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeExtendPrompt&&(identical(other.prompt, prompt) || other.prompt == prompt));
}


@override
int get hashCode => Object.hash(runtimeType,prompt);

@override
String toString() {
  return 'ResultEvent.changeExtendPrompt(prompt: $prompt)';
}


}

/// @nodoc
abstract mixin class _$ChangeExtendPromptCopyWith<$Res> implements $ResultEventCopyWith<$Res> {
  factory _$ChangeExtendPromptCopyWith(_ChangeExtendPrompt value, $Res Function(_ChangeExtendPrompt) _then) = __$ChangeExtendPromptCopyWithImpl;
@useResult
$Res call({
 String prompt
});




}
/// @nodoc
class __$ChangeExtendPromptCopyWithImpl<$Res>
    implements _$ChangeExtendPromptCopyWith<$Res> {
  __$ChangeExtendPromptCopyWithImpl(this._self, this._then);

  final _ChangeExtendPrompt _self;
  final $Res Function(_ChangeExtendPrompt) _then;

/// Create a copy of ResultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? prompt = null,}) {
  return _then(_ChangeExtendPrompt(
null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ClearPrompt implements ResultEvent {
  const _ClearPrompt();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearPrompt);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResultEvent.clearExtendPrompt()';
}


}




/// @nodoc


class _UseInspireMe implements ResultEvent {
  const _UseInspireMe();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UseInspireMe);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResultEvent.useInspireMe()';
}


}




/// @nodoc


class _ChangeExtendQuality implements ResultEvent {
  const _ChangeExtendQuality(this.quality);
  

 final  String quality;

/// Create a copy of ResultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeExtendQualityCopyWith<_ChangeExtendQuality> get copyWith => __$ChangeExtendQualityCopyWithImpl<_ChangeExtendQuality>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeExtendQuality&&(identical(other.quality, quality) || other.quality == quality));
}


@override
int get hashCode => Object.hash(runtimeType,quality);

@override
String toString() {
  return 'ResultEvent.changeExtendQuality(quality: $quality)';
}


}

/// @nodoc
abstract mixin class _$ChangeExtendQualityCopyWith<$Res> implements $ResultEventCopyWith<$Res> {
  factory _$ChangeExtendQualityCopyWith(_ChangeExtendQuality value, $Res Function(_ChangeExtendQuality) _then) = __$ChangeExtendQualityCopyWithImpl;
@useResult
$Res call({
 String quality
});




}
/// @nodoc
class __$ChangeExtendQualityCopyWithImpl<$Res>
    implements _$ChangeExtendQualityCopyWith<$Res> {
  __$ChangeExtendQualityCopyWithImpl(this._self, this._then);

  final _ChangeExtendQuality _self;
  final $Res Function(_ChangeExtendQuality) _then;

/// Create a copy of ResultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quality = null,}) {
  return _then(_ChangeExtendQuality(
null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ChangeExtendDuration implements ResultEvent {
  const _ChangeExtendDuration(this.duration);
  

 final  String duration;

/// Create a copy of ResultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeExtendDurationCopyWith<_ChangeExtendDuration> get copyWith => __$ChangeExtendDurationCopyWithImpl<_ChangeExtendDuration>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeExtendDuration&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'ResultEvent.changeExtendDuration(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$ChangeExtendDurationCopyWith<$Res> implements $ResultEventCopyWith<$Res> {
  factory _$ChangeExtendDurationCopyWith(_ChangeExtendDuration value, $Res Function(_ChangeExtendDuration) _then) = __$ChangeExtendDurationCopyWithImpl;
@useResult
$Res call({
 String duration
});




}
/// @nodoc
class __$ChangeExtendDurationCopyWithImpl<$Res>
    implements _$ChangeExtendDurationCopyWith<$Res> {
  __$ChangeExtendDurationCopyWithImpl(this._self, this._then);

  final _ChangeExtendDuration _self;
  final $Res Function(_ChangeExtendDuration) _then;

/// Create a copy of ResultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_ChangeExtendDuration(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeleteVideo implements ResultEvent {
  const _DeleteVideo();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteVideo);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResultEvent.deleteVideo()';
}


}




// dart format on
