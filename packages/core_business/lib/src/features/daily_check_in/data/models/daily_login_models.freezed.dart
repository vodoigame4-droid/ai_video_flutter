// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_login_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyRewardModel {

 String get id; int get streakDay; int get rewardCredits; bool get isSpecial;
/// Create a copy of DailyRewardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyRewardModelCopyWith<DailyRewardModel> get copyWith => _$DailyRewardModelCopyWithImpl<DailyRewardModel>(this as DailyRewardModel, _$identity);

  /// Serializes this DailyRewardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyRewardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.streakDay, streakDay) || other.streakDay == streakDay)&&(identical(other.rewardCredits, rewardCredits) || other.rewardCredits == rewardCredits)&&(identical(other.isSpecial, isSpecial) || other.isSpecial == isSpecial));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,streakDay,rewardCredits,isSpecial);

@override
String toString() {
  return 'DailyRewardModel(id: $id, streakDay: $streakDay, rewardCredits: $rewardCredits, isSpecial: $isSpecial)';
}


}

/// @nodoc
abstract mixin class $DailyRewardModelCopyWith<$Res>  {
  factory $DailyRewardModelCopyWith(DailyRewardModel value, $Res Function(DailyRewardModel) _then) = _$DailyRewardModelCopyWithImpl;
@useResult
$Res call({
 String id, int streakDay, int rewardCredits, bool isSpecial
});




}
/// @nodoc
class _$DailyRewardModelCopyWithImpl<$Res>
    implements $DailyRewardModelCopyWith<$Res> {
  _$DailyRewardModelCopyWithImpl(this._self, this._then);

  final DailyRewardModel _self;
  final $Res Function(DailyRewardModel) _then;

/// Create a copy of DailyRewardModel
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


/// Adds pattern-matching-related methods to [DailyRewardModel].
extension DailyRewardModelPatterns on DailyRewardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyRewardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyRewardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyRewardModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyRewardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyRewardModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyRewardModel() when $default != null:
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
case _DailyRewardModel() when $default != null:
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
case _DailyRewardModel():
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
case _DailyRewardModel() when $default != null:
return $default(_that.id,_that.streakDay,_that.rewardCredits,_that.isSpecial);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyRewardModel implements DailyRewardModel {
  const _DailyRewardModel({required this.id, required this.streakDay, required this.rewardCredits, required this.isSpecial});
  factory _DailyRewardModel.fromJson(Map<String, dynamic> json) => _$DailyRewardModelFromJson(json);

@override final  String id;
@override final  int streakDay;
@override final  int rewardCredits;
@override final  bool isSpecial;

/// Create a copy of DailyRewardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyRewardModelCopyWith<_DailyRewardModel> get copyWith => __$DailyRewardModelCopyWithImpl<_DailyRewardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyRewardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyRewardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.streakDay, streakDay) || other.streakDay == streakDay)&&(identical(other.rewardCredits, rewardCredits) || other.rewardCredits == rewardCredits)&&(identical(other.isSpecial, isSpecial) || other.isSpecial == isSpecial));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,streakDay,rewardCredits,isSpecial);

@override
String toString() {
  return 'DailyRewardModel(id: $id, streakDay: $streakDay, rewardCredits: $rewardCredits, isSpecial: $isSpecial)';
}


}

/// @nodoc
abstract mixin class _$DailyRewardModelCopyWith<$Res> implements $DailyRewardModelCopyWith<$Res> {
  factory _$DailyRewardModelCopyWith(_DailyRewardModel value, $Res Function(_DailyRewardModel) _then) = __$DailyRewardModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int streakDay, int rewardCredits, bool isSpecial
});




}
/// @nodoc
class __$DailyRewardModelCopyWithImpl<$Res>
    implements _$DailyRewardModelCopyWith<$Res> {
  __$DailyRewardModelCopyWithImpl(this._self, this._then);

  final _DailyRewardModel _self;
  final $Res Function(_DailyRewardModel) _then;

/// Create a copy of DailyRewardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? streakDay = null,Object? rewardCredits = null,Object? isSpecial = null,}) {
  return _then(_DailyRewardModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,streakDay: null == streakDay ? _self.streakDay : streakDay // ignore: cast_nullable_to_non_nullable
as int,rewardCredits: null == rewardCredits ? _self.rewardCredits : rewardCredits // ignore: cast_nullable_to_non_nullable
as int,isSpecial: null == isSpecial ? _self.isSpecial : isSpecial // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$DailyLoginResponseModel {

 int get currentStreak; dynamic get lastLoginAt;@JsonKey(name: 'reward') List<DailyRewardModel> get rewards;
/// Create a copy of DailyLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyLoginResponseModelCopyWith<DailyLoginResponseModel> get copyWith => _$DailyLoginResponseModelCopyWithImpl<DailyLoginResponseModel>(this as DailyLoginResponseModel, _$identity);

  /// Serializes this DailyLoginResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyLoginResponseModel&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&const DeepCollectionEquality().equals(other.lastLoginAt, lastLoginAt)&&const DeepCollectionEquality().equals(other.rewards, rewards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentStreak,const DeepCollectionEquality().hash(lastLoginAt),const DeepCollectionEquality().hash(rewards));

@override
String toString() {
  return 'DailyLoginResponseModel(currentStreak: $currentStreak, lastLoginAt: $lastLoginAt, rewards: $rewards)';
}


}

/// @nodoc
abstract mixin class $DailyLoginResponseModelCopyWith<$Res>  {
  factory $DailyLoginResponseModelCopyWith(DailyLoginResponseModel value, $Res Function(DailyLoginResponseModel) _then) = _$DailyLoginResponseModelCopyWithImpl;
@useResult
$Res call({
 int currentStreak, dynamic lastLoginAt,@JsonKey(name: 'reward') List<DailyRewardModel> rewards
});




}
/// @nodoc
class _$DailyLoginResponseModelCopyWithImpl<$Res>
    implements $DailyLoginResponseModelCopyWith<$Res> {
  _$DailyLoginResponseModelCopyWithImpl(this._self, this._then);

  final DailyLoginResponseModel _self;
  final $Res Function(DailyLoginResponseModel) _then;

/// Create a copy of DailyLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStreak = null,Object? lastLoginAt = freezed,Object? rewards = null,}) {
  return _then(_self.copyWith(
currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as dynamic,rewards: null == rewards ? _self.rewards : rewards // ignore: cast_nullable_to_non_nullable
as List<DailyRewardModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyLoginResponseModel].
extension DailyLoginResponseModelPatterns on DailyLoginResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyLoginResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyLoginResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyLoginResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyLoginResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyLoginResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyLoginResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStreak,  dynamic lastLoginAt, @JsonKey(name: 'reward')  List<DailyRewardModel> rewards)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyLoginResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStreak,  dynamic lastLoginAt, @JsonKey(name: 'reward')  List<DailyRewardModel> rewards)  $default,) {final _that = this;
switch (_that) {
case _DailyLoginResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStreak,  dynamic lastLoginAt, @JsonKey(name: 'reward')  List<DailyRewardModel> rewards)?  $default,) {final _that = this;
switch (_that) {
case _DailyLoginResponseModel() when $default != null:
return $default(_that.currentStreak,_that.lastLoginAt,_that.rewards);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyLoginResponseModel implements DailyLoginResponseModel {
  const _DailyLoginResponseModel({required this.currentStreak, required this.lastLoginAt, @JsonKey(name: 'reward') required final  List<DailyRewardModel> rewards}): _rewards = rewards;
  factory _DailyLoginResponseModel.fromJson(Map<String, dynamic> json) => _$DailyLoginResponseModelFromJson(json);

@override final  int currentStreak;
@override final  dynamic lastLoginAt;
 final  List<DailyRewardModel> _rewards;
@override@JsonKey(name: 'reward') List<DailyRewardModel> get rewards {
  if (_rewards is EqualUnmodifiableListView) return _rewards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rewards);
}


/// Create a copy of DailyLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyLoginResponseModelCopyWith<_DailyLoginResponseModel> get copyWith => __$DailyLoginResponseModelCopyWithImpl<_DailyLoginResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyLoginResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyLoginResponseModel&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&const DeepCollectionEquality().equals(other.lastLoginAt, lastLoginAt)&&const DeepCollectionEquality().equals(other._rewards, _rewards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentStreak,const DeepCollectionEquality().hash(lastLoginAt),const DeepCollectionEquality().hash(_rewards));

@override
String toString() {
  return 'DailyLoginResponseModel(currentStreak: $currentStreak, lastLoginAt: $lastLoginAt, rewards: $rewards)';
}


}

/// @nodoc
abstract mixin class _$DailyLoginResponseModelCopyWith<$Res> implements $DailyLoginResponseModelCopyWith<$Res> {
  factory _$DailyLoginResponseModelCopyWith(_DailyLoginResponseModel value, $Res Function(_DailyLoginResponseModel) _then) = __$DailyLoginResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int currentStreak, dynamic lastLoginAt,@JsonKey(name: 'reward') List<DailyRewardModel> rewards
});




}
/// @nodoc
class __$DailyLoginResponseModelCopyWithImpl<$Res>
    implements _$DailyLoginResponseModelCopyWith<$Res> {
  __$DailyLoginResponseModelCopyWithImpl(this._self, this._then);

  final _DailyLoginResponseModel _self;
  final $Res Function(_DailyLoginResponseModel) _then;

/// Create a copy of DailyLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStreak = null,Object? lastLoginAt = freezed,Object? rewards = null,}) {
  return _then(_DailyLoginResponseModel(
currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as dynamic,rewards: null == rewards ? _self._rewards : rewards // ignore: cast_nullable_to_non_nullable
as List<DailyRewardModel>,
  ));
}


}


/// @nodoc
mixin _$DailyCheckInRequestModel {

 bool get ignoreReward;
/// Create a copy of DailyCheckInRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyCheckInRequestModelCopyWith<DailyCheckInRequestModel> get copyWith => _$DailyCheckInRequestModelCopyWithImpl<DailyCheckInRequestModel>(this as DailyCheckInRequestModel, _$identity);

  /// Serializes this DailyCheckInRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyCheckInRequestModel&&(identical(other.ignoreReward, ignoreReward) || other.ignoreReward == ignoreReward));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ignoreReward);

@override
String toString() {
  return 'DailyCheckInRequestModel(ignoreReward: $ignoreReward)';
}


}

/// @nodoc
abstract mixin class $DailyCheckInRequestModelCopyWith<$Res>  {
  factory $DailyCheckInRequestModelCopyWith(DailyCheckInRequestModel value, $Res Function(DailyCheckInRequestModel) _then) = _$DailyCheckInRequestModelCopyWithImpl;
@useResult
$Res call({
 bool ignoreReward
});




}
/// @nodoc
class _$DailyCheckInRequestModelCopyWithImpl<$Res>
    implements $DailyCheckInRequestModelCopyWith<$Res> {
  _$DailyCheckInRequestModelCopyWithImpl(this._self, this._then);

  final DailyCheckInRequestModel _self;
  final $Res Function(DailyCheckInRequestModel) _then;

/// Create a copy of DailyCheckInRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ignoreReward = null,}) {
  return _then(_self.copyWith(
ignoreReward: null == ignoreReward ? _self.ignoreReward : ignoreReward // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyCheckInRequestModel].
extension DailyCheckInRequestModelPatterns on DailyCheckInRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyCheckInRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyCheckInRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyCheckInRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyCheckInRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyCheckInRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyCheckInRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool ignoreReward)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyCheckInRequestModel() when $default != null:
return $default(_that.ignoreReward);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool ignoreReward)  $default,) {final _that = this;
switch (_that) {
case _DailyCheckInRequestModel():
return $default(_that.ignoreReward);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool ignoreReward)?  $default,) {final _that = this;
switch (_that) {
case _DailyCheckInRequestModel() when $default != null:
return $default(_that.ignoreReward);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyCheckInRequestModel implements DailyCheckInRequestModel {
  const _DailyCheckInRequestModel({required this.ignoreReward});
  factory _DailyCheckInRequestModel.fromJson(Map<String, dynamic> json) => _$DailyCheckInRequestModelFromJson(json);

@override final  bool ignoreReward;

/// Create a copy of DailyCheckInRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyCheckInRequestModelCopyWith<_DailyCheckInRequestModel> get copyWith => __$DailyCheckInRequestModelCopyWithImpl<_DailyCheckInRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyCheckInRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyCheckInRequestModel&&(identical(other.ignoreReward, ignoreReward) || other.ignoreReward == ignoreReward));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ignoreReward);

@override
String toString() {
  return 'DailyCheckInRequestModel(ignoreReward: $ignoreReward)';
}


}

/// @nodoc
abstract mixin class _$DailyCheckInRequestModelCopyWith<$Res> implements $DailyCheckInRequestModelCopyWith<$Res> {
  factory _$DailyCheckInRequestModelCopyWith(_DailyCheckInRequestModel value, $Res Function(_DailyCheckInRequestModel) _then) = __$DailyCheckInRequestModelCopyWithImpl;
@override @useResult
$Res call({
 bool ignoreReward
});




}
/// @nodoc
class __$DailyCheckInRequestModelCopyWithImpl<$Res>
    implements _$DailyCheckInRequestModelCopyWith<$Res> {
  __$DailyCheckInRequestModelCopyWithImpl(this._self, this._then);

  final _DailyCheckInRequestModel _self;
  final $Res Function(_DailyCheckInRequestModel) _then;

/// Create a copy of DailyCheckInRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ignoreReward = null,}) {
  return _then(_DailyCheckInRequestModel(
ignoreReward: null == ignoreReward ? _self.ignoreReward : ignoreReward // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$DailyCheckInResponseModel {

 int get rewardCredits;
/// Create a copy of DailyCheckInResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyCheckInResponseModelCopyWith<DailyCheckInResponseModel> get copyWith => _$DailyCheckInResponseModelCopyWithImpl<DailyCheckInResponseModel>(this as DailyCheckInResponseModel, _$identity);

  /// Serializes this DailyCheckInResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyCheckInResponseModel&&(identical(other.rewardCredits, rewardCredits) || other.rewardCredits == rewardCredits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rewardCredits);

@override
String toString() {
  return 'DailyCheckInResponseModel(rewardCredits: $rewardCredits)';
}


}

/// @nodoc
abstract mixin class $DailyCheckInResponseModelCopyWith<$Res>  {
  factory $DailyCheckInResponseModelCopyWith(DailyCheckInResponseModel value, $Res Function(DailyCheckInResponseModel) _then) = _$DailyCheckInResponseModelCopyWithImpl;
@useResult
$Res call({
 int rewardCredits
});




}
/// @nodoc
class _$DailyCheckInResponseModelCopyWithImpl<$Res>
    implements $DailyCheckInResponseModelCopyWith<$Res> {
  _$DailyCheckInResponseModelCopyWithImpl(this._self, this._then);

  final DailyCheckInResponseModel _self;
  final $Res Function(DailyCheckInResponseModel) _then;

/// Create a copy of DailyCheckInResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rewardCredits = null,}) {
  return _then(_self.copyWith(
rewardCredits: null == rewardCredits ? _self.rewardCredits : rewardCredits // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyCheckInResponseModel].
extension DailyCheckInResponseModelPatterns on DailyCheckInResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyCheckInResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyCheckInResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyCheckInResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyCheckInResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyCheckInResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyCheckInResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rewardCredits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyCheckInResponseModel() when $default != null:
return $default(_that.rewardCredits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rewardCredits)  $default,) {final _that = this;
switch (_that) {
case _DailyCheckInResponseModel():
return $default(_that.rewardCredits);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rewardCredits)?  $default,) {final _that = this;
switch (_that) {
case _DailyCheckInResponseModel() when $default != null:
return $default(_that.rewardCredits);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyCheckInResponseModel implements DailyCheckInResponseModel {
  const _DailyCheckInResponseModel({required this.rewardCredits});
  factory _DailyCheckInResponseModel.fromJson(Map<String, dynamic> json) => _$DailyCheckInResponseModelFromJson(json);

@override final  int rewardCredits;

/// Create a copy of DailyCheckInResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyCheckInResponseModelCopyWith<_DailyCheckInResponseModel> get copyWith => __$DailyCheckInResponseModelCopyWithImpl<_DailyCheckInResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyCheckInResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyCheckInResponseModel&&(identical(other.rewardCredits, rewardCredits) || other.rewardCredits == rewardCredits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rewardCredits);

@override
String toString() {
  return 'DailyCheckInResponseModel(rewardCredits: $rewardCredits)';
}


}

/// @nodoc
abstract mixin class _$DailyCheckInResponseModelCopyWith<$Res> implements $DailyCheckInResponseModelCopyWith<$Res> {
  factory _$DailyCheckInResponseModelCopyWith(_DailyCheckInResponseModel value, $Res Function(_DailyCheckInResponseModel) _then) = __$DailyCheckInResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int rewardCredits
});




}
/// @nodoc
class __$DailyCheckInResponseModelCopyWithImpl<$Res>
    implements _$DailyCheckInResponseModelCopyWith<$Res> {
  __$DailyCheckInResponseModelCopyWithImpl(this._self, this._then);

  final _DailyCheckInResponseModel _self;
  final $Res Function(_DailyCheckInResponseModel) _then;

/// Create a copy of DailyCheckInResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rewardCredits = null,}) {
  return _then(_DailyCheckInResponseModel(
rewardCredits: null == rewardCredits ? _self.rewardCredits : rewardCredits // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
