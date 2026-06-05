// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _ChangeSubTab value)?  changeSubTab,TResult Function( _DeleteVideo value)?  deleteVideo,TResult Function( _WatchLikedTemplates value)?  watchLikedTemplates,TResult Function( _WatchHistory value)?  watchHistory,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ChangeSubTab() when changeSubTab != null:
return changeSubTab(_that);case _DeleteVideo() when deleteVideo != null:
return deleteVideo(_that);case _WatchLikedTemplates() when watchLikedTemplates != null:
return watchLikedTemplates(_that);case _WatchHistory() when watchHistory != null:
return watchHistory(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _ChangeSubTab value)  changeSubTab,required TResult Function( _DeleteVideo value)  deleteVideo,required TResult Function( _WatchLikedTemplates value)  watchLikedTemplates,required TResult Function( _WatchHistory value)  watchHistory,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _ChangeSubTab():
return changeSubTab(_that);case _DeleteVideo():
return deleteVideo(_that);case _WatchLikedTemplates():
return watchLikedTemplates(_that);case _WatchHistory():
return watchHistory(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _ChangeSubTab value)?  changeSubTab,TResult? Function( _DeleteVideo value)?  deleteVideo,TResult? Function( _WatchLikedTemplates value)?  watchLikedTemplates,TResult? Function( _WatchHistory value)?  watchHistory,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ChangeSubTab() when changeSubTab != null:
return changeSubTab(_that);case _DeleteVideo() when deleteVideo != null:
return deleteVideo(_that);case _WatchLikedTemplates() when watchLikedTemplates != null:
return watchLikedTemplates(_that);case _WatchHistory() when watchHistory != null:
return watchHistory(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Completer<void>? completer)?  init,TResult Function( int subTabIndex)?  changeSubTab,TResult Function( String id)?  deleteVideo,TResult Function()?  watchLikedTemplates,TResult Function()?  watchHistory,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.completer);case _ChangeSubTab() when changeSubTab != null:
return changeSubTab(_that.subTabIndex);case _DeleteVideo() when deleteVideo != null:
return deleteVideo(_that.id);case _WatchLikedTemplates() when watchLikedTemplates != null:
return watchLikedTemplates();case _WatchHistory() when watchHistory != null:
return watchHistory();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Completer<void>? completer)  init,required TResult Function( int subTabIndex)  changeSubTab,required TResult Function( String id)  deleteVideo,required TResult Function()  watchLikedTemplates,required TResult Function()  watchHistory,}) {final _that = this;
switch (_that) {
case _Init():
return init(_that.completer);case _ChangeSubTab():
return changeSubTab(_that.subTabIndex);case _DeleteVideo():
return deleteVideo(_that.id);case _WatchLikedTemplates():
return watchLikedTemplates();case _WatchHistory():
return watchHistory();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Completer<void>? completer)?  init,TResult? Function( int subTabIndex)?  changeSubTab,TResult? Function( String id)?  deleteVideo,TResult? Function()?  watchLikedTemplates,TResult? Function()?  watchHistory,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.completer);case _ChangeSubTab() when changeSubTab != null:
return changeSubTab(_that.subTabIndex);case _DeleteVideo() when deleteVideo != null:
return deleteVideo(_that.id);case _WatchLikedTemplates() when watchLikedTemplates != null:
return watchLikedTemplates();case _WatchHistory() when watchHistory != null:
return watchHistory();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements ProfileEvent {
  const _Init([this.completer]);
  

 final  Completer<void>? completer;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitCopyWith<_Init> get copyWith => __$InitCopyWithImpl<_Init>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init&&(identical(other.completer, completer) || other.completer == completer));
}


@override
int get hashCode => Object.hash(runtimeType,completer);

@override
String toString() {
  return 'ProfileEvent.init(completer: $completer)';
}


}

/// @nodoc
abstract mixin class _$InitCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$InitCopyWith(_Init value, $Res Function(_Init) _then) = __$InitCopyWithImpl;
@useResult
$Res call({
 Completer<void>? completer
});




}
/// @nodoc
class __$InitCopyWithImpl<$Res>
    implements _$InitCopyWith<$Res> {
  __$InitCopyWithImpl(this._self, this._then);

  final _Init _self;
  final $Res Function(_Init) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? completer = freezed,}) {
  return _then(_Init(
freezed == completer ? _self.completer : completer // ignore: cast_nullable_to_non_nullable
as Completer<void>?,
  ));
}


}

/// @nodoc


class _ChangeSubTab implements ProfileEvent {
  const _ChangeSubTab(this.subTabIndex);
  

 final  int subTabIndex;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeSubTabCopyWith<_ChangeSubTab> get copyWith => __$ChangeSubTabCopyWithImpl<_ChangeSubTab>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeSubTab&&(identical(other.subTabIndex, subTabIndex) || other.subTabIndex == subTabIndex));
}


@override
int get hashCode => Object.hash(runtimeType,subTabIndex);

@override
String toString() {
  return 'ProfileEvent.changeSubTab(subTabIndex: $subTabIndex)';
}


}

/// @nodoc
abstract mixin class _$ChangeSubTabCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$ChangeSubTabCopyWith(_ChangeSubTab value, $Res Function(_ChangeSubTab) _then) = __$ChangeSubTabCopyWithImpl;
@useResult
$Res call({
 int subTabIndex
});




}
/// @nodoc
class __$ChangeSubTabCopyWithImpl<$Res>
    implements _$ChangeSubTabCopyWith<$Res> {
  __$ChangeSubTabCopyWithImpl(this._self, this._then);

  final _ChangeSubTab _self;
  final $Res Function(_ChangeSubTab) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? subTabIndex = null,}) {
  return _then(_ChangeSubTab(
null == subTabIndex ? _self.subTabIndex : subTabIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DeleteVideo implements ProfileEvent {
  const _DeleteVideo(this.id);
  

 final  String id;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteVideoCopyWith<_DeleteVideo> get copyWith => __$DeleteVideoCopyWithImpl<_DeleteVideo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteVideo&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProfileEvent.deleteVideo(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteVideoCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$DeleteVideoCopyWith(_DeleteVideo value, $Res Function(_DeleteVideo) _then) = __$DeleteVideoCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeleteVideoCopyWithImpl<$Res>
    implements _$DeleteVideoCopyWith<$Res> {
  __$DeleteVideoCopyWithImpl(this._self, this._then);

  final _DeleteVideo _self;
  final $Res Function(_DeleteVideo) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteVideo(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _WatchLikedTemplates implements ProfileEvent {
  const _WatchLikedTemplates();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchLikedTemplates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.watchLikedTemplates()';
}


}




/// @nodoc


class _WatchHistory implements ProfileEvent {
  const _WatchHistory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchHistory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.watchHistory()';
}


}




// dart format on
