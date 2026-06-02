// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_trim_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VideoTrimState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoTrimState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoTrimState()';
}


}

/// @nodoc
class $VideoTrimStateCopyWith<$Res>  {
$VideoTrimStateCopyWith(VideoTrimState _, $Res Function(VideoTrimState) __);
}


/// Adds pattern-matching-related methods to [VideoTrimState].
extension VideoTrimStatePatterns on VideoTrimState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Ready value)?  ready,TResult Function( _Saving value)?  saving,TResult Function( _SaveSuccess value)?  saveSuccess,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Ready() when ready != null:
return ready(_that);case _Saving() when saving != null:
return saving(_that);case _SaveSuccess() when saveSuccess != null:
return saveSuccess(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Ready value)  ready,required TResult Function( _Saving value)  saving,required TResult Function( _SaveSuccess value)  saveSuccess,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Ready():
return ready(_that);case _Saving():
return saving(_that);case _SaveSuccess():
return saveSuccess(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Ready value)?  ready,TResult? Function( _Saving value)?  saving,TResult? Function( _SaveSuccess value)?  saveSuccess,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Ready() when ready != null:
return ready(_that);case _Saving() when saving != null:
return saving(_that);case _SaveSuccess() when saveSuccess != null:
return saveSuccess(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( bool isPlaying,  double startValue,  double endValue)?  ready,TResult Function()?  saving,TResult Function( String outputPath)?  saveSuccess,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.isPlaying,_that.startValue,_that.endValue);case _Saving() when saving != null:
return saving();case _SaveSuccess() when saveSuccess != null:
return saveSuccess(_that.outputPath);case _Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( bool isPlaying,  double startValue,  double endValue)  ready,required TResult Function()  saving,required TResult Function( String outputPath)  saveSuccess,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Ready():
return ready(_that.isPlaying,_that.startValue,_that.endValue);case _Saving():
return saving();case _SaveSuccess():
return saveSuccess(_that.outputPath);case _Failure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( bool isPlaying,  double startValue,  double endValue)?  ready,TResult? Function()?  saving,TResult? Function( String outputPath)?  saveSuccess,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.isPlaying,_that.startValue,_that.endValue);case _Saving() when saving != null:
return saving();case _SaveSuccess() when saveSuccess != null:
return saveSuccess(_that.outputPath);case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements VideoTrimState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoTrimState.initial()';
}


}




/// @nodoc


class _Loading implements VideoTrimState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoTrimState.loading()';
}


}




/// @nodoc


class _Ready implements VideoTrimState {
  const _Ready({required this.isPlaying, required this.startValue, required this.endValue});
  

 final  bool isPlaying;
 final  double startValue;
 final  double endValue;

/// Create a copy of VideoTrimState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.startValue, startValue) || other.startValue == startValue)&&(identical(other.endValue, endValue) || other.endValue == endValue));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying,startValue,endValue);

@override
String toString() {
  return 'VideoTrimState.ready(isPlaying: $isPlaying, startValue: $startValue, endValue: $endValue)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $VideoTrimStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 bool isPlaying, double startValue, double endValue
});




}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of VideoTrimState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPlaying = null,Object? startValue = null,Object? endValue = null,}) {
  return _then(_Ready(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,startValue: null == startValue ? _self.startValue : startValue // ignore: cast_nullable_to_non_nullable
as double,endValue: null == endValue ? _self.endValue : endValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Saving implements VideoTrimState {
  const _Saving();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Saving);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoTrimState.saving()';
}


}




/// @nodoc


class _SaveSuccess implements VideoTrimState {
  const _SaveSuccess({required this.outputPath});
  

 final  String outputPath;

/// Create a copy of VideoTrimState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveSuccessCopyWith<_SaveSuccess> get copyWith => __$SaveSuccessCopyWithImpl<_SaveSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveSuccess&&(identical(other.outputPath, outputPath) || other.outputPath == outputPath));
}


@override
int get hashCode => Object.hash(runtimeType,outputPath);

@override
String toString() {
  return 'VideoTrimState.saveSuccess(outputPath: $outputPath)';
}


}

/// @nodoc
abstract mixin class _$SaveSuccessCopyWith<$Res> implements $VideoTrimStateCopyWith<$Res> {
  factory _$SaveSuccessCopyWith(_SaveSuccess value, $Res Function(_SaveSuccess) _then) = __$SaveSuccessCopyWithImpl;
@useResult
$Res call({
 String outputPath
});




}
/// @nodoc
class __$SaveSuccessCopyWithImpl<$Res>
    implements _$SaveSuccessCopyWith<$Res> {
  __$SaveSuccessCopyWithImpl(this._self, this._then);

  final _SaveSuccess _self;
  final $Res Function(_SaveSuccess) _then;

/// Create a copy of VideoTrimState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? outputPath = null,}) {
  return _then(_SaveSuccess(
outputPath: null == outputPath ? _self.outputPath : outputPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Failure implements VideoTrimState {
  const _Failure({required this.message});
  

 final  String message;

/// Create a copy of VideoTrimState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VideoTrimState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $VideoTrimStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of VideoTrimState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
