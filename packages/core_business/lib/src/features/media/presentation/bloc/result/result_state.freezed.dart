// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResultState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResultState()';
}


}

/// @nodoc
class $ResultStateCopyWith<$Res>  {
$ResultStateCopyWith(ResultState _, $Res Function(ResultState) __);
}


/// Adds pattern-matching-related methods to [ResultState].
extension ResultStatePatterns on ResultState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Ready value)?  ready,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Ready() when ready != null:
return ready(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Ready value)  ready,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Ready():
return ready(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Ready value)?  ready,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Ready() when ready != null:
return ready(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String videoId,  String title,  String? imageUrl,  String videoUrl,  String createdAt,  bool isPlaying,  bool isMuted,  bool isBuffering,  String extendPrompt,  String extendQuality,  String extendDuration,  int inspireMeCount,  bool isGeneratingExtended,  bool isDeleted,  bool isDownloading,  bool isSharing,  String? downloadErrorMessage,  String? shareErrorMessage,  bool downloadSuccess,  bool shareSuccess,  bool isVip)?  ready,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.videoId,_that.title,_that.imageUrl,_that.videoUrl,_that.createdAt,_that.isPlaying,_that.isMuted,_that.isBuffering,_that.extendPrompt,_that.extendQuality,_that.extendDuration,_that.inspireMeCount,_that.isGeneratingExtended,_that.isDeleted,_that.isDownloading,_that.isSharing,_that.downloadErrorMessage,_that.shareErrorMessage,_that.downloadSuccess,_that.shareSuccess,_that.isVip);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String videoId,  String title,  String? imageUrl,  String videoUrl,  String createdAt,  bool isPlaying,  bool isMuted,  bool isBuffering,  String extendPrompt,  String extendQuality,  String extendDuration,  int inspireMeCount,  bool isGeneratingExtended,  bool isDeleted,  bool isDownloading,  bool isSharing,  String? downloadErrorMessage,  String? shareErrorMessage,  bool downloadSuccess,  bool shareSuccess,  bool isVip)  ready,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Ready():
return ready(_that.videoId,_that.title,_that.imageUrl,_that.videoUrl,_that.createdAt,_that.isPlaying,_that.isMuted,_that.isBuffering,_that.extendPrompt,_that.extendQuality,_that.extendDuration,_that.inspireMeCount,_that.isGeneratingExtended,_that.isDeleted,_that.isDownloading,_that.isSharing,_that.downloadErrorMessage,_that.shareErrorMessage,_that.downloadSuccess,_that.shareSuccess,_that.isVip);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String videoId,  String title,  String? imageUrl,  String videoUrl,  String createdAt,  bool isPlaying,  bool isMuted,  bool isBuffering,  String extendPrompt,  String extendQuality,  String extendDuration,  int inspireMeCount,  bool isGeneratingExtended,  bool isDeleted,  bool isDownloading,  bool isSharing,  String? downloadErrorMessage,  String? shareErrorMessage,  bool downloadSuccess,  bool shareSuccess,  bool isVip)?  ready,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.videoId,_that.title,_that.imageUrl,_that.videoUrl,_that.createdAt,_that.isPlaying,_that.isMuted,_that.isBuffering,_that.extendPrompt,_that.extendQuality,_that.extendDuration,_that.inspireMeCount,_that.isGeneratingExtended,_that.isDeleted,_that.isDownloading,_that.isSharing,_that.downloadErrorMessage,_that.shareErrorMessage,_that.downloadSuccess,_that.shareSuccess,_that.isVip);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ResultState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResultState.initial()';
}


}




/// @nodoc


class _Loading implements ResultState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResultState.loading()';
}


}




/// @nodoc


class _Ready implements ResultState {
  const _Ready({required this.videoId, required this.title, required this.imageUrl, required this.videoUrl, required this.createdAt, required this.isPlaying, required this.isMuted, required this.isBuffering, this.extendPrompt = '', this.extendQuality = 'Full HD', this.extendDuration = '5s', this.inspireMeCount = 3, this.isGeneratingExtended = false, this.isDeleted = false, this.isDownloading = false, this.isSharing = false, this.downloadErrorMessage, this.shareErrorMessage, this.downloadSuccess = false, this.shareSuccess = false, this.isVip = false});
  

 final  String videoId;
 final  String title;
 final  String? imageUrl;
 final  String videoUrl;
 final  String createdAt;
 final  bool isPlaying;
 final  bool isMuted;
 final  bool isBuffering;
@JsonKey() final  String extendPrompt;
@JsonKey() final  String extendQuality;
@JsonKey() final  String extendDuration;
@JsonKey() final  int inspireMeCount;
@JsonKey() final  bool isGeneratingExtended;
@JsonKey() final  bool isDeleted;
@JsonKey() final  bool isDownloading;
@JsonKey() final  bool isSharing;
 final  String? downloadErrorMessage;
 final  String? shareErrorMessage;
@JsonKey() final  bool downloadSuccess;
@JsonKey() final  bool shareSuccess;
@JsonKey() final  bool isVip;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isBuffering, isBuffering) || other.isBuffering == isBuffering)&&(identical(other.extendPrompt, extendPrompt) || other.extendPrompt == extendPrompt)&&(identical(other.extendQuality, extendQuality) || other.extendQuality == extendQuality)&&(identical(other.extendDuration, extendDuration) || other.extendDuration == extendDuration)&&(identical(other.inspireMeCount, inspireMeCount) || other.inspireMeCount == inspireMeCount)&&(identical(other.isGeneratingExtended, isGeneratingExtended) || other.isGeneratingExtended == isGeneratingExtended)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isDownloading, isDownloading) || other.isDownloading == isDownloading)&&(identical(other.isSharing, isSharing) || other.isSharing == isSharing)&&(identical(other.downloadErrorMessage, downloadErrorMessage) || other.downloadErrorMessage == downloadErrorMessage)&&(identical(other.shareErrorMessage, shareErrorMessage) || other.shareErrorMessage == shareErrorMessage)&&(identical(other.downloadSuccess, downloadSuccess) || other.downloadSuccess == downloadSuccess)&&(identical(other.shareSuccess, shareSuccess) || other.shareSuccess == shareSuccess)&&(identical(other.isVip, isVip) || other.isVip == isVip));
}


@override
int get hashCode => Object.hashAll([runtimeType,videoId,title,imageUrl,videoUrl,createdAt,isPlaying,isMuted,isBuffering,extendPrompt,extendQuality,extendDuration,inspireMeCount,isGeneratingExtended,isDeleted,isDownloading,isSharing,downloadErrorMessage,shareErrorMessage,downloadSuccess,shareSuccess,isVip]);

@override
String toString() {
  return 'ResultState.ready(videoId: $videoId, title: $title, imageUrl: $imageUrl, videoUrl: $videoUrl, createdAt: $createdAt, isPlaying: $isPlaying, isMuted: $isMuted, isBuffering: $isBuffering, extendPrompt: $extendPrompt, extendQuality: $extendQuality, extendDuration: $extendDuration, inspireMeCount: $inspireMeCount, isGeneratingExtended: $isGeneratingExtended, isDeleted: $isDeleted, isDownloading: $isDownloading, isSharing: $isSharing, downloadErrorMessage: $downloadErrorMessage, shareErrorMessage: $shareErrorMessage, downloadSuccess: $downloadSuccess, shareSuccess: $shareSuccess, isVip: $isVip)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $ResultStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 String videoId, String title, String? imageUrl, String videoUrl, String createdAt, bool isPlaying, bool isMuted, bool isBuffering, String extendPrompt, String extendQuality, String extendDuration, int inspireMeCount, bool isGeneratingExtended, bool isDeleted, bool isDownloading, bool isSharing, String? downloadErrorMessage, String? shareErrorMessage, bool downloadSuccess, bool shareSuccess, bool isVip
});




}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? videoId = null,Object? title = null,Object? imageUrl = freezed,Object? videoUrl = null,Object? createdAt = null,Object? isPlaying = null,Object? isMuted = null,Object? isBuffering = null,Object? extendPrompt = null,Object? extendQuality = null,Object? extendDuration = null,Object? inspireMeCount = null,Object? isGeneratingExtended = null,Object? isDeleted = null,Object? isDownloading = null,Object? isSharing = null,Object? downloadErrorMessage = freezed,Object? shareErrorMessage = freezed,Object? downloadSuccess = null,Object? shareSuccess = null,Object? isVip = null,}) {
  return _then(_Ready(
videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isBuffering: null == isBuffering ? _self.isBuffering : isBuffering // ignore: cast_nullable_to_non_nullable
as bool,extendPrompt: null == extendPrompt ? _self.extendPrompt : extendPrompt // ignore: cast_nullable_to_non_nullable
as String,extendQuality: null == extendQuality ? _self.extendQuality : extendQuality // ignore: cast_nullable_to_non_nullable
as String,extendDuration: null == extendDuration ? _self.extendDuration : extendDuration // ignore: cast_nullable_to_non_nullable
as String,inspireMeCount: null == inspireMeCount ? _self.inspireMeCount : inspireMeCount // ignore: cast_nullable_to_non_nullable
as int,isGeneratingExtended: null == isGeneratingExtended ? _self.isGeneratingExtended : isGeneratingExtended // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,isDownloading: null == isDownloading ? _self.isDownloading : isDownloading // ignore: cast_nullable_to_non_nullable
as bool,isSharing: null == isSharing ? _self.isSharing : isSharing // ignore: cast_nullable_to_non_nullable
as bool,downloadErrorMessage: freezed == downloadErrorMessage ? _self.downloadErrorMessage : downloadErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,shareErrorMessage: freezed == shareErrorMessage ? _self.shareErrorMessage : shareErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,downloadSuccess: null == downloadSuccess ? _self.downloadSuccess : downloadSuccess // ignore: cast_nullable_to_non_nullable
as bool,shareSuccess: null == shareSuccess ? _self.shareSuccess : shareSuccess // ignore: cast_nullable_to_non_nullable
as bool,isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Error implements ResultState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ResultState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ResultStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
