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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _SelectWeekly value)?  selectWeekly,TResult Function( _SelectAnnually value)?  selectAnnually,TResult Function( _ToggleReveal value)?  toggleReveal,TResult Function( _Purchase value)?  purchase,TResult Function( _PurchaseCredits value)?  purchaseCredits,TResult Function( _SelectCreditPackage value)?  selectCreditPackage,TResult Function( _Restore value)?  restore,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SelectWeekly() when selectWeekly != null:
return selectWeekly(_that);case _SelectAnnually() when selectAnnually != null:
return selectAnnually(_that);case _ToggleReveal() when toggleReveal != null:
return toggleReveal(_that);case _Purchase() when purchase != null:
return purchase(_that);case _PurchaseCredits() when purchaseCredits != null:
return purchaseCredits(_that);case _SelectCreditPackage() when selectCreditPackage != null:
return selectCreditPackage(_that);case _Restore() when restore != null:
return restore(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _SelectWeekly value)  selectWeekly,required TResult Function( _SelectAnnually value)  selectAnnually,required TResult Function( _ToggleReveal value)  toggleReveal,required TResult Function( _Purchase value)  purchase,required TResult Function( _PurchaseCredits value)  purchaseCredits,required TResult Function( _SelectCreditPackage value)  selectCreditPackage,required TResult Function( _Restore value)  restore,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _SelectWeekly():
return selectWeekly(_that);case _SelectAnnually():
return selectAnnually(_that);case _ToggleReveal():
return toggleReveal(_that);case _Purchase():
return purchase(_that);case _PurchaseCredits():
return purchaseCredits(_that);case _SelectCreditPackage():
return selectCreditPackage(_that);case _Restore():
return restore(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _SelectWeekly value)?  selectWeekly,TResult? Function( _SelectAnnually value)?  selectAnnually,TResult? Function( _ToggleReveal value)?  toggleReveal,TResult? Function( _Purchase value)?  purchase,TResult? Function( _PurchaseCredits value)?  purchaseCredits,TResult? Function( _SelectCreditPackage value)?  selectCreditPackage,TResult? Function( _Restore value)?  restore,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SelectWeekly() when selectWeekly != null:
return selectWeekly(_that);case _SelectAnnually() when selectAnnually != null:
return selectAnnually(_that);case _ToggleReveal() when toggleReveal != null:
return toggleReveal(_that);case _Purchase() when purchase != null:
return purchase(_that);case _PurchaseCredits() when purchaseCredits != null:
return purchaseCredits(_that);case _SelectCreditPackage() when selectCreditPackage != null:
return selectCreditPackage(_that);case _Restore() when restore != null:
return restore(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  selectWeekly,TResult Function()?  selectAnnually,TResult Function()?  toggleReveal,TResult Function( String? productId)?  purchase,TResult Function( String productId)?  purchaseCredits,TResult Function( int index)?  selectCreditPackage,TResult Function()?  restore,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _SelectWeekly() when selectWeekly != null:
return selectWeekly();case _SelectAnnually() when selectAnnually != null:
return selectAnnually();case _ToggleReveal() when toggleReveal != null:
return toggleReveal();case _Purchase() when purchase != null:
return purchase(_that.productId);case _PurchaseCredits() when purchaseCredits != null:
return purchaseCredits(_that.productId);case _SelectCreditPackage() when selectCreditPackage != null:
return selectCreditPackage(_that.index);case _Restore() when restore != null:
return restore();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  selectWeekly,required TResult Function()  selectAnnually,required TResult Function()  toggleReveal,required TResult Function( String? productId)  purchase,required TResult Function( String productId)  purchaseCredits,required TResult Function( int index)  selectCreditPackage,required TResult Function()  restore,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _SelectWeekly():
return selectWeekly();case _SelectAnnually():
return selectAnnually();case _ToggleReveal():
return toggleReveal();case _Purchase():
return purchase(_that.productId);case _PurchaseCredits():
return purchaseCredits(_that.productId);case _SelectCreditPackage():
return selectCreditPackage(_that.index);case _Restore():
return restore();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  selectWeekly,TResult? Function()?  selectAnnually,TResult? Function()?  toggleReveal,TResult? Function( String? productId)?  purchase,TResult? Function( String productId)?  purchaseCredits,TResult? Function( int index)?  selectCreditPackage,TResult? Function()?  restore,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _SelectWeekly() when selectWeekly != null:
return selectWeekly();case _SelectAnnually() when selectAnnually != null:
return selectAnnually();case _ToggleReveal() when toggleReveal != null:
return toggleReveal();case _Purchase() when purchase != null:
return purchase(_that.productId);case _PurchaseCredits() when purchaseCredits != null:
return purchaseCredits(_that.productId);case _SelectCreditPackage() when selectCreditPackage != null:
return selectCreditPackage(_that.index);case _Restore() when restore != null:
return restore();case _:
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


class _ToggleReveal implements IapEvent {
  const _ToggleReveal();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleReveal);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IapEvent.toggleReveal()';
}


}




/// @nodoc


class _Purchase implements IapEvent {
  const _Purchase({this.productId});
  

 final  String? productId;

/// Create a copy of IapEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseCopyWith<_Purchase> get copyWith => __$PurchaseCopyWithImpl<_Purchase>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Purchase&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'IapEvent.purchase(productId: $productId)';
}


}

/// @nodoc
abstract mixin class _$PurchaseCopyWith<$Res> implements $IapEventCopyWith<$Res> {
  factory _$PurchaseCopyWith(_Purchase value, $Res Function(_Purchase) _then) = __$PurchaseCopyWithImpl;
@useResult
$Res call({
 String? productId
});




}
/// @nodoc
class __$PurchaseCopyWithImpl<$Res>
    implements _$PurchaseCopyWith<$Res> {
  __$PurchaseCopyWithImpl(this._self, this._then);

  final _Purchase _self;
  final $Res Function(_Purchase) _then;

/// Create a copy of IapEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = freezed,}) {
  return _then(_Purchase(
productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _PurchaseCredits implements IapEvent {
  const _PurchaseCredits({required this.productId});
  

 final  String productId;

/// Create a copy of IapEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseCreditsCopyWith<_PurchaseCredits> get copyWith => __$PurchaseCreditsCopyWithImpl<_PurchaseCredits>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseCredits&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'IapEvent.purchaseCredits(productId: $productId)';
}


}

/// @nodoc
abstract mixin class _$PurchaseCreditsCopyWith<$Res> implements $IapEventCopyWith<$Res> {
  factory _$PurchaseCreditsCopyWith(_PurchaseCredits value, $Res Function(_PurchaseCredits) _then) = __$PurchaseCreditsCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class __$PurchaseCreditsCopyWithImpl<$Res>
    implements _$PurchaseCreditsCopyWith<$Res> {
  __$PurchaseCreditsCopyWithImpl(this._self, this._then);

  final _PurchaseCredits _self;
  final $Res Function(_PurchaseCredits) _then;

/// Create a copy of IapEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(_PurchaseCredits(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SelectCreditPackage implements IapEvent {
  const _SelectCreditPackage({required this.index});
  

 final  int index;

/// Create a copy of IapEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectCreditPackageCopyWith<_SelectCreditPackage> get copyWith => __$SelectCreditPackageCopyWithImpl<_SelectCreditPackage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectCreditPackage&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'IapEvent.selectCreditPackage(index: $index)';
}


}

/// @nodoc
abstract mixin class _$SelectCreditPackageCopyWith<$Res> implements $IapEventCopyWith<$Res> {
  factory _$SelectCreditPackageCopyWith(_SelectCreditPackage value, $Res Function(_SelectCreditPackage) _then) = __$SelectCreditPackageCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$SelectCreditPackageCopyWithImpl<$Res>
    implements _$SelectCreditPackageCopyWith<$Res> {
  __$SelectCreditPackageCopyWithImpl(this._self, this._then);

  final _SelectCreditPackage _self;
  final $Res Function(_SelectCreditPackage) _then;

/// Create a copy of IapEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_SelectCreditPackage(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Restore implements IapEvent {
  const _Restore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Restore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IapEvent.restore()';
}


}




// dart format on
