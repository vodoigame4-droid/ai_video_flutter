// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generating_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeneratingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneratingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GeneratingEvent()';
}


}

/// @nodoc
class $GeneratingEventCopyWith<$Res>  {
$GeneratingEventCopyWith(GeneratingEvent _, $Res Function(GeneratingEvent) __);
}


/// Adds pattern-matching-related methods to [GeneratingEvent].
extension GeneratingEventPatterns on GeneratingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StartGenerating value)?  startGenerating,TResult Function( _TickProgress value)?  tickProgress,TResult Function( _NotifyComplete value)?  notifyComplete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartGenerating() when startGenerating != null:
return startGenerating(_that);case _TickProgress() when tickProgress != null:
return tickProgress(_that);case _NotifyComplete() when notifyComplete != null:
return notifyComplete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StartGenerating value)  startGenerating,required TResult Function( _TickProgress value)  tickProgress,required TResult Function( _NotifyComplete value)  notifyComplete,}){
final _that = this;
switch (_that) {
case _StartGenerating():
return startGenerating(_that);case _TickProgress():
return tickProgress(_that);case _NotifyComplete():
return notifyComplete(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StartGenerating value)?  startGenerating,TResult? Function( _TickProgress value)?  tickProgress,TResult? Function( _NotifyComplete value)?  notifyComplete,}){
final _that = this;
switch (_that) {
case _StartGenerating() when startGenerating != null:
return startGenerating(_that);case _TickProgress() when tickProgress != null:
return tickProgress(_that);case _NotifyComplete() when notifyComplete != null:
return notifyComplete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String title,  String? imageUrl,  String themeId,  String themeType,  int themeOrgId,  bool isHd,  bool isLongTime)?  startGenerating,TResult Function()?  tickProgress,TResult Function()?  notifyComplete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartGenerating() when startGenerating != null:
return startGenerating(_that.title,_that.imageUrl,_that.themeId,_that.themeType,_that.themeOrgId,_that.isHd,_that.isLongTime);case _TickProgress() when tickProgress != null:
return tickProgress();case _NotifyComplete() when notifyComplete != null:
return notifyComplete();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String title,  String? imageUrl,  String themeId,  String themeType,  int themeOrgId,  bool isHd,  bool isLongTime)  startGenerating,required TResult Function()  tickProgress,required TResult Function()  notifyComplete,}) {final _that = this;
switch (_that) {
case _StartGenerating():
return startGenerating(_that.title,_that.imageUrl,_that.themeId,_that.themeType,_that.themeOrgId,_that.isHd,_that.isLongTime);case _TickProgress():
return tickProgress();case _NotifyComplete():
return notifyComplete();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String title,  String? imageUrl,  String themeId,  String themeType,  int themeOrgId,  bool isHd,  bool isLongTime)?  startGenerating,TResult? Function()?  tickProgress,TResult? Function()?  notifyComplete,}) {final _that = this;
switch (_that) {
case _StartGenerating() when startGenerating != null:
return startGenerating(_that.title,_that.imageUrl,_that.themeId,_that.themeType,_that.themeOrgId,_that.isHd,_that.isLongTime);case _TickProgress() when tickProgress != null:
return tickProgress();case _NotifyComplete() when notifyComplete != null:
return notifyComplete();case _:
  return null;

}
}

}

/// @nodoc


class _StartGenerating implements GeneratingEvent {
  const _StartGenerating({required this.title, required this.imageUrl, this.themeId = '1', this.themeType = 'TEMPLATE', this.themeOrgId = 1, this.isHd = false, this.isLongTime = false});
  

 final  String title;
 final  String? imageUrl;
@JsonKey() final  String themeId;
@JsonKey() final  String themeType;
@JsonKey() final  int themeOrgId;
@JsonKey() final  bool isHd;
@JsonKey() final  bool isLongTime;

/// Create a copy of GeneratingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartGeneratingCopyWith<_StartGenerating> get copyWith => __$StartGeneratingCopyWithImpl<_StartGenerating>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartGenerating&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.themeType, themeType) || other.themeType == themeType)&&(identical(other.themeOrgId, themeOrgId) || other.themeOrgId == themeOrgId)&&(identical(other.isHd, isHd) || other.isHd == isHd)&&(identical(other.isLongTime, isLongTime) || other.isLongTime == isLongTime));
}


@override
int get hashCode => Object.hash(runtimeType,title,imageUrl,themeId,themeType,themeOrgId,isHd,isLongTime);

@override
String toString() {
  return 'GeneratingEvent.startGenerating(title: $title, imageUrl: $imageUrl, themeId: $themeId, themeType: $themeType, themeOrgId: $themeOrgId, isHd: $isHd, isLongTime: $isLongTime)';
}


}

/// @nodoc
abstract mixin class _$StartGeneratingCopyWith<$Res> implements $GeneratingEventCopyWith<$Res> {
  factory _$StartGeneratingCopyWith(_StartGenerating value, $Res Function(_StartGenerating) _then) = __$StartGeneratingCopyWithImpl;
@useResult
$Res call({
 String title, String? imageUrl, String themeId, String themeType, int themeOrgId, bool isHd, bool isLongTime
});




}
/// @nodoc
class __$StartGeneratingCopyWithImpl<$Res>
    implements _$StartGeneratingCopyWith<$Res> {
  __$StartGeneratingCopyWithImpl(this._self, this._then);

  final _StartGenerating _self;
  final $Res Function(_StartGenerating) _then;

/// Create a copy of GeneratingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? imageUrl = freezed,Object? themeId = null,Object? themeType = null,Object? themeOrgId = null,Object? isHd = null,Object? isLongTime = null,}) {
  return _then(_StartGenerating(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,themeType: null == themeType ? _self.themeType : themeType // ignore: cast_nullable_to_non_nullable
as String,themeOrgId: null == themeOrgId ? _self.themeOrgId : themeOrgId // ignore: cast_nullable_to_non_nullable
as int,isHd: null == isHd ? _self.isHd : isHd // ignore: cast_nullable_to_non_nullable
as bool,isLongTime: null == isLongTime ? _self.isLongTime : isLongTime // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _TickProgress implements GeneratingEvent {
  const _TickProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TickProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GeneratingEvent.tickProgress()';
}


}




/// @nodoc


class _NotifyComplete implements GeneratingEvent {
  const _NotifyComplete();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotifyComplete);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GeneratingEvent.notifyComplete()';
}


}




// dart format on
