// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_reward_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyRewardEntity {

 String get id; int get streakDay; int get rewardCredits; bool get isSpecial;
/// Create a copy of DailyRewardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyRewardEntityCopyWith<DailyRewardEntity> get copyWith => _$DailyRewardEntityCopyWithImpl<DailyRewardEntity>(this as DailyRewardEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyRewardEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.streakDay, streakDay) || other.streakDay == streakDay)&&(identical(other.rewardCredits, rewardCredits) || other.rewardCredits == rewardCredits)&&(identical(other.isSpecial, isSpecial) || other.isSpecial == isSpecial));
}


@override
int get hashCode => Object.hash(runtimeType,id,streakDay,rewardCredits,isSpecial);

@override
String toString() {
  return 'DailyRewardEntity(id: $id, streakDay: $streakDay, rewardCredits: $rewardCredits, isSpecial: $isSpecial)';
}


}

/// @nodoc
abstract mixin class $DailyRewardEntityCopyWith<$Res>  {
  factory $DailyRewardEntityCopyWith(DailyRewardEntity value, $Res Function(DailyRewardEntity) _then) = _$DailyRewardEntityCopyWithImpl;
@useResult
$Res call({
 String id, int streakDay, int rewardCredits, bool isSpecial
});




}
/// @nodoc
class _$DailyRewardEntityCopyWithImpl<$Res>
    implements $DailyRewardEntityCopyWith<$Res> {
  _$DailyRewardEntityCopyWithImpl(this._self, this._then);

  final DailyRewardEntity _self;
  final $Res Function(DailyRewardEntity) _then;

/// Create a copy of DailyRewardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? streakDay = null,Object? rewardCredits = null,Object? isSpecial = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,streakDay: null == streakDay ? _self.streakDay : streakDay // ignore: cast_nullable_to_non_nullable
as int,rewardCredits: null == rewardCredits ? _self.rewardCredits : rewardCredits // ignore: cast_nullable_to_non_nullable
as int,isSpecial: null == isSpecial ? _self.isSpecial : isSpecial // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyRewardEntity].
extension DailyRewardEntityPatterns on DailyRewardEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyRewardEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyRewardEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyRewardEntity value)  $default,){
final _that = this;
switch (_that) {
case _DailyRewardEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyRewardEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DailyRewardEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int streakDay,  int rewardCredits,  bool isSpecial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyRewardEntity() when $default != null:
return $default(_that.id,_that.streakDay,_that.rewardCredits,_that.isSpecial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int streakDay,  int rewardCredits,  bool isSpecial)  $default,) {final _that = this;
switch (_that) {
case _DailyRewardEntity():
return $default(_that.id,_that.streakDay,_that.rewardCredits,_that.isSpecial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int streakDay,  int rewardCredits,  bool isSpecial)?  $default,) {final _that = this;
switch (_that) {
case _DailyRewardEntity() when $default != null:
return $default(_that.id,_that.streakDay,_that.rewardCredits,_that.isSpecial);case _:
  return null;

}
}

}

/// @nodoc


class _DailyRewardEntity implements DailyRewardEntity {
  const _DailyRewardEntity({required this.id, required this.streakDay, required this.rewardCredits, required this.isSpecial});
  

@override final  String id;
@override final  int streakDay;
@override final  int rewardCredits;
@override final  bool isSpecial;

/// Create a copy of DailyRewardEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyRewardEntityCopyWith<_DailyRewardEntity> get copyWith => __$DailyRewardEntityCopyWithImpl<_DailyRewardEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyRewardEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.streakDay, streakDay) || other.streakDay == streakDay)&&(identical(other.rewardCredits, rewardCredits) || other.rewardCredits == rewardCredits)&&(identical(other.isSpecial, isSpecial) || other.isSpecial == isSpecial));
}


@override
int get hashCode => Object.hash(runtimeType,id,streakDay,rewardCredits,isSpecial);

@override
String toString() {
  return 'DailyRewardEntity(id: $id, streakDay: $streakDay, rewardCredits: $rewardCredits, isSpecial: $isSpecial)';
}


}

/// @nodoc
abstract mixin class _$DailyRewardEntityCopyWith<$Res> implements $DailyRewardEntityCopyWith<$Res> {
  factory _$DailyRewardEntityCopyWith(_DailyRewardEntity value, $Res Function(_DailyRewardEntity) _then) = __$DailyRewardEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, int streakDay, int rewardCredits, bool isSpecial
});




}
/// @nodoc
class __$DailyRewardEntityCopyWithImpl<$Res>
    implements _$DailyRewardEntityCopyWith<$Res> {
  __$DailyRewardEntityCopyWithImpl(this._self, this._then);

  final _DailyRewardEntity _self;
  final $Res Function(_DailyRewardEntity) _then;

/// Create a copy of DailyRewardEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? streakDay = null,Object? rewardCredits = null,Object? isSpecial = null,}) {
  return _then(_DailyRewardEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,streakDay: null == streakDay ? _self.streakDay : streakDay // ignore: cast_nullable_to_non_nullable
as int,rewardCredits: null == rewardCredits ? _self.rewardCredits : rewardCredits // ignore: cast_nullable_to_non_nullable
as int,isSpecial: null == isSpecial ? _self.isSpecial : isSpecial // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
