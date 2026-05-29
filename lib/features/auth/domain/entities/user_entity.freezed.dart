// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEntity {

 String get id; String get deviceId; String get name; String get email; String get avatarUrl; String get inviteCode; String get status; int get credits; int get extraCredits; int get subscribeCredits; bool get isRated; bool get isVip; String? get activeSubId; int get refUsersCount; DateTime get createdAt;
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntityCopyWith<UserEntity> get copyWith => _$UserEntityCopyWithImpl<UserEntity>(this as UserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.extraCredits, extraCredits) || other.extraCredits == extraCredits)&&(identical(other.subscribeCredits, subscribeCredits) || other.subscribeCredits == subscribeCredits)&&(identical(other.isRated, isRated) || other.isRated == isRated)&&(identical(other.isVip, isVip) || other.isVip == isVip)&&(identical(other.activeSubId, activeSubId) || other.activeSubId == activeSubId)&&(identical(other.refUsersCount, refUsersCount) || other.refUsersCount == refUsersCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,deviceId,name,email,avatarUrl,inviteCode,status,credits,extraCredits,subscribeCredits,isRated,isVip,activeSubId,refUsersCount,createdAt);

@override
String toString() {
  return 'UserEntity(id: $id, deviceId: $deviceId, name: $name, email: $email, avatarUrl: $avatarUrl, inviteCode: $inviteCode, status: $status, credits: $credits, extraCredits: $extraCredits, subscribeCredits: $subscribeCredits, isRated: $isRated, isVip: $isVip, activeSubId: $activeSubId, refUsersCount: $refUsersCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserEntityCopyWith<$Res>  {
  factory $UserEntityCopyWith(UserEntity value, $Res Function(UserEntity) _then) = _$UserEntityCopyWithImpl;
@useResult
$Res call({
 String id, String deviceId, String name, String email, String avatarUrl, String inviteCode, String status, int credits, int extraCredits, int subscribeCredits, bool isRated, bool isVip, String? activeSubId, int refUsersCount, DateTime createdAt
});




}
/// @nodoc
class _$UserEntityCopyWithImpl<$Res>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._self, this._then);

  final UserEntity _self;
  final $Res Function(UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? deviceId = null,Object? name = null,Object? email = null,Object? avatarUrl = null,Object? inviteCode = null,Object? status = null,Object? credits = null,Object? extraCredits = null,Object? subscribeCredits = null,Object? isRated = null,Object? isVip = null,Object? activeSubId = freezed,Object? refUsersCount = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,extraCredits: null == extraCredits ? _self.extraCredits : extraCredits // ignore: cast_nullable_to_non_nullable
as int,subscribeCredits: null == subscribeCredits ? _self.subscribeCredits : subscribeCredits // ignore: cast_nullable_to_non_nullable
as int,isRated: null == isRated ? _self.isRated : isRated // ignore: cast_nullable_to_non_nullable
as bool,isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as bool,activeSubId: freezed == activeSubId ? _self.activeSubId : activeSubId // ignore: cast_nullable_to_non_nullable
as String?,refUsersCount: null == refUsersCount ? _self.refUsersCount : refUsersCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserEntity].
extension UserEntityPatterns on UserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String deviceId,  String name,  String email,  String avatarUrl,  String inviteCode,  String status,  int credits,  int extraCredits,  int subscribeCredits,  bool isRated,  bool isVip,  String? activeSubId,  int refUsersCount,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.deviceId,_that.name,_that.email,_that.avatarUrl,_that.inviteCode,_that.status,_that.credits,_that.extraCredits,_that.subscribeCredits,_that.isRated,_that.isVip,_that.activeSubId,_that.refUsersCount,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String deviceId,  String name,  String email,  String avatarUrl,  String inviteCode,  String status,  int credits,  int extraCredits,  int subscribeCredits,  bool isRated,  bool isVip,  String? activeSubId,  int refUsersCount,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserEntity():
return $default(_that.id,_that.deviceId,_that.name,_that.email,_that.avatarUrl,_that.inviteCode,_that.status,_that.credits,_that.extraCredits,_that.subscribeCredits,_that.isRated,_that.isVip,_that.activeSubId,_that.refUsersCount,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String deviceId,  String name,  String email,  String avatarUrl,  String inviteCode,  String status,  int credits,  int extraCredits,  int subscribeCredits,  bool isRated,  bool isVip,  String? activeSubId,  int refUsersCount,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.deviceId,_that.name,_that.email,_that.avatarUrl,_that.inviteCode,_that.status,_that.credits,_that.extraCredits,_that.subscribeCredits,_that.isRated,_that.isVip,_that.activeSubId,_that.refUsersCount,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _UserEntity implements UserEntity {
  const _UserEntity({required this.id, required this.deviceId, required this.name, required this.email, required this.avatarUrl, required this.inviteCode, required this.status, required this.credits, required this.extraCredits, required this.subscribeCredits, required this.isRated, required this.isVip, required this.activeSubId, required this.refUsersCount, required this.createdAt});
  

@override final  String id;
@override final  String deviceId;
@override final  String name;
@override final  String email;
@override final  String avatarUrl;
@override final  String inviteCode;
@override final  String status;
@override final  int credits;
@override final  int extraCredits;
@override final  int subscribeCredits;
@override final  bool isRated;
@override final  bool isVip;
@override final  String? activeSubId;
@override final  int refUsersCount;
@override final  DateTime createdAt;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntityCopyWith<_UserEntity> get copyWith => __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.extraCredits, extraCredits) || other.extraCredits == extraCredits)&&(identical(other.subscribeCredits, subscribeCredits) || other.subscribeCredits == subscribeCredits)&&(identical(other.isRated, isRated) || other.isRated == isRated)&&(identical(other.isVip, isVip) || other.isVip == isVip)&&(identical(other.activeSubId, activeSubId) || other.activeSubId == activeSubId)&&(identical(other.refUsersCount, refUsersCount) || other.refUsersCount == refUsersCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,deviceId,name,email,avatarUrl,inviteCode,status,credits,extraCredits,subscribeCredits,isRated,isVip,activeSubId,refUsersCount,createdAt);

@override
String toString() {
  return 'UserEntity(id: $id, deviceId: $deviceId, name: $name, email: $email, avatarUrl: $avatarUrl, inviteCode: $inviteCode, status: $status, credits: $credits, extraCredits: $extraCredits, subscribeCredits: $subscribeCredits, isRated: $isRated, isVip: $isVip, activeSubId: $activeSubId, refUsersCount: $refUsersCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(_UserEntity value, $Res Function(_UserEntity) _then) = __$UserEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String deviceId, String name, String email, String avatarUrl, String inviteCode, String status, int credits, int extraCredits, int subscribeCredits, bool isRated, bool isVip, String? activeSubId, int refUsersCount, DateTime createdAt
});




}
/// @nodoc
class __$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(this._self, this._then);

  final _UserEntity _self;
  final $Res Function(_UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deviceId = null,Object? name = null,Object? email = null,Object? avatarUrl = null,Object? inviteCode = null,Object? status = null,Object? credits = null,Object? extraCredits = null,Object? subscribeCredits = null,Object? isRated = null,Object? isVip = null,Object? activeSubId = freezed,Object? refUsersCount = null,Object? createdAt = null,}) {
  return _then(_UserEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,extraCredits: null == extraCredits ? _self.extraCredits : extraCredits // ignore: cast_nullable_to_non_nullable
as int,subscribeCredits: null == subscribeCredits ? _self.subscribeCredits : subscribeCredits // ignore: cast_nullable_to_non_nullable
as int,isRated: null == isRated ? _self.isRated : isRated // ignore: cast_nullable_to_non_nullable
as bool,isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as bool,activeSubId: freezed == activeSubId ? _self.activeSubId : activeSubId // ignore: cast_nullable_to_non_nullable
as String?,refUsersCount: null == refUsersCount ? _self.refUsersCount : refUsersCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
