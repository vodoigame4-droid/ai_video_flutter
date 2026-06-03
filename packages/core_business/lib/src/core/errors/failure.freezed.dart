// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NetworkFailure value)?  network,TResult Function( _TimeoutFailure value)?  timeout,TResult Function( _ServerFailure value)?  server,TResult Function( _UnauthorizedFailure value)?  unauthorized,TResult Function( _BusinessFailure value)?  business,TResult Function( _UnknownFailure value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkFailure() when network != null:
return network(_that);case _TimeoutFailure() when timeout != null:
return timeout(_that);case _ServerFailure() when server != null:
return server(_that);case _UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case _BusinessFailure() when business != null:
return business(_that);case _UnknownFailure() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NetworkFailure value)  network,required TResult Function( _TimeoutFailure value)  timeout,required TResult Function( _ServerFailure value)  server,required TResult Function( _UnauthorizedFailure value)  unauthorized,required TResult Function( _BusinessFailure value)  business,required TResult Function( _UnknownFailure value)  unknown,}){
final _that = this;
switch (_that) {
case _NetworkFailure():
return network(_that);case _TimeoutFailure():
return timeout(_that);case _ServerFailure():
return server(_that);case _UnauthorizedFailure():
return unauthorized(_that);case _BusinessFailure():
return business(_that);case _UnknownFailure():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NetworkFailure value)?  network,TResult? Function( _TimeoutFailure value)?  timeout,TResult? Function( _ServerFailure value)?  server,TResult? Function( _UnauthorizedFailure value)?  unauthorized,TResult? Function( _BusinessFailure value)?  business,TResult? Function( _UnknownFailure value)?  unknown,}){
final _that = this;
switch (_that) {
case _NetworkFailure() when network != null:
return network(_that);case _TimeoutFailure() when timeout != null:
return timeout(_that);case _ServerFailure() when server != null:
return server(_that);case _UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case _BusinessFailure() when business != null:
return business(_that);case _UnknownFailure() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  network,TResult Function()?  timeout,TResult Function( int statusCode,  String message)?  server,TResult Function()?  unauthorized,TResult Function( String code,  String message)?  business,TResult Function( String? message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkFailure() when network != null:
return network();case _TimeoutFailure() when timeout != null:
return timeout();case _ServerFailure() when server != null:
return server(_that.statusCode,_that.message);case _UnauthorizedFailure() when unauthorized != null:
return unauthorized();case _BusinessFailure() when business != null:
return business(_that.code,_that.message);case _UnknownFailure() when unknown != null:
return unknown(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  network,required TResult Function()  timeout,required TResult Function( int statusCode,  String message)  server,required TResult Function()  unauthorized,required TResult Function( String code,  String message)  business,required TResult Function( String? message)  unknown,}) {final _that = this;
switch (_that) {
case _NetworkFailure():
return network();case _TimeoutFailure():
return timeout();case _ServerFailure():
return server(_that.statusCode,_that.message);case _UnauthorizedFailure():
return unauthorized();case _BusinessFailure():
return business(_that.code,_that.message);case _UnknownFailure():
return unknown(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  network,TResult? Function()?  timeout,TResult? Function( int statusCode,  String message)?  server,TResult? Function()?  unauthorized,TResult? Function( String code,  String message)?  business,TResult? Function( String? message)?  unknown,}) {final _that = this;
switch (_that) {
case _NetworkFailure() when network != null:
return network();case _TimeoutFailure() when timeout != null:
return timeout();case _ServerFailure() when server != null:
return server(_that.statusCode,_that.message);case _UnauthorizedFailure() when unauthorized != null:
return unauthorized();case _BusinessFailure() when business != null:
return business(_that.code,_that.message);case _UnknownFailure() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _NetworkFailure implements Failure {
  const _NetworkFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.network()';
}


}




/// @nodoc


class _TimeoutFailure implements Failure {
  const _TimeoutFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeoutFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.timeout()';
}


}




/// @nodoc


class _ServerFailure implements Failure {
  const _ServerFailure({required this.statusCode, required this.message});
  

 final  int statusCode;
 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerFailureCopyWith<_ServerFailure> get copyWith => __$ServerFailureCopyWithImpl<_ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerFailure&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,statusCode,message);

@override
String toString() {
  return 'Failure.server(statusCode: $statusCode, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ServerFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$ServerFailureCopyWith(_ServerFailure value, $Res Function(_ServerFailure) _then) = __$ServerFailureCopyWithImpl;
@useResult
$Res call({
 int statusCode, String message
});




}
/// @nodoc
class __$ServerFailureCopyWithImpl<$Res>
    implements _$ServerFailureCopyWith<$Res> {
  __$ServerFailureCopyWithImpl(this._self, this._then);

  final _ServerFailure _self;
  final $Res Function(_ServerFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? message = null,}) {
  return _then(_ServerFailure(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UnauthorizedFailure implements Failure {
  const _UnauthorizedFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnauthorizedFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.unauthorized()';
}


}




/// @nodoc


class _BusinessFailure implements Failure {
  const _BusinessFailure({required this.code, required this.message});
  

 final  String code;
 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessFailureCopyWith<_BusinessFailure> get copyWith => __$BusinessFailureCopyWithImpl<_BusinessFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessFailure&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'Failure.business(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class _$BusinessFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$BusinessFailureCopyWith(_BusinessFailure value, $Res Function(_BusinessFailure) _then) = __$BusinessFailureCopyWithImpl;
@useResult
$Res call({
 String code, String message
});




}
/// @nodoc
class __$BusinessFailureCopyWithImpl<$Res>
    implements _$BusinessFailureCopyWith<$Res> {
  __$BusinessFailureCopyWithImpl(this._self, this._then);

  final _BusinessFailure _self;
  final $Res Function(_BusinessFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,}) {
  return _then(_BusinessFailure(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UnknownFailure implements Failure {
  const _UnknownFailure([this.message]);
  

 final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnknownFailureCopyWith<_UnknownFailure> get copyWith => __$UnknownFailureCopyWithImpl<_UnknownFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnknownFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnknownFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$UnknownFailureCopyWith(_UnknownFailure value, $Res Function(_UnknownFailure) _then) = __$UnknownFailureCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$UnknownFailureCopyWithImpl<$Res>
    implements _$UnknownFailureCopyWith<$Res> {
  __$UnknownFailureCopyWithImpl(this._self, this._then);

  final _UnknownFailure _self;
  final $Res Function(_UnknownFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_UnknownFailure(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
