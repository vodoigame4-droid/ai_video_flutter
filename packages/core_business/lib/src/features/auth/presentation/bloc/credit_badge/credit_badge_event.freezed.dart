// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_badge_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreditBadgeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditBadgeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreditBadgeEvent()';
}


}

/// @nodoc
class $CreditBadgeEventCopyWith<$Res>  {
$CreditBadgeEventCopyWith(CreditBadgeEvent _, $Res Function(CreditBadgeEvent) __);
}


/// Adds pattern-matching-related methods to [CreditBadgeEvent].
extension CreditBadgeEventPatterns on CreditBadgeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _ProfileUpdated value)?  profileUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ProfileUpdated() when profileUpdated != null:
return profileUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _ProfileUpdated value)  profileUpdated,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _ProfileUpdated():
return profileUpdated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _ProfileUpdated value)?  profileUpdated,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ProfileUpdated() when profileUpdated != null:
return profileUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( UserEntity user)?  profileUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _ProfileUpdated() when profileUpdated != null:
return profileUpdated(_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( UserEntity user)  profileUpdated,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _ProfileUpdated():
return profileUpdated(_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( UserEntity user)?  profileUpdated,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _ProfileUpdated() when profileUpdated != null:
return profileUpdated(_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CreditBadgeEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreditBadgeEvent.started()';
}


}




/// @nodoc


class _ProfileUpdated implements CreditBadgeEvent {
  const _ProfileUpdated(this.user);
  

 final  UserEntity user;

/// Create a copy of CreditBadgeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileUpdatedCopyWith<_ProfileUpdated> get copyWith => __$ProfileUpdatedCopyWithImpl<_ProfileUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileUpdated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'CreditBadgeEvent.profileUpdated(user: $user)';
}


}

/// @nodoc
abstract mixin class _$ProfileUpdatedCopyWith<$Res> implements $CreditBadgeEventCopyWith<$Res> {
  factory _$ProfileUpdatedCopyWith(_ProfileUpdated value, $Res Function(_ProfileUpdated) _then) = __$ProfileUpdatedCopyWithImpl;
@useResult
$Res call({
 UserEntity user
});


$UserEntityCopyWith<$Res> get user;

}
/// @nodoc
class __$ProfileUpdatedCopyWithImpl<$Res>
    implements _$ProfileUpdatedCopyWith<$Res> {
  __$ProfileUpdatedCopyWithImpl(this._self, this._then);

  final _ProfileUpdated _self;
  final $Res Function(_ProfileUpdated) _then;

/// Create a copy of CreditBadgeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_ProfileUpdated(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}

/// Create a copy of CreditBadgeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get user {
  
  return $UserEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
