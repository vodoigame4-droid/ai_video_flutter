// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeveloperState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeveloperState()';
}


}

/// @nodoc
class $DeveloperStateCopyWith<$Res>  {
$DeveloperStateCopyWith(DeveloperState _, $Res Function(DeveloperState) __);
}


/// Adds pattern-matching-related methods to [DeveloperState].
extension DeveloperStatePatterns on DeveloperState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Update value)?  update,TResult Function( _ReviewerSuccess value)?  reviewerSuccess,TResult Function( _ReviewerFailure value)?  reviewerFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Update() when update != null:
return update(_that);case _ReviewerSuccess() when reviewerSuccess != null:
return reviewerSuccess(_that);case _ReviewerFailure() when reviewerFailure != null:
return reviewerFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Update value)  update,required TResult Function( _ReviewerSuccess value)  reviewerSuccess,required TResult Function( _ReviewerFailure value)  reviewerFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Update():
return update(_that);case _ReviewerSuccess():
return reviewerSuccess(_that);case _ReviewerFailure():
return reviewerFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Update value)?  update,TResult? Function( _ReviewerSuccess value)?  reviewerSuccess,TResult? Function( _ReviewerFailure value)?  reviewerFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Update() when update != null:
return update(_that);case _ReviewerSuccess() when reviewerSuccess != null:
return reviewerSuccess(_that);case _ReviewerFailure() when reviewerFailure != null:
return reviewerFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( int tapCount,  bool navigateToDebug)?  update,TResult Function()?  reviewerSuccess,TResult Function( String message)?  reviewerFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Update() when update != null:
return update(_that.tapCount,_that.navigateToDebug);case _ReviewerSuccess() when reviewerSuccess != null:
return reviewerSuccess();case _ReviewerFailure() when reviewerFailure != null:
return reviewerFailure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( int tapCount,  bool navigateToDebug)  update,required TResult Function()  reviewerSuccess,required TResult Function( String message)  reviewerFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Update():
return update(_that.tapCount,_that.navigateToDebug);case _ReviewerSuccess():
return reviewerSuccess();case _ReviewerFailure():
return reviewerFailure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( int tapCount,  bool navigateToDebug)?  update,TResult? Function()?  reviewerSuccess,TResult? Function( String message)?  reviewerFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Update() when update != null:
return update(_that.tapCount,_that.navigateToDebug);case _ReviewerSuccess() when reviewerSuccess != null:
return reviewerSuccess();case _ReviewerFailure() when reviewerFailure != null:
return reviewerFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DeveloperState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeveloperState.initial()';
}


}




/// @nodoc


class _Loading implements DeveloperState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeveloperState.loading()';
}


}




/// @nodoc


class _Update implements DeveloperState {
  const _Update({required this.tapCount, required this.navigateToDebug});
  

 final  int tapCount;
 final  bool navigateToDebug;

/// Create a copy of DeveloperState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.tapCount, tapCount) || other.tapCount == tapCount)&&(identical(other.navigateToDebug, navigateToDebug) || other.navigateToDebug == navigateToDebug));
}


@override
int get hashCode => Object.hash(runtimeType,tapCount,navigateToDebug);

@override
String toString() {
  return 'DeveloperState.update(tapCount: $tapCount, navigateToDebug: $navigateToDebug)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $DeveloperStateCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 int tapCount, bool navigateToDebug
});




}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of DeveloperState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tapCount = null,Object? navigateToDebug = null,}) {
  return _then(_Update(
tapCount: null == tapCount ? _self.tapCount : tapCount // ignore: cast_nullable_to_non_nullable
as int,navigateToDebug: null == navigateToDebug ? _self.navigateToDebug : navigateToDebug // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ReviewerSuccess implements DeveloperState {
  const _ReviewerSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewerSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeveloperState.reviewerSuccess()';
}


}




/// @nodoc


class _ReviewerFailure implements DeveloperState {
  const _ReviewerFailure({required this.message});
  

 final  String message;

/// Create a copy of DeveloperState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewerFailureCopyWith<_ReviewerFailure> get copyWith => __$ReviewerFailureCopyWithImpl<_ReviewerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewerFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DeveloperState.reviewerFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ReviewerFailureCopyWith<$Res> implements $DeveloperStateCopyWith<$Res> {
  factory _$ReviewerFailureCopyWith(_ReviewerFailure value, $Res Function(_ReviewerFailure) _then) = __$ReviewerFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ReviewerFailureCopyWithImpl<$Res>
    implements _$ReviewerFailureCopyWith<$Res> {
  __$ReviewerFailureCopyWithImpl(this._self, this._then);

  final _ReviewerFailure _self;
  final $Res Function(_ReviewerFailure) _then;

/// Create a copy of DeveloperState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ReviewerFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
