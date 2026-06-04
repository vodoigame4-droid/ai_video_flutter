// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_login_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyLoginEntity {

 int get currentStreak; String? get lastLoginAt; List<DailyRewardEntity> get rewards;
/// Create a copy of DailyLoginEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyLoginEntityCopyWith<DailyLoginEntity> get copyWith => _$DailyLoginEntityCopyWithImpl<DailyLoginEntity>(this as DailyLoginEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyLoginEntity&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt)&&const DeepCollectionEquality().equals(other.rewards, rewards));
}


@override
int get hashCode => Object.hash(runtimeType,currentStreak,lastLoginAt,const DeepCollectionEquality().hash(rewards));

@override
String toString() {
  return 'DailyLoginEntity(currentStreak: $currentStreak, lastLoginAt: $lastLoginAt, rewards: $rewards)';
}


}

/// @nodoc
abstract mixin class $DailyLoginEntityCopyWith<$Res>  {
  factory $DailyLoginEntityCopyWith(DailyLoginEntity value, $Res Function(DailyLoginEntity) _then) = _$DailyLoginEntityCopyWithImpl;
@useResult
$Res call({
 int currentStreak, String? lastLoginAt, List<DailyRewardEntity> rewards
});




}
/// @nodoc
class _$DailyLoginEntityCopyWithImpl<$Res>
    implements $DailyLoginEntityCopyWith<$Res> {
  _$DailyLoginEntityCopyWithImpl(this._self, this._then);

  final DailyLoginEntity _self;
  final $Res Function(DailyLoginEntity) _then;

/// Create a copy of DailyLoginEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStreak = null,Object? lastLoginAt = freezed,Object? rewards = null,}) {
  return _then(_self.copyWith(
currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as String?,rewards: null == rewards ? _self.rewards : rewards // ignore: cast_nullable_to_non_nullable
as List<DailyRewardEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyLoginEntity].
extension DailyLoginEntityPatterns on DailyLoginEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyLoginEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyLoginEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyLoginEntity value)  $default,){
final _that = this;
switch (_that) {
case _DailyLoginEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyLoginEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DailyLoginEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStreak,  String? lastLoginAt,  List<DailyRewardEntity> rewards)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyLoginEntity() when $default != null:
return $default(_that.currentStreak,_that.lastLoginAt,_that.rewards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStreak,  String? lastLoginAt,  List<DailyRewardEntity> rewards)  $default,) {final _that = this;
switch (_that) {
case _DailyLoginEntity():
return $default(_that.currentStreak,_that.lastLoginAt,_that.rewards);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStreak,  String? lastLoginAt,  List<DailyRewardEntity> rewards)?  $default,) {final _that = this;
switch (_that) {
case _DailyLoginEntity() when $default != null:
return $default(_that.currentStreak,_that.lastLoginAt,_that.rewards);case _:
  return null;

}
}

}

/// @nodoc


class _DailyLoginEntity implements DailyLoginEntity {
  const _DailyLoginEntity({required this.currentStreak, required this.lastLoginAt, required final  List<DailyRewardEntity> rewards}): _rewards = rewards;
  

@override final  int currentStreak;
@override final  String? lastLoginAt;
 final  List<DailyRewardEntity> _rewards;
@override List<DailyRewardEntity> get rewards {
  if (_rewards is EqualUnmodifiableListView) return _rewards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rewards);
}


/// Create a copy of DailyLoginEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyLoginEntityCopyWith<_DailyLoginEntity> get copyWith => __$DailyLoginEntityCopyWithImpl<_DailyLoginEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyLoginEntity&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt)&&const DeepCollectionEquality().equals(other._rewards, _rewards));
}


@override
int get hashCode => Object.hash(runtimeType,currentStreak,lastLoginAt,const DeepCollectionEquality().hash(_rewards));

@override
String toString() {
  return 'DailyLoginEntity(currentStreak: $currentStreak, lastLoginAt: $lastLoginAt, rewards: $rewards)';
}


}

/// @nodoc
abstract mixin class _$DailyLoginEntityCopyWith<$Res> implements $DailyLoginEntityCopyWith<$Res> {
  factory _$DailyLoginEntityCopyWith(_DailyLoginEntity value, $Res Function(_DailyLoginEntity) _then) = __$DailyLoginEntityCopyWithImpl;
@override @useResult
$Res call({
 int currentStreak, String? lastLoginAt, List<DailyRewardEntity> rewards
});




}
/// @nodoc
class __$DailyLoginEntityCopyWithImpl<$Res>
    implements _$DailyLoginEntityCopyWith<$Res> {
  __$DailyLoginEntityCopyWithImpl(this._self, this._then);

  final _DailyLoginEntity _self;
  final $Res Function(_DailyLoginEntity) _then;

/// Create a copy of DailyLoginEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStreak = null,Object? lastLoginAt = freezed,Object? rewards = null,}) {
  return _then(_DailyLoginEntity(
currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as String?,rewards: null == rewards ? _self._rewards : rewards // ignore: cast_nullable_to_non_nullable
as List<DailyRewardEntity>,
  ));
}


}

// dart format on
