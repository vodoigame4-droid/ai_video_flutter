// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buy_credits_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BuyCreditsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyCreditsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BuyCreditsEvent()';
}


}

/// @nodoc
class $BuyCreditsEventCopyWith<$Res>  {
$BuyCreditsEventCopyWith(BuyCreditsEvent _, $Res Function(BuyCreditsEvent) __);
}


/// Adds pattern-matching-related methods to [BuyCreditsEvent].
extension BuyCreditsEventPatterns on BuyCreditsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _PurchaseCredits value)?  purchaseCredits,TResult Function( _ToggleReveal value)?  toggleReveal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _PurchaseCredits() when purchaseCredits != null:
return purchaseCredits(_that);case _ToggleReveal() when toggleReveal != null:
return toggleReveal(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _PurchaseCredits value)  purchaseCredits,required TResult Function( _ToggleReveal value)  toggleReveal,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _PurchaseCredits():
return purchaseCredits(_that);case _ToggleReveal():
return toggleReveal(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _PurchaseCredits value)?  purchaseCredits,TResult? Function( _ToggleReveal value)?  toggleReveal,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _PurchaseCredits() when purchaseCredits != null:
return purchaseCredits(_that);case _ToggleReveal() when toggleReveal != null:
return toggleReveal(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( int credits,  String priceText)?  purchaseCredits,TResult Function()?  toggleReveal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _PurchaseCredits() when purchaseCredits != null:
return purchaseCredits(_that.credits,_that.priceText);case _ToggleReveal() when toggleReveal != null:
return toggleReveal();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( int credits,  String priceText)  purchaseCredits,required TResult Function()  toggleReveal,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _PurchaseCredits():
return purchaseCredits(_that.credits,_that.priceText);case _ToggleReveal():
return toggleReveal();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( int credits,  String priceText)?  purchaseCredits,TResult? Function()?  toggleReveal,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _PurchaseCredits() when purchaseCredits != null:
return purchaseCredits(_that.credits,_that.priceText);case _ToggleReveal() when toggleReveal != null:
return toggleReveal();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements BuyCreditsEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BuyCreditsEvent.init()';
}


}




/// @nodoc


class _PurchaseCredits implements BuyCreditsEvent {
  const _PurchaseCredits({required this.credits, required this.priceText});
  

 final  int credits;
 final  String priceText;

/// Create a copy of BuyCreditsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseCreditsCopyWith<_PurchaseCredits> get copyWith => __$PurchaseCreditsCopyWithImpl<_PurchaseCredits>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseCredits&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.priceText, priceText) || other.priceText == priceText));
}


@override
int get hashCode => Object.hash(runtimeType,credits,priceText);

@override
String toString() {
  return 'BuyCreditsEvent.purchaseCredits(credits: $credits, priceText: $priceText)';
}


}

/// @nodoc
abstract mixin class _$PurchaseCreditsCopyWith<$Res> implements $BuyCreditsEventCopyWith<$Res> {
  factory _$PurchaseCreditsCopyWith(_PurchaseCredits value, $Res Function(_PurchaseCredits) _then) = __$PurchaseCreditsCopyWithImpl;
@useResult
$Res call({
 int credits, String priceText
});




}
/// @nodoc
class __$PurchaseCreditsCopyWithImpl<$Res>
    implements _$PurchaseCreditsCopyWith<$Res> {
  __$PurchaseCreditsCopyWithImpl(this._self, this._then);

  final _PurchaseCredits _self;
  final $Res Function(_PurchaseCredits) _then;

/// Create a copy of BuyCreditsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? credits = null,Object? priceText = null,}) {
  return _then(_PurchaseCredits(
credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,priceText: null == priceText ? _self.priceText : priceText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ToggleReveal implements BuyCreditsEvent {
  const _ToggleReveal();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleReveal);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BuyCreditsEvent.toggleReveal()';
}


}




// dart format on
