// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginRequestModel {

 String get deviceId; String get app; String get appVersion; String? get refCode; String get appType;
/// Create a copy of LoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestModelCopyWith<LoginRequestModel> get copyWith => _$LoginRequestModelCopyWithImpl<LoginRequestModel>(this as LoginRequestModel, _$identity);

  /// Serializes this LoginRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequestModel&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.app, app) || other.app == app)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.refCode, refCode) || other.refCode == refCode)&&(identical(other.appType, appType) || other.appType == appType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId,app,appVersion,refCode,appType);

@override
String toString() {
  return 'LoginRequestModel(deviceId: $deviceId, app: $app, appVersion: $appVersion, refCode: $refCode, appType: $appType)';
}


}

/// @nodoc
abstract mixin class $LoginRequestModelCopyWith<$Res>  {
  factory $LoginRequestModelCopyWith(LoginRequestModel value, $Res Function(LoginRequestModel) _then) = _$LoginRequestModelCopyWithImpl;
@useResult
$Res call({
 String deviceId, String app, String appVersion, String? refCode, String appType
});




}
/// @nodoc
class _$LoginRequestModelCopyWithImpl<$Res>
    implements $LoginRequestModelCopyWith<$Res> {
  _$LoginRequestModelCopyWithImpl(this._self, this._then);

  final LoginRequestModel _self;
  final $Res Function(LoginRequestModel) _then;

/// Create a copy of LoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,Object? app = null,Object? appVersion = null,Object? refCode = freezed,Object? appType = null,}) {
  return _then(_self.copyWith(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,app: null == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,refCode: freezed == refCode ? _self.refCode : refCode // ignore: cast_nullable_to_non_nullable
as String?,appType: null == appType ? _self.appType : appType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginRequestModel].
extension LoginRequestModelPatterns on LoginRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginRequestModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _LoginRequestModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _LoginRequestModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceId,  String app,  String appVersion,  String? refCode,  String appType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginRequestModel() when $default != null:
return $default(_that.deviceId,_that.app,_that.appVersion,_that.refCode,_that.appType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceId,  String app,  String appVersion,  String? refCode,  String appType)  $default,) {final _that = this;
switch (_that) {
case _LoginRequestModel():
return $default(_that.deviceId,_that.app,_that.appVersion,_that.refCode,_that.appType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceId,  String app,  String appVersion,  String? refCode,  String appType)?  $default,) {final _that = this;
switch (_that) {
case _LoginRequestModel() when $default != null:
return $default(_that.deviceId,_that.app,_that.appVersion,_that.refCode,_that.appType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginRequestModel implements LoginRequestModel {
  const _LoginRequestModel({required this.deviceId, required this.app, required this.appVersion, required this.refCode, required this.appType});
  factory _LoginRequestModel.fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);

@override final  String deviceId;
@override final  String app;
@override final  String appVersion;
@override final  String? refCode;
@override final  String appType;

/// Create a copy of LoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRequestModelCopyWith<_LoginRequestModel> get copyWith => __$LoginRequestModelCopyWithImpl<_LoginRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRequestModel&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.app, app) || other.app == app)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.refCode, refCode) || other.refCode == refCode)&&(identical(other.appType, appType) || other.appType == appType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId,app,appVersion,refCode,appType);

@override
String toString() {
  return 'LoginRequestModel(deviceId: $deviceId, app: $app, appVersion: $appVersion, refCode: $refCode, appType: $appType)';
}


}

/// @nodoc
abstract mixin class _$LoginRequestModelCopyWith<$Res> implements $LoginRequestModelCopyWith<$Res> {
  factory _$LoginRequestModelCopyWith(_LoginRequestModel value, $Res Function(_LoginRequestModel) _then) = __$LoginRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String deviceId, String app, String appVersion, String? refCode, String appType
});




}
/// @nodoc
class __$LoginRequestModelCopyWithImpl<$Res>
    implements _$LoginRequestModelCopyWith<$Res> {
  __$LoginRequestModelCopyWithImpl(this._self, this._then);

  final _LoginRequestModel _self;
  final $Res Function(_LoginRequestModel) _then;

/// Create a copy of LoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,Object? app = null,Object? appVersion = null,Object? refCode = freezed,Object? appType = null,}) {
  return _then(_LoginRequestModel(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,app: null == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,refCode: freezed == refCode ? _self.refCode : refCode // ignore: cast_nullable_to_non_nullable
as String?,appType: null == appType ? _self.appType : appType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LoginResponseModel {

 String get accessToken; int get tokenExpires; String get refreshToken; int get refreshTokenExpires; UserModel get user;
/// Create a copy of LoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseModelCopyWith<LoginResponseModel> get copyWith => _$LoginResponseModelCopyWithImpl<LoginResponseModel>(this as LoginResponseModel, _$identity);

  /// Serializes this LoginResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponseModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenExpires, tokenExpires) || other.tokenExpires == tokenExpires)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.refreshTokenExpires, refreshTokenExpires) || other.refreshTokenExpires == refreshTokenExpires)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,tokenExpires,refreshToken,refreshTokenExpires,user);

@override
String toString() {
  return 'LoginResponseModel(accessToken: $accessToken, tokenExpires: $tokenExpires, refreshToken: $refreshToken, refreshTokenExpires: $refreshTokenExpires, user: $user)';
}


}

/// @nodoc
abstract mixin class $LoginResponseModelCopyWith<$Res>  {
  factory $LoginResponseModelCopyWith(LoginResponseModel value, $Res Function(LoginResponseModel) _then) = _$LoginResponseModelCopyWithImpl;
@useResult
$Res call({
 String accessToken, int tokenExpires, String refreshToken, int refreshTokenExpires, UserModel user
});


$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$LoginResponseModelCopyWithImpl<$Res>
    implements $LoginResponseModelCopyWith<$Res> {
  _$LoginResponseModelCopyWithImpl(this._self, this._then);

  final LoginResponseModel _self;
  final $Res Function(LoginResponseModel) _then;

/// Create a copy of LoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? tokenExpires = null,Object? refreshToken = null,Object? refreshTokenExpires = null,Object? user = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,tokenExpires: null == tokenExpires ? _self.tokenExpires : tokenExpires // ignore: cast_nullable_to_non_nullable
as int,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,refreshTokenExpires: null == refreshTokenExpires ? _self.refreshTokenExpires : refreshTokenExpires // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}
/// Create a copy of LoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginResponseModel].
extension LoginResponseModelPatterns on LoginResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponseModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponseModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponseModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  int tokenExpires,  String refreshToken,  int refreshTokenExpires,  UserModel user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponseModel() when $default != null:
return $default(_that.accessToken,_that.tokenExpires,_that.refreshToken,_that.refreshTokenExpires,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  int tokenExpires,  String refreshToken,  int refreshTokenExpires,  UserModel user)  $default,) {final _that = this;
switch (_that) {
case _LoginResponseModel():
return $default(_that.accessToken,_that.tokenExpires,_that.refreshToken,_that.refreshTokenExpires,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  int tokenExpires,  String refreshToken,  int refreshTokenExpires,  UserModel user)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponseModel() when $default != null:
return $default(_that.accessToken,_that.tokenExpires,_that.refreshToken,_that.refreshTokenExpires,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponseModel implements LoginResponseModel {
  const _LoginResponseModel({required this.accessToken, required this.tokenExpires, required this.refreshToken, this.refreshTokenExpires = 0, required this.user});
  factory _LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

@override final  String accessToken;
@override final  int tokenExpires;
@override final  String refreshToken;
@override@JsonKey() final  int refreshTokenExpires;
@override final  UserModel user;

/// Create a copy of LoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseModelCopyWith<_LoginResponseModel> get copyWith => __$LoginResponseModelCopyWithImpl<_LoginResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponseModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenExpires, tokenExpires) || other.tokenExpires == tokenExpires)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.refreshTokenExpires, refreshTokenExpires) || other.refreshTokenExpires == refreshTokenExpires)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,tokenExpires,refreshToken,refreshTokenExpires,user);

@override
String toString() {
  return 'LoginResponseModel(accessToken: $accessToken, tokenExpires: $tokenExpires, refreshToken: $refreshToken, refreshTokenExpires: $refreshTokenExpires, user: $user)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseModelCopyWith<$Res> implements $LoginResponseModelCopyWith<$Res> {
  factory _$LoginResponseModelCopyWith(_LoginResponseModel value, $Res Function(_LoginResponseModel) _then) = __$LoginResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, int tokenExpires, String refreshToken, int refreshTokenExpires, UserModel user
});


@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$LoginResponseModelCopyWithImpl<$Res>
    implements _$LoginResponseModelCopyWith<$Res> {
  __$LoginResponseModelCopyWithImpl(this._self, this._then);

  final _LoginResponseModel _self;
  final $Res Function(_LoginResponseModel) _then;

/// Create a copy of LoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? tokenExpires = null,Object? refreshToken = null,Object? refreshTokenExpires = null,Object? user = null,}) {
  return _then(_LoginResponseModel(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,tokenExpires: null == tokenExpires ? _self.tokenExpires : tokenExpires // ignore: cast_nullable_to_non_nullable
as int,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,refreshTokenExpires: null == refreshTokenExpires ? _self.refreshTokenExpires : refreshTokenExpires // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}

/// Create a copy of LoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$RefreshRequestModel {

 String get refreshToken;
/// Create a copy of RefreshRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshRequestModelCopyWith<RefreshRequestModel> get copyWith => _$RefreshRequestModelCopyWithImpl<RefreshRequestModel>(this as RefreshRequestModel, _$identity);

  /// Serializes this RefreshRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshRequestModel&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'RefreshRequestModel(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $RefreshRequestModelCopyWith<$Res>  {
  factory $RefreshRequestModelCopyWith(RefreshRequestModel value, $Res Function(RefreshRequestModel) _then) = _$RefreshRequestModelCopyWithImpl;
@useResult
$Res call({
 String refreshToken
});




}
/// @nodoc
class _$RefreshRequestModelCopyWithImpl<$Res>
    implements $RefreshRequestModelCopyWith<$Res> {
  _$RefreshRequestModelCopyWithImpl(this._self, this._then);

  final RefreshRequestModel _self;
  final $Res Function(RefreshRequestModel) _then;

/// Create a copy of RefreshRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refreshToken = null,}) {
  return _then(_self.copyWith(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshRequestModel].
extension RefreshRequestModelPatterns on RefreshRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshRequestModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _RefreshRequestModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshRequestModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshRequestModel() when $default != null:
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _RefreshRequestModel():
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _RefreshRequestModel() when $default != null:
return $default(_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshRequestModel implements RefreshRequestModel {
  const _RefreshRequestModel({required this.refreshToken});
  factory _RefreshRequestModel.fromJson(Map<String, dynamic> json) => _$RefreshRequestModelFromJson(json);

@override final  String refreshToken;

/// Create a copy of RefreshRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshRequestModelCopyWith<_RefreshRequestModel> get copyWith => __$RefreshRequestModelCopyWithImpl<_RefreshRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequestModel&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'RefreshRequestModel(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$RefreshRequestModelCopyWith<$Res> implements $RefreshRequestModelCopyWith<$Res> {
  factory _$RefreshRequestModelCopyWith(_RefreshRequestModel value, $Res Function(_RefreshRequestModel) _then) = __$RefreshRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String refreshToken
});




}
/// @nodoc
class __$RefreshRequestModelCopyWithImpl<$Res>
    implements _$RefreshRequestModelCopyWith<$Res> {
  __$RefreshRequestModelCopyWithImpl(this._self, this._then);

  final _RefreshRequestModel _self;
  final $Res Function(_RefreshRequestModel) _then;

/// Create a copy of RefreshRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refreshToken = null,}) {
  return _then(_RefreshRequestModel(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UpdateUserRequestModel {

 String? get name; String? get email; String? get avatarUrl;
/// Create a copy of UpdateUserRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserRequestModelCopyWith<UpdateUserRequestModel> get copyWith => _$UpdateUserRequestModelCopyWithImpl<UpdateUserRequestModel>(this as UpdateUserRequestModel, _$identity);

  /// Serializes this UpdateUserRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,avatarUrl);

@override
String toString() {
  return 'UpdateUserRequestModel(name: $name, email: $email, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $UpdateUserRequestModelCopyWith<$Res>  {
  factory $UpdateUserRequestModelCopyWith(UpdateUserRequestModel value, $Res Function(UpdateUserRequestModel) _then) = _$UpdateUserRequestModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? email, String? avatarUrl
});




}
/// @nodoc
class _$UpdateUserRequestModelCopyWithImpl<$Res>
    implements $UpdateUserRequestModelCopyWith<$Res> {
  _$UpdateUserRequestModelCopyWithImpl(this._self, this._then);

  final UpdateUserRequestModel _self;
  final $Res Function(UpdateUserRequestModel) _then;

/// Create a copy of UpdateUserRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? email = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateUserRequestModel].
extension UpdateUserRequestModelPatterns on UpdateUserRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateUserRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateUserRequestModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateUserRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _UpdateUserRequestModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateUserRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateUserRequestModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? email,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateUserRequestModel() when $default != null:
return $default(_that.name,_that.email,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? email,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _UpdateUserRequestModel():
return $default(_that.name,_that.email,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? email,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _UpdateUserRequestModel() when $default != null:
return $default(_that.name,_that.email,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateUserRequestModel implements UpdateUserRequestModel {
  const _UpdateUserRequestModel({required this.name, required this.email, required this.avatarUrl});
  factory _UpdateUserRequestModel.fromJson(Map<String, dynamic> json) => _$UpdateUserRequestModelFromJson(json);

@override final  String? name;
@override final  String? email;
@override final  String? avatarUrl;

/// Create a copy of UpdateUserRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateUserRequestModelCopyWith<_UpdateUserRequestModel> get copyWith => __$UpdateUserRequestModelCopyWithImpl<_UpdateUserRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateUserRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateUserRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,avatarUrl);

@override
String toString() {
  return 'UpdateUserRequestModel(name: $name, email: $email, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$UpdateUserRequestModelCopyWith<$Res> implements $UpdateUserRequestModelCopyWith<$Res> {
  factory _$UpdateUserRequestModelCopyWith(_UpdateUserRequestModel value, $Res Function(_UpdateUserRequestModel) _then) = __$UpdateUserRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? email, String? avatarUrl
});




}
/// @nodoc
class __$UpdateUserRequestModelCopyWithImpl<$Res>
    implements _$UpdateUserRequestModelCopyWith<$Res> {
  __$UpdateUserRequestModelCopyWithImpl(this._self, this._then);

  final _UpdateUserRequestModel _self;
  final $Res Function(_UpdateUserRequestModel) _then;

/// Create a copy of UpdateUserRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? email = freezed,Object? avatarUrl = freezed,}) {
  return _then(_UpdateUserRequestModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
