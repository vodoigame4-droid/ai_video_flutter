// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_video_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateVideoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateVideoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateVideoState()';
}


}

/// @nodoc
class $CreateVideoStateCopyWith<$Res>  {
$CreateVideoStateCopyWith(CreateVideoState _, $Res Function(CreateVideoState) __);
}


/// Adds pattern-matching-related methods to [CreateVideoState].
extension CreateVideoStatePatterns on CreateVideoState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( int selectedTab,  String customPrompt,  int inspireMeCount,  List<String?> slotsPaths,  String quality,  String duration,  bool isGenerating,  bool isSuccess)?  ready,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.selectedTab,_that.customPrompt,_that.inspireMeCount,_that.slotsPaths,_that.quality,_that.duration,_that.isGenerating,_that.isSuccess);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( int selectedTab,  String customPrompt,  int inspireMeCount,  List<String?> slotsPaths,  String quality,  String duration,  bool isGenerating,  bool isSuccess)  ready,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Ready():
return ready(_that.selectedTab,_that.customPrompt,_that.inspireMeCount,_that.slotsPaths,_that.quality,_that.duration,_that.isGenerating,_that.isSuccess);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( int selectedTab,  String customPrompt,  int inspireMeCount,  List<String?> slotsPaths,  String quality,  String duration,  bool isGenerating,  bool isSuccess)?  ready,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.selectedTab,_that.customPrompt,_that.inspireMeCount,_that.slotsPaths,_that.quality,_that.duration,_that.isGenerating,_that.isSuccess);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CreateVideoState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateVideoState.initial()';
}


}




/// @nodoc


class _Loading implements CreateVideoState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateVideoState.loading()';
}


}




/// @nodoc


class _Ready implements CreateVideoState {
  const _Ready({required this.selectedTab, required this.customPrompt, required this.inspireMeCount, required final  List<String?> slotsPaths, required this.quality, required this.duration, required this.isGenerating, this.isSuccess = false}): _slotsPaths = slotsPaths;
  

 final  int selectedTab;
 final  String customPrompt;
 final  int inspireMeCount;
 final  List<String?> _slotsPaths;
 List<String?> get slotsPaths {
  if (_slotsPaths is EqualUnmodifiableListView) return _slotsPaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slotsPaths);
}

 final  String quality;
 final  String duration;
 final  bool isGenerating;
@JsonKey() final  bool isSuccess;

/// Create a copy of CreateVideoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.customPrompt, customPrompt) || other.customPrompt == customPrompt)&&(identical(other.inspireMeCount, inspireMeCount) || other.inspireMeCount == inspireMeCount)&&const DeepCollectionEquality().equals(other._slotsPaths, _slotsPaths)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isGenerating, isGenerating) || other.isGenerating == isGenerating)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,customPrompt,inspireMeCount,const DeepCollectionEquality().hash(_slotsPaths),quality,duration,isGenerating,isSuccess);

@override
String toString() {
  return 'CreateVideoState.ready(selectedTab: $selectedTab, customPrompt: $customPrompt, inspireMeCount: $inspireMeCount, slotsPaths: $slotsPaths, quality: $quality, duration: $duration, isGenerating: $isGenerating, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $CreateVideoStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 int selectedTab, String customPrompt, int inspireMeCount, List<String?> slotsPaths, String quality, String duration, bool isGenerating, bool isSuccess
});




}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of CreateVideoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,Object? customPrompt = null,Object? inspireMeCount = null,Object? slotsPaths = null,Object? quality = null,Object? duration = null,Object? isGenerating = null,Object? isSuccess = null,}) {
  return _then(_Ready(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as int,customPrompt: null == customPrompt ? _self.customPrompt : customPrompt // ignore: cast_nullable_to_non_nullable
as String,inspireMeCount: null == inspireMeCount ? _self.inspireMeCount : inspireMeCount // ignore: cast_nullable_to_non_nullable
as int,slotsPaths: null == slotsPaths ? _self._slotsPaths : slotsPaths // ignore: cast_nullable_to_non_nullable
as List<String?>,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,isGenerating: null == isGenerating ? _self.isGenerating : isGenerating // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Error implements CreateVideoState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of CreateVideoState
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
  return 'CreateVideoState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CreateVideoStateCopyWith<$Res> {
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

/// Create a copy of CreateVideoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
