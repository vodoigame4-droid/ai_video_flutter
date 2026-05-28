// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iap_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IapEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IapEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IapEvent()';
}


}

/// @nodoc
class $IapEventCopyWith<$Res>  {
$IapEventCopyWith(IapEvent _, $Res Function(IapEvent) __);
}


/// Adds pattern-matching-related methods to [IapEvent].
extension IapEventPatterns on IapEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _SelectWeekly value)?  selectWeekly,TResult Function( _SelectAnnually value)?  selectAnnually,TResult Function( _Purchase value)?  purchase,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SelectWeekly() when selectWeekly != null:
return selectWeekly(_that);case _SelectAnnually() when selectAnnually != null:
return selectAnnually(_that);case _Purchase() when purchase != null:
return purchase(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _SelectWeekly value)  selectWeekly,required TResult Function( _SelectAnnually value)  selectAnnually,required TResult Function( _Purchase value)  purchase,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _SelectWeekly():
return selectWeekly(_that);case _SelectAnnually():
return selectAnnually(_that);case _Purchase():
return purchase(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _SelectWeekly value)?  selectWeekly,TResult? Function( _SelectAnnually value)?  selectAnnually,TResult? Function( _Purchase value)?  purchase,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SelectWeekly() when selectWeekly != null:
return selectWeekly(_that);case _SelectAnnually() when selectAnnually != null:
return selectAnnually(_that);case _Purchase() when purchase != null:
return purchase(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  selectWeekly,TResult Function()?  selectAnnually,TResult Function()?  purchase,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _SelectWeekly() when selectWeekly != null:
return selectWeekly();case _SelectAnnually() when selectAnnually != null:
return selectAnnually();case _Purchase() when purchase != null:
return purchase();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  selectWeekly,required TResult Function()  selectAnnually,required TResult Function()  purchase,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _SelectWeekly():
return selectWeekly();case _SelectAnnually():
return selectAnnually();case _Purchase():
return purchase();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  selectWeekly,TResult? Function()?  selectAnnually,TResult? Function()?  purchase,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _SelectWeekly() when selectWeekly != null:
return selectWeekly();case _SelectAnnually() when selectAnnually != null:
return selectAnnually();case _Purchase() when purchase != null:
return purchase();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements IapEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IapEvent.init()';
}


}




/// @nodoc


class _SelectWeekly implements IapEvent {
  const _SelectWeekly();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectWeekly);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IapEvent.selectWeekly()';
}


}




/// @nodoc


class _SelectAnnually implements IapEvent {
  const _SelectAnnually();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectAnnually);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IapEvent.selectAnnually()';
}


}




/// @nodoc


class _Purchase implements IapEvent {
  const _Purchase();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Purchase);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IapEvent.purchase()';
}


}




// dart format on
