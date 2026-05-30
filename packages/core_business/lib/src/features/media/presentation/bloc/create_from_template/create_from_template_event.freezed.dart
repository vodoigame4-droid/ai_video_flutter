// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_from_template_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateFromTemplateEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateFromTemplateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateFromTemplateEvent()';
}


}

/// @nodoc
class $CreateFromTemplateEventCopyWith<$Res>  {
$CreateFromTemplateEventCopyWith(CreateFromTemplateEvent _, $Res Function(CreateFromTemplateEvent) __);
}


/// Adds pattern-matching-related methods to [CreateFromTemplateEvent].
extension CreateFromTemplateEventPatterns on CreateFromTemplateEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _SelectPhoto value)?  selectPhoto,TResult Function( _RemovePhoto value)?  removePhoto,TResult Function( _SelectQuality value)?  selectQuality,TResult Function( _SelectDuration value)?  selectDuration,TResult Function( _StartGenerating value)?  startGenerating,TResult Function( _ToggleLike value)?  toggleLike,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SelectPhoto() when selectPhoto != null:
return selectPhoto(_that);case _RemovePhoto() when removePhoto != null:
return removePhoto(_that);case _SelectQuality() when selectQuality != null:
return selectQuality(_that);case _SelectDuration() when selectDuration != null:
return selectDuration(_that);case _StartGenerating() when startGenerating != null:
return startGenerating(_that);case _ToggleLike() when toggleLike != null:
return toggleLike(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _SelectPhoto value)  selectPhoto,required TResult Function( _RemovePhoto value)  removePhoto,required TResult Function( _SelectQuality value)  selectQuality,required TResult Function( _SelectDuration value)  selectDuration,required TResult Function( _StartGenerating value)  startGenerating,required TResult Function( _ToggleLike value)  toggleLike,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _SelectPhoto():
return selectPhoto(_that);case _RemovePhoto():
return removePhoto(_that);case _SelectQuality():
return selectQuality(_that);case _SelectDuration():
return selectDuration(_that);case _StartGenerating():
return startGenerating(_that);case _ToggleLike():
return toggleLike(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _SelectPhoto value)?  selectPhoto,TResult? Function( _RemovePhoto value)?  removePhoto,TResult? Function( _SelectQuality value)?  selectQuality,TResult? Function( _SelectDuration value)?  selectDuration,TResult? Function( _StartGenerating value)?  startGenerating,TResult? Function( _ToggleLike value)?  toggleLike,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SelectPhoto() when selectPhoto != null:
return selectPhoto(_that);case _RemovePhoto() when removePhoto != null:
return removePhoto(_that);case _SelectQuality() when selectQuality != null:
return selectQuality(_that);case _SelectDuration() when selectDuration != null:
return selectDuration(_that);case _StartGenerating() when startGenerating != null:
return startGenerating(_that);case _ToggleLike() when toggleLike != null:
return toggleLike(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String templateId,  String title,  String videoUrl,  String imageUrl,  String themeType,  int themeOrgId)?  init,TResult Function( String path)?  selectPhoto,TResult Function()?  removePhoto,TResult Function( String quality)?  selectQuality,TResult Function( String duration)?  selectDuration,TResult Function()?  startGenerating,TResult Function()?  toggleLike,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.templateId,_that.title,_that.videoUrl,_that.imageUrl,_that.themeType,_that.themeOrgId);case _SelectPhoto() when selectPhoto != null:
return selectPhoto(_that.path);case _RemovePhoto() when removePhoto != null:
return removePhoto();case _SelectQuality() when selectQuality != null:
return selectQuality(_that.quality);case _SelectDuration() when selectDuration != null:
return selectDuration(_that.duration);case _StartGenerating() when startGenerating != null:
return startGenerating();case _ToggleLike() when toggleLike != null:
return toggleLike();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String templateId,  String title,  String videoUrl,  String imageUrl,  String themeType,  int themeOrgId)  init,required TResult Function( String path)  selectPhoto,required TResult Function()  removePhoto,required TResult Function( String quality)  selectQuality,required TResult Function( String duration)  selectDuration,required TResult Function()  startGenerating,required TResult Function()  toggleLike,}) {final _that = this;
switch (_that) {
case _Init():
return init(_that.templateId,_that.title,_that.videoUrl,_that.imageUrl,_that.themeType,_that.themeOrgId);case _SelectPhoto():
return selectPhoto(_that.path);case _RemovePhoto():
return removePhoto();case _SelectQuality():
return selectQuality(_that.quality);case _SelectDuration():
return selectDuration(_that.duration);case _StartGenerating():
return startGenerating();case _ToggleLike():
return toggleLike();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String templateId,  String title,  String videoUrl,  String imageUrl,  String themeType,  int themeOrgId)?  init,TResult? Function( String path)?  selectPhoto,TResult? Function()?  removePhoto,TResult? Function( String quality)?  selectQuality,TResult? Function( String duration)?  selectDuration,TResult? Function()?  startGenerating,TResult? Function()?  toggleLike,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.templateId,_that.title,_that.videoUrl,_that.imageUrl,_that.themeType,_that.themeOrgId);case _SelectPhoto() when selectPhoto != null:
return selectPhoto(_that.path);case _RemovePhoto() when removePhoto != null:
return removePhoto();case _SelectQuality() when selectQuality != null:
return selectQuality(_that.quality);case _SelectDuration() when selectDuration != null:
return selectDuration(_that.duration);case _StartGenerating() when startGenerating != null:
return startGenerating();case _ToggleLike() when toggleLike != null:
return toggleLike();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements CreateFromTemplateEvent {
  const _Init({required this.templateId, required this.title, required this.videoUrl, required this.imageUrl, required this.themeType, required this.themeOrgId});
  

 final  String templateId;
 final  String title;
 final  String videoUrl;
 final  String imageUrl;
 final  String themeType;
 final  int themeOrgId;

/// Create a copy of CreateFromTemplateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitCopyWith<_Init> get copyWith => __$InitCopyWithImpl<_Init>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.title, title) || other.title == title)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.themeType, themeType) || other.themeType == themeType)&&(identical(other.themeOrgId, themeOrgId) || other.themeOrgId == themeOrgId));
}


@override
int get hashCode => Object.hash(runtimeType,templateId,title,videoUrl,imageUrl,themeType,themeOrgId);

@override
String toString() {
  return 'CreateFromTemplateEvent.init(templateId: $templateId, title: $title, videoUrl: $videoUrl, imageUrl: $imageUrl, themeType: $themeType, themeOrgId: $themeOrgId)';
}


}

/// @nodoc
abstract mixin class _$InitCopyWith<$Res> implements $CreateFromTemplateEventCopyWith<$Res> {
  factory _$InitCopyWith(_Init value, $Res Function(_Init) _then) = __$InitCopyWithImpl;
@useResult
$Res call({
 String templateId, String title, String videoUrl, String imageUrl, String themeType, int themeOrgId
});




}
/// @nodoc
class __$InitCopyWithImpl<$Res>
    implements _$InitCopyWith<$Res> {
  __$InitCopyWithImpl(this._self, this._then);

  final _Init _self;
  final $Res Function(_Init) _then;

/// Create a copy of CreateFromTemplateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? templateId = null,Object? title = null,Object? videoUrl = null,Object? imageUrl = null,Object? themeType = null,Object? themeOrgId = null,}) {
  return _then(_Init(
templateId: null == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,themeType: null == themeType ? _self.themeType : themeType // ignore: cast_nullable_to_non_nullable
as String,themeOrgId: null == themeOrgId ? _self.themeOrgId : themeOrgId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SelectPhoto implements CreateFromTemplateEvent {
  const _SelectPhoto(this.path);
  

 final  String path;

/// Create a copy of CreateFromTemplateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectPhotoCopyWith<_SelectPhoto> get copyWith => __$SelectPhotoCopyWithImpl<_SelectPhoto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectPhoto&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'CreateFromTemplateEvent.selectPhoto(path: $path)';
}


}

/// @nodoc
abstract mixin class _$SelectPhotoCopyWith<$Res> implements $CreateFromTemplateEventCopyWith<$Res> {
  factory _$SelectPhotoCopyWith(_SelectPhoto value, $Res Function(_SelectPhoto) _then) = __$SelectPhotoCopyWithImpl;
@useResult
$Res call({
 String path
});




}
/// @nodoc
class __$SelectPhotoCopyWithImpl<$Res>
    implements _$SelectPhotoCopyWith<$Res> {
  __$SelectPhotoCopyWithImpl(this._self, this._then);

  final _SelectPhoto _self;
  final $Res Function(_SelectPhoto) _then;

/// Create a copy of CreateFromTemplateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(_SelectPhoto(
null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RemovePhoto implements CreateFromTemplateEvent {
  const _RemovePhoto();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemovePhoto);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateFromTemplateEvent.removePhoto()';
}


}




/// @nodoc


class _SelectQuality implements CreateFromTemplateEvent {
  const _SelectQuality(this.quality);
  

 final  String quality;

/// Create a copy of CreateFromTemplateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectQualityCopyWith<_SelectQuality> get copyWith => __$SelectQualityCopyWithImpl<_SelectQuality>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectQuality&&(identical(other.quality, quality) || other.quality == quality));
}


@override
int get hashCode => Object.hash(runtimeType,quality);

@override
String toString() {
  return 'CreateFromTemplateEvent.selectQuality(quality: $quality)';
}


}

/// @nodoc
abstract mixin class _$SelectQualityCopyWith<$Res> implements $CreateFromTemplateEventCopyWith<$Res> {
  factory _$SelectQualityCopyWith(_SelectQuality value, $Res Function(_SelectQuality) _then) = __$SelectQualityCopyWithImpl;
@useResult
$Res call({
 String quality
});




}
/// @nodoc
class __$SelectQualityCopyWithImpl<$Res>
    implements _$SelectQualityCopyWith<$Res> {
  __$SelectQualityCopyWithImpl(this._self, this._then);

  final _SelectQuality _self;
  final $Res Function(_SelectQuality) _then;

/// Create a copy of CreateFromTemplateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quality = null,}) {
  return _then(_SelectQuality(
null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SelectDuration implements CreateFromTemplateEvent {
  const _SelectDuration(this.duration);
  

 final  String duration;

/// Create a copy of CreateFromTemplateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectDurationCopyWith<_SelectDuration> get copyWith => __$SelectDurationCopyWithImpl<_SelectDuration>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectDuration&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'CreateFromTemplateEvent.selectDuration(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$SelectDurationCopyWith<$Res> implements $CreateFromTemplateEventCopyWith<$Res> {
  factory _$SelectDurationCopyWith(_SelectDuration value, $Res Function(_SelectDuration) _then) = __$SelectDurationCopyWithImpl;
@useResult
$Res call({
 String duration
});




}
/// @nodoc
class __$SelectDurationCopyWithImpl<$Res>
    implements _$SelectDurationCopyWith<$Res> {
  __$SelectDurationCopyWithImpl(this._self, this._then);

  final _SelectDuration _self;
  final $Res Function(_SelectDuration) _then;

/// Create a copy of CreateFromTemplateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_SelectDuration(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StartGenerating implements CreateFromTemplateEvent {
  const _StartGenerating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartGenerating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateFromTemplateEvent.startGenerating()';
}


}




/// @nodoc


class _ToggleLike implements CreateFromTemplateEvent {
  const _ToggleLike();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleLike);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateFromTemplateEvent.toggleLike()';
}


}




// dart format on
