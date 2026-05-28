// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buy_credits_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BuyCreditsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyCreditsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BuyCreditsState()';
}


}

/// @nodoc
class $BuyCreditsStateCopyWith<$Res>  {
$BuyCreditsStateCopyWith(BuyCreditsState _, $Res Function(BuyCreditsState) __);
}


/// Adds pattern-matching-related methods to [BuyCreditsState].
extension BuyCreditsStatePatterns on BuyCreditsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Ready value)?  ready,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Ready() when ready != null:
return ready(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Ready value)  ready,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Ready():
return ready(_that);case _Success():
return success(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Ready value)?  ready,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Ready() when ready != null:
return ready(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( bool isVideoRevealed)?  ready,TResult Function( String message,  bool isVideoRevealed)?  success,TResult Function( String message,  bool isVideoRevealed)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.isVideoRevealed);case _Success() when success != null:
return success(_that.message,_that.isVideoRevealed);case _Error() when error != null:
return error(_that.message,_that.isVideoRevealed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( bool isVideoRevealed)  ready,required TResult Function( String message,  bool isVideoRevealed)  success,required TResult Function( String message,  bool isVideoRevealed)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Ready():
return ready(_that.isVideoRevealed);case _Success():
return success(_that.message,_that.isVideoRevealed);case _Error():
return error(_that.message,_that.isVideoRevealed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( bool isVideoRevealed)?  ready,TResult? Function( String message,  bool isVideoRevealed)?  success,TResult? Function( String message,  bool isVideoRevealed)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.isVideoRevealed);case _Success() when success != null:
return success(_that.message,_that.isVideoRevealed);case _Error() when error != null:
return error(_that.message,_that.isVideoRevealed);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements BuyCreditsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BuyCreditsState.initial()';
}


}




/// @nodoc


class _Loading implements BuyCreditsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BuyCreditsState.loading()';
}


}




/// @nodoc


class _Ready implements BuyCreditsState {
  const _Ready({required this.isVideoRevealed});
  

 final  bool isVideoRevealed;

/// Create a copy of BuyCreditsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&(identical(other.isVideoRevealed, isVideoRevealed) || other.isVideoRevealed == isVideoRevealed));
}


@override
int get hashCode => Object.hash(runtimeType,isVideoRevealed);

@override
String toString() {
  return 'BuyCreditsState.ready(isVideoRevealed: $isVideoRevealed)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $BuyCreditsStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 bool isVideoRevealed
});




}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of BuyCreditsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isVideoRevealed = null,}) {
  return _then(_Ready(
isVideoRevealed: null == isVideoRevealed ? _self.isVideoRevealed : isVideoRevealed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Success implements BuyCreditsState {
  const _Success({required this.message, required this.isVideoRevealed});
  

 final  String message;
 final  bool isVideoRevealed;

/// Create a copy of BuyCreditsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.message, message) || other.message == message)&&(identical(other.isVideoRevealed, isVideoRevealed) || other.isVideoRevealed == isVideoRevealed));
}


@override
int get hashCode => Object.hash(runtimeType,message,isVideoRevealed);

@override
String toString() {
  return 'BuyCreditsState.success(message: $message, isVideoRevealed: $isVideoRevealed)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $BuyCreditsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 String message, bool isVideoRevealed
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of BuyCreditsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? isVideoRevealed = null,}) {
  return _then(_Success(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isVideoRevealed: null == isVideoRevealed ? _self.isVideoRevealed : isVideoRevealed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Error implements BuyCreditsState {
  const _Error({required this.message, required this.isVideoRevealed});
  

 final  String message;
 final  bool isVideoRevealed;

/// Create a copy of BuyCreditsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message)&&(identical(other.isVideoRevealed, isVideoRevealed) || other.isVideoRevealed == isVideoRevealed));
}


@override
int get hashCode => Object.hash(runtimeType,message,isVideoRevealed);

@override
String toString() {
  return 'BuyCreditsState.error(message: $message, isVideoRevealed: $isVideoRevealed)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $BuyCreditsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message, bool isVideoRevealed
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of BuyCreditsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? isVideoRevealed = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isVideoRevealed: null == isVideoRevealed ? _self.isVideoRevealed : isVideoRevealed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
