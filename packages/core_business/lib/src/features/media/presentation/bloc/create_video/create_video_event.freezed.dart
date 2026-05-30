// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_video_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateVideoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateVideoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateVideoEvent()';
}


}

/// @nodoc
class $CreateVideoEventCopyWith<$Res>  {
$CreateVideoEventCopyWith(CreateVideoEvent _, $Res Function(CreateVideoEvent) __);
}


/// Adds pattern-matching-related methods to [CreateVideoEvent].
extension CreateVideoEventPatterns on CreateVideoEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _ChangeTab value)?  changeTab,TResult Function( _UpdatePrompt value)?  updatePrompt,TResult Function( _InspireMe value)?  inspireMe,TResult Function( _ClearPrompt value)?  clearPrompt,TResult Function( _SelectMedia value)?  selectMedia,TResult Function( _RemoveMedia value)?  removeMedia,TResult Function( _SelectQuality value)?  selectQuality,TResult Function( _SelectDuration value)?  selectDuration,TResult Function( _GenerateVideo value)?  generateVideo,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ChangeTab() when changeTab != null:
return changeTab(_that);case _UpdatePrompt() when updatePrompt != null:
return updatePrompt(_that);case _InspireMe() when inspireMe != null:
return inspireMe(_that);case _ClearPrompt() when clearPrompt != null:
return clearPrompt(_that);case _SelectMedia() when selectMedia != null:
return selectMedia(_that);case _RemoveMedia() when removeMedia != null:
return removeMedia(_that);case _SelectQuality() when selectQuality != null:
return selectQuality(_that);case _SelectDuration() when selectDuration != null:
return selectDuration(_that);case _GenerateVideo() when generateVideo != null:
return generateVideo(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _ChangeTab value)  changeTab,required TResult Function( _UpdatePrompt value)  updatePrompt,required TResult Function( _InspireMe value)  inspireMe,required TResult Function( _ClearPrompt value)  clearPrompt,required TResult Function( _SelectMedia value)  selectMedia,required TResult Function( _RemoveMedia value)  removeMedia,required TResult Function( _SelectQuality value)  selectQuality,required TResult Function( _SelectDuration value)  selectDuration,required TResult Function( _GenerateVideo value)  generateVideo,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _ChangeTab():
return changeTab(_that);case _UpdatePrompt():
return updatePrompt(_that);case _InspireMe():
return inspireMe(_that);case _ClearPrompt():
return clearPrompt(_that);case _SelectMedia():
return selectMedia(_that);case _RemoveMedia():
return removeMedia(_that);case _SelectQuality():
return selectQuality(_that);case _SelectDuration():
return selectDuration(_that);case _GenerateVideo():
return generateVideo(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _ChangeTab value)?  changeTab,TResult? Function( _UpdatePrompt value)?  updatePrompt,TResult? Function( _InspireMe value)?  inspireMe,TResult? Function( _ClearPrompt value)?  clearPrompt,TResult? Function( _SelectMedia value)?  selectMedia,TResult? Function( _RemoveMedia value)?  removeMedia,TResult? Function( _SelectQuality value)?  selectQuality,TResult? Function( _SelectDuration value)?  selectDuration,TResult? Function( _GenerateVideo value)?  generateVideo,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ChangeTab() when changeTab != null:
return changeTab(_that);case _UpdatePrompt() when updatePrompt != null:
return updatePrompt(_that);case _InspireMe() when inspireMe != null:
return inspireMe(_that);case _ClearPrompt() when clearPrompt != null:
return clearPrompt(_that);case _SelectMedia() when selectMedia != null:
return selectMedia(_that);case _RemoveMedia() when removeMedia != null:
return removeMedia(_that);case _SelectQuality() when selectQuality != null:
return selectQuality(_that);case _SelectDuration() when selectDuration != null:
return selectDuration(_that);case _GenerateVideo() when generateVideo != null:
return generateVideo(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int initialTab)?  init,TResult Function( int tabIndex)?  changeTab,TResult Function( String prompt)?  updatePrompt,TResult Function()?  inspireMe,TResult Function()?  clearPrompt,TResult Function( int slotIndex,  String mediaPath)?  selectMedia,TResult Function( int slotIndex)?  removeMedia,TResult Function( String quality)?  selectQuality,TResult Function( String duration)?  selectDuration,TResult Function()?  generateVideo,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.initialTab);case _ChangeTab() when changeTab != null:
return changeTab(_that.tabIndex);case _UpdatePrompt() when updatePrompt != null:
return updatePrompt(_that.prompt);case _InspireMe() when inspireMe != null:
return inspireMe();case _ClearPrompt() when clearPrompt != null:
return clearPrompt();case _SelectMedia() when selectMedia != null:
return selectMedia(_that.slotIndex,_that.mediaPath);case _RemoveMedia() when removeMedia != null:
return removeMedia(_that.slotIndex);case _SelectQuality() when selectQuality != null:
return selectQuality(_that.quality);case _SelectDuration() when selectDuration != null:
return selectDuration(_that.duration);case _GenerateVideo() when generateVideo != null:
return generateVideo();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int initialTab)  init,required TResult Function( int tabIndex)  changeTab,required TResult Function( String prompt)  updatePrompt,required TResult Function()  inspireMe,required TResult Function()  clearPrompt,required TResult Function( int slotIndex,  String mediaPath)  selectMedia,required TResult Function( int slotIndex)  removeMedia,required TResult Function( String quality)  selectQuality,required TResult Function( String duration)  selectDuration,required TResult Function()  generateVideo,}) {final _that = this;
switch (_that) {
case _Init():
return init(_that.initialTab);case _ChangeTab():
return changeTab(_that.tabIndex);case _UpdatePrompt():
return updatePrompt(_that.prompt);case _InspireMe():
return inspireMe();case _ClearPrompt():
return clearPrompt();case _SelectMedia():
return selectMedia(_that.slotIndex,_that.mediaPath);case _RemoveMedia():
return removeMedia(_that.slotIndex);case _SelectQuality():
return selectQuality(_that.quality);case _SelectDuration():
return selectDuration(_that.duration);case _GenerateVideo():
return generateVideo();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int initialTab)?  init,TResult? Function( int tabIndex)?  changeTab,TResult? Function( String prompt)?  updatePrompt,TResult? Function()?  inspireMe,TResult? Function()?  clearPrompt,TResult? Function( int slotIndex,  String mediaPath)?  selectMedia,TResult? Function( int slotIndex)?  removeMedia,TResult? Function( String quality)?  selectQuality,TResult? Function( String duration)?  selectDuration,TResult? Function()?  generateVideo,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.initialTab);case _ChangeTab() when changeTab != null:
return changeTab(_that.tabIndex);case _UpdatePrompt() when updatePrompt != null:
return updatePrompt(_that.prompt);case _InspireMe() when inspireMe != null:
return inspireMe();case _ClearPrompt() when clearPrompt != null:
return clearPrompt();case _SelectMedia() when selectMedia != null:
return selectMedia(_that.slotIndex,_that.mediaPath);case _RemoveMedia() when removeMedia != null:
return removeMedia(_that.slotIndex);case _SelectQuality() when selectQuality != null:
return selectQuality(_that.quality);case _SelectDuration() when selectDuration != null:
return selectDuration(_that.duration);case _GenerateVideo() when generateVideo != null:
return generateVideo();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements CreateVideoEvent {
  const _Init(this.initialTab);
  

 final  int initialTab;

/// Create a copy of CreateVideoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitCopyWith<_Init> get copyWith => __$InitCopyWithImpl<_Init>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init&&(identical(other.initialTab, initialTab) || other.initialTab == initialTab));
}


@override
int get hashCode => Object.hash(runtimeType,initialTab);

@override
String toString() {
  return 'CreateVideoEvent.init(initialTab: $initialTab)';
}


}

/// @nodoc
abstract mixin class _$InitCopyWith<$Res> implements $CreateVideoEventCopyWith<$Res> {
  factory _$InitCopyWith(_Init value, $Res Function(_Init) _then) = __$InitCopyWithImpl;
@useResult
$Res call({
 int initialTab
});




}
/// @nodoc
class __$InitCopyWithImpl<$Res>
    implements _$InitCopyWith<$Res> {
  __$InitCopyWithImpl(this._self, this._then);

  final _Init _self;
  final $Res Function(_Init) _then;

/// Create a copy of CreateVideoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? initialTab = null,}) {
  return _then(_Init(
null == initialTab ? _self.initialTab : initialTab // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ChangeTab implements CreateVideoEvent {
  const _ChangeTab(this.tabIndex);
  

 final  int tabIndex;

/// Create a copy of CreateVideoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeTabCopyWith<_ChangeTab> get copyWith => __$ChangeTabCopyWithImpl<_ChangeTab>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeTab&&(identical(other.tabIndex, tabIndex) || other.tabIndex == tabIndex));
}


@override
int get hashCode => Object.hash(runtimeType,tabIndex);

@override
String toString() {
  return 'CreateVideoEvent.changeTab(tabIndex: $tabIndex)';
}


}

/// @nodoc
abstract mixin class _$ChangeTabCopyWith<$Res> implements $CreateVideoEventCopyWith<$Res> {
  factory _$ChangeTabCopyWith(_ChangeTab value, $Res Function(_ChangeTab) _then) = __$ChangeTabCopyWithImpl;
@useResult
$Res call({
 int tabIndex
});




}
/// @nodoc
class __$ChangeTabCopyWithImpl<$Res>
    implements _$ChangeTabCopyWith<$Res> {
  __$ChangeTabCopyWithImpl(this._self, this._then);

  final _ChangeTab _self;
  final $Res Function(_ChangeTab) _then;

/// Create a copy of CreateVideoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tabIndex = null,}) {
  return _then(_ChangeTab(
null == tabIndex ? _self.tabIndex : tabIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdatePrompt implements CreateVideoEvent {
  const _UpdatePrompt(this.prompt);
  

 final  String prompt;

/// Create a copy of CreateVideoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePromptCopyWith<_UpdatePrompt> get copyWith => __$UpdatePromptCopyWithImpl<_UpdatePrompt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePrompt&&(identical(other.prompt, prompt) || other.prompt == prompt));
}


@override
int get hashCode => Object.hash(runtimeType,prompt);

@override
String toString() {
  return 'CreateVideoEvent.updatePrompt(prompt: $prompt)';
}


}

/// @nodoc
abstract mixin class _$UpdatePromptCopyWith<$Res> implements $CreateVideoEventCopyWith<$Res> {
  factory _$UpdatePromptCopyWith(_UpdatePrompt value, $Res Function(_UpdatePrompt) _then) = __$UpdatePromptCopyWithImpl;
@useResult
$Res call({
 String prompt
});




}
/// @nodoc
class __$UpdatePromptCopyWithImpl<$Res>
    implements _$UpdatePromptCopyWith<$Res> {
  __$UpdatePromptCopyWithImpl(this._self, this._then);

  final _UpdatePrompt _self;
  final $Res Function(_UpdatePrompt) _then;

/// Create a copy of CreateVideoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? prompt = null,}) {
  return _then(_UpdatePrompt(
null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _InspireMe implements CreateVideoEvent {
  const _InspireMe();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InspireMe);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateVideoEvent.inspireMe()';
}


}




/// @nodoc


class _ClearPrompt implements CreateVideoEvent {
  const _ClearPrompt();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearPrompt);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateVideoEvent.clearPrompt()';
}


}




/// @nodoc


class _SelectMedia implements CreateVideoEvent {
  const _SelectMedia(this.slotIndex, this.mediaPath);
  

 final  int slotIndex;
 final  String mediaPath;

/// Create a copy of CreateVideoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectMediaCopyWith<_SelectMedia> get copyWith => __$SelectMediaCopyWithImpl<_SelectMedia>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectMedia&&(identical(other.slotIndex, slotIndex) || other.slotIndex == slotIndex)&&(identical(other.mediaPath, mediaPath) || other.mediaPath == mediaPath));
}


@override
int get hashCode => Object.hash(runtimeType,slotIndex,mediaPath);

@override
String toString() {
  return 'CreateVideoEvent.selectMedia(slotIndex: $slotIndex, mediaPath: $mediaPath)';
}


}

/// @nodoc
abstract mixin class _$SelectMediaCopyWith<$Res> implements $CreateVideoEventCopyWith<$Res> {
  factory _$SelectMediaCopyWith(_SelectMedia value, $Res Function(_SelectMedia) _then) = __$SelectMediaCopyWithImpl;
@useResult
$Res call({
 int slotIndex, String mediaPath
});




}
/// @nodoc
class __$SelectMediaCopyWithImpl<$Res>
    implements _$SelectMediaCopyWith<$Res> {
  __$SelectMediaCopyWithImpl(this._self, this._then);

  final _SelectMedia _self;
  final $Res Function(_SelectMedia) _then;

/// Create a copy of CreateVideoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? slotIndex = null,Object? mediaPath = null,}) {
  return _then(_SelectMedia(
null == slotIndex ? _self.slotIndex : slotIndex // ignore: cast_nullable_to_non_nullable
as int,null == mediaPath ? _self.mediaPath : mediaPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RemoveMedia implements CreateVideoEvent {
  const _RemoveMedia(this.slotIndex);
  

 final  int slotIndex;

/// Create a copy of CreateVideoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveMediaCopyWith<_RemoveMedia> get copyWith => __$RemoveMediaCopyWithImpl<_RemoveMedia>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveMedia&&(identical(other.slotIndex, slotIndex) || other.slotIndex == slotIndex));
}


@override
int get hashCode => Object.hash(runtimeType,slotIndex);

@override
String toString() {
  return 'CreateVideoEvent.removeMedia(slotIndex: $slotIndex)';
}


}

/// @nodoc
abstract mixin class _$RemoveMediaCopyWith<$Res> implements $CreateVideoEventCopyWith<$Res> {
  factory _$RemoveMediaCopyWith(_RemoveMedia value, $Res Function(_RemoveMedia) _then) = __$RemoveMediaCopyWithImpl;
@useResult
$Res call({
 int slotIndex
});




}
/// @nodoc
class __$RemoveMediaCopyWithImpl<$Res>
    implements _$RemoveMediaCopyWith<$Res> {
  __$RemoveMediaCopyWithImpl(this._self, this._then);

  final _RemoveMedia _self;
  final $Res Function(_RemoveMedia) _then;

/// Create a copy of CreateVideoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? slotIndex = null,}) {
  return _then(_RemoveMedia(
null == slotIndex ? _self.slotIndex : slotIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SelectQuality implements CreateVideoEvent {
  const _SelectQuality(this.quality);
  

 final  String quality;

/// Create a copy of CreateVideoEvent
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
  return 'CreateVideoEvent.selectQuality(quality: $quality)';
}


}

/// @nodoc
abstract mixin class _$SelectQualityCopyWith<$Res> implements $CreateVideoEventCopyWith<$Res> {
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

/// Create a copy of CreateVideoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quality = null,}) {
  return _then(_SelectQuality(
null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SelectDuration implements CreateVideoEvent {
  const _SelectDuration(this.duration);
  

 final  String duration;

/// Create a copy of CreateVideoEvent
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
  return 'CreateVideoEvent.selectDuration(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$SelectDurationCopyWith<$Res> implements $CreateVideoEventCopyWith<$Res> {
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

/// Create a copy of CreateVideoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_SelectDuration(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _GenerateVideo implements CreateVideoEvent {
  const _GenerateVideo();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateVideo);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateVideoEvent.generateVideo()';
}


}




// dart format on
