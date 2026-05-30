// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iap_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyProductRequestModel {

 String get productId; String get purchaseToken;
/// Create a copy of VerifyProductRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyProductRequestModelCopyWith<VerifyProductRequestModel> get copyWith => _$VerifyProductRequestModelCopyWithImpl<VerifyProductRequestModel>(this as VerifyProductRequestModel, _$identity);

  /// Serializes this VerifyProductRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyProductRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.purchaseToken, purchaseToken) || other.purchaseToken == purchaseToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,purchaseToken);

@override
String toString() {
  return 'VerifyProductRequestModel(productId: $productId, purchaseToken: $purchaseToken)';
}


}

/// @nodoc
abstract mixin class $VerifyProductRequestModelCopyWith<$Res>  {
  factory $VerifyProductRequestModelCopyWith(VerifyProductRequestModel value, $Res Function(VerifyProductRequestModel) _then) = _$VerifyProductRequestModelCopyWithImpl;
@useResult
$Res call({
 String productId, String purchaseToken
});




}
/// @nodoc
class _$VerifyProductRequestModelCopyWithImpl<$Res>
    implements $VerifyProductRequestModelCopyWith<$Res> {
  _$VerifyProductRequestModelCopyWithImpl(this._self, this._then);

  final VerifyProductRequestModel _self;
  final $Res Function(VerifyProductRequestModel) _then;

/// Create a copy of VerifyProductRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? purchaseToken = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,purchaseToken: null == purchaseToken ? _self.purchaseToken : purchaseToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyProductRequestModel].
extension VerifyProductRequestModelPatterns on VerifyProductRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyProductRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyProductRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyProductRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _VerifyProductRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyProductRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyProductRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId,  String purchaseToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyProductRequestModel() when $default != null:
return $default(_that.productId,_that.purchaseToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId,  String purchaseToken)  $default,) {final _that = this;
switch (_that) {
case _VerifyProductRequestModel():
return $default(_that.productId,_that.purchaseToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId,  String purchaseToken)?  $default,) {final _that = this;
switch (_that) {
case _VerifyProductRequestModel() when $default != null:
return $default(_that.productId,_that.purchaseToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyProductRequestModel implements VerifyProductRequestModel {
  const _VerifyProductRequestModel({required this.productId, required this.purchaseToken});
  factory _VerifyProductRequestModel.fromJson(Map<String, dynamic> json) => _$VerifyProductRequestModelFromJson(json);

@override final  String productId;
@override final  String purchaseToken;

/// Create a copy of VerifyProductRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyProductRequestModelCopyWith<_VerifyProductRequestModel> get copyWith => __$VerifyProductRequestModelCopyWithImpl<_VerifyProductRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyProductRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyProductRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.purchaseToken, purchaseToken) || other.purchaseToken == purchaseToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,purchaseToken);

@override
String toString() {
  return 'VerifyProductRequestModel(productId: $productId, purchaseToken: $purchaseToken)';
}


}

/// @nodoc
abstract mixin class _$VerifyProductRequestModelCopyWith<$Res> implements $VerifyProductRequestModelCopyWith<$Res> {
  factory _$VerifyProductRequestModelCopyWith(_VerifyProductRequestModel value, $Res Function(_VerifyProductRequestModel) _then) = __$VerifyProductRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String productId, String purchaseToken
});




}
/// @nodoc
class __$VerifyProductRequestModelCopyWithImpl<$Res>
    implements _$VerifyProductRequestModelCopyWith<$Res> {
  __$VerifyProductRequestModelCopyWithImpl(this._self, this._then);

  final _VerifyProductRequestModel _self;
  final $Res Function(_VerifyProductRequestModel) _then;

/// Create a copy of VerifyProductRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? purchaseToken = null,}) {
  return _then(_VerifyProductRequestModel(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,purchaseToken: null == purchaseToken ? _self.purchaseToken : purchaseToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$VerifySubscriptionRequestModel {

 String get productId; String get purchaseToken;
/// Create a copy of VerifySubscriptionRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifySubscriptionRequestModelCopyWith<VerifySubscriptionRequestModel> get copyWith => _$VerifySubscriptionRequestModelCopyWithImpl<VerifySubscriptionRequestModel>(this as VerifySubscriptionRequestModel, _$identity);

  /// Serializes this VerifySubscriptionRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifySubscriptionRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.purchaseToken, purchaseToken) || other.purchaseToken == purchaseToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,purchaseToken);

@override
String toString() {
  return 'VerifySubscriptionRequestModel(productId: $productId, purchaseToken: $purchaseToken)';
}


}

/// @nodoc
abstract mixin class $VerifySubscriptionRequestModelCopyWith<$Res>  {
  factory $VerifySubscriptionRequestModelCopyWith(VerifySubscriptionRequestModel value, $Res Function(VerifySubscriptionRequestModel) _then) = _$VerifySubscriptionRequestModelCopyWithImpl;
@useResult
$Res call({
 String productId, String purchaseToken
});




}
/// @nodoc
class _$VerifySubscriptionRequestModelCopyWithImpl<$Res>
    implements $VerifySubscriptionRequestModelCopyWith<$Res> {
  _$VerifySubscriptionRequestModelCopyWithImpl(this._self, this._then);

  final VerifySubscriptionRequestModel _self;
  final $Res Function(VerifySubscriptionRequestModel) _then;

/// Create a copy of VerifySubscriptionRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? purchaseToken = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,purchaseToken: null == purchaseToken ? _self.purchaseToken : purchaseToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifySubscriptionRequestModel].
extension VerifySubscriptionRequestModelPatterns on VerifySubscriptionRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifySubscriptionRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifySubscriptionRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifySubscriptionRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _VerifySubscriptionRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifySubscriptionRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerifySubscriptionRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId,  String purchaseToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifySubscriptionRequestModel() when $default != null:
return $default(_that.productId,_that.purchaseToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId,  String purchaseToken)  $default,) {final _that = this;
switch (_that) {
case _VerifySubscriptionRequestModel():
return $default(_that.productId,_that.purchaseToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId,  String purchaseToken)?  $default,) {final _that = this;
switch (_that) {
case _VerifySubscriptionRequestModel() when $default != null:
return $default(_that.productId,_that.purchaseToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifySubscriptionRequestModel implements VerifySubscriptionRequestModel {
  const _VerifySubscriptionRequestModel({required this.productId, required this.purchaseToken});
  factory _VerifySubscriptionRequestModel.fromJson(Map<String, dynamic> json) => _$VerifySubscriptionRequestModelFromJson(json);

@override final  String productId;
@override final  String purchaseToken;

/// Create a copy of VerifySubscriptionRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifySubscriptionRequestModelCopyWith<_VerifySubscriptionRequestModel> get copyWith => __$VerifySubscriptionRequestModelCopyWithImpl<_VerifySubscriptionRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifySubscriptionRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifySubscriptionRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.purchaseToken, purchaseToken) || other.purchaseToken == purchaseToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,purchaseToken);

@override
String toString() {
  return 'VerifySubscriptionRequestModel(productId: $productId, purchaseToken: $purchaseToken)';
}


}

/// @nodoc
abstract mixin class _$VerifySubscriptionRequestModelCopyWith<$Res> implements $VerifySubscriptionRequestModelCopyWith<$Res> {
  factory _$VerifySubscriptionRequestModelCopyWith(_VerifySubscriptionRequestModel value, $Res Function(_VerifySubscriptionRequestModel) _then) = __$VerifySubscriptionRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String productId, String purchaseToken
});




}
/// @nodoc
class __$VerifySubscriptionRequestModelCopyWithImpl<$Res>
    implements _$VerifySubscriptionRequestModelCopyWith<$Res> {
  __$VerifySubscriptionRequestModelCopyWithImpl(this._self, this._then);

  final _VerifySubscriptionRequestModel _self;
  final $Res Function(_VerifySubscriptionRequestModel) _then;

/// Create a copy of VerifySubscriptionRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? purchaseToken = null,}) {
  return _then(_VerifySubscriptionRequestModel(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,purchaseToken: null == purchaseToken ? _self.purchaseToken : purchaseToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RestoreSubscriptionRequestModel {

 String get productId; String get purchaseToken;
/// Create a copy of RestoreSubscriptionRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestoreSubscriptionRequestModelCopyWith<RestoreSubscriptionRequestModel> get copyWith => _$RestoreSubscriptionRequestModelCopyWithImpl<RestoreSubscriptionRequestModel>(this as RestoreSubscriptionRequestModel, _$identity);

  /// Serializes this RestoreSubscriptionRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestoreSubscriptionRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.purchaseToken, purchaseToken) || other.purchaseToken == purchaseToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,purchaseToken);

@override
String toString() {
  return 'RestoreSubscriptionRequestModel(productId: $productId, purchaseToken: $purchaseToken)';
}


}

/// @nodoc
abstract mixin class $RestoreSubscriptionRequestModelCopyWith<$Res>  {
  factory $RestoreSubscriptionRequestModelCopyWith(RestoreSubscriptionRequestModel value, $Res Function(RestoreSubscriptionRequestModel) _then) = _$RestoreSubscriptionRequestModelCopyWithImpl;
@useResult
$Res call({
 String productId, String purchaseToken
});




}
/// @nodoc
class _$RestoreSubscriptionRequestModelCopyWithImpl<$Res>
    implements $RestoreSubscriptionRequestModelCopyWith<$Res> {
  _$RestoreSubscriptionRequestModelCopyWithImpl(this._self, this._then);

  final RestoreSubscriptionRequestModel _self;
  final $Res Function(RestoreSubscriptionRequestModel) _then;

/// Create a copy of RestoreSubscriptionRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? purchaseToken = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,purchaseToken: null == purchaseToken ? _self.purchaseToken : purchaseToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RestoreSubscriptionRequestModel].
extension RestoreSubscriptionRequestModelPatterns on RestoreSubscriptionRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestoreSubscriptionRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestoreSubscriptionRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestoreSubscriptionRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _RestoreSubscriptionRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestoreSubscriptionRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _RestoreSubscriptionRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId,  String purchaseToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestoreSubscriptionRequestModel() when $default != null:
return $default(_that.productId,_that.purchaseToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId,  String purchaseToken)  $default,) {final _that = this;
switch (_that) {
case _RestoreSubscriptionRequestModel():
return $default(_that.productId,_that.purchaseToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId,  String purchaseToken)?  $default,) {final _that = this;
switch (_that) {
case _RestoreSubscriptionRequestModel() when $default != null:
return $default(_that.productId,_that.purchaseToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RestoreSubscriptionRequestModel implements RestoreSubscriptionRequestModel {
  const _RestoreSubscriptionRequestModel({required this.productId, required this.purchaseToken});
  factory _RestoreSubscriptionRequestModel.fromJson(Map<String, dynamic> json) => _$RestoreSubscriptionRequestModelFromJson(json);

@override final  String productId;
@override final  String purchaseToken;

/// Create a copy of RestoreSubscriptionRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestoreSubscriptionRequestModelCopyWith<_RestoreSubscriptionRequestModel> get copyWith => __$RestoreSubscriptionRequestModelCopyWithImpl<_RestoreSubscriptionRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestoreSubscriptionRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestoreSubscriptionRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.purchaseToken, purchaseToken) || other.purchaseToken == purchaseToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,purchaseToken);

@override
String toString() {
  return 'RestoreSubscriptionRequestModel(productId: $productId, purchaseToken: $purchaseToken)';
}


}

/// @nodoc
abstract mixin class _$RestoreSubscriptionRequestModelCopyWith<$Res> implements $RestoreSubscriptionRequestModelCopyWith<$Res> {
  factory _$RestoreSubscriptionRequestModelCopyWith(_RestoreSubscriptionRequestModel value, $Res Function(_RestoreSubscriptionRequestModel) _then) = __$RestoreSubscriptionRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String productId, String purchaseToken
});




}
/// @nodoc
class __$RestoreSubscriptionRequestModelCopyWithImpl<$Res>
    implements _$RestoreSubscriptionRequestModelCopyWith<$Res> {
  __$RestoreSubscriptionRequestModelCopyWithImpl(this._self, this._then);

  final _RestoreSubscriptionRequestModel _self;
  final $Res Function(_RestoreSubscriptionRequestModel) _then;

/// Create a copy of RestoreSubscriptionRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? purchaseToken = null,}) {
  return _then(_RestoreSubscriptionRequestModel(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,purchaseToken: null == purchaseToken ? _self.purchaseToken : purchaseToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$VerifyProductIosRequestModel {

 String get productId; String get transactionId;
/// Create a copy of VerifyProductIosRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyProductIosRequestModelCopyWith<VerifyProductIosRequestModel> get copyWith => _$VerifyProductIosRequestModelCopyWithImpl<VerifyProductIosRequestModel>(this as VerifyProductIosRequestModel, _$identity);

  /// Serializes this VerifyProductIosRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyProductIosRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,transactionId);

@override
String toString() {
  return 'VerifyProductIosRequestModel(productId: $productId, transactionId: $transactionId)';
}


}

/// @nodoc
abstract mixin class $VerifyProductIosRequestModelCopyWith<$Res>  {
  factory $VerifyProductIosRequestModelCopyWith(VerifyProductIosRequestModel value, $Res Function(VerifyProductIosRequestModel) _then) = _$VerifyProductIosRequestModelCopyWithImpl;
@useResult
$Res call({
 String productId, String transactionId
});




}
/// @nodoc
class _$VerifyProductIosRequestModelCopyWithImpl<$Res>
    implements $VerifyProductIosRequestModelCopyWith<$Res> {
  _$VerifyProductIosRequestModelCopyWithImpl(this._self, this._then);

  final VerifyProductIosRequestModel _self;
  final $Res Function(VerifyProductIosRequestModel) _then;

/// Create a copy of VerifyProductIosRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? transactionId = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyProductIosRequestModel].
extension VerifyProductIosRequestModelPatterns on VerifyProductIosRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyProductIosRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyProductIosRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyProductIosRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _VerifyProductIosRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyProductIosRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyProductIosRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId,  String transactionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyProductIosRequestModel() when $default != null:
return $default(_that.productId,_that.transactionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId,  String transactionId)  $default,) {final _that = this;
switch (_that) {
case _VerifyProductIosRequestModel():
return $default(_that.productId,_that.transactionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId,  String transactionId)?  $default,) {final _that = this;
switch (_that) {
case _VerifyProductIosRequestModel() when $default != null:
return $default(_that.productId,_that.transactionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyProductIosRequestModel implements VerifyProductIosRequestModel {
  const _VerifyProductIosRequestModel({required this.productId, required this.transactionId});
  factory _VerifyProductIosRequestModel.fromJson(Map<String, dynamic> json) => _$VerifyProductIosRequestModelFromJson(json);

@override final  String productId;
@override final  String transactionId;

/// Create a copy of VerifyProductIosRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyProductIosRequestModelCopyWith<_VerifyProductIosRequestModel> get copyWith => __$VerifyProductIosRequestModelCopyWithImpl<_VerifyProductIosRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyProductIosRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyProductIosRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,transactionId);

@override
String toString() {
  return 'VerifyProductIosRequestModel(productId: $productId, transactionId: $transactionId)';
}


}

/// @nodoc
abstract mixin class _$VerifyProductIosRequestModelCopyWith<$Res> implements $VerifyProductIosRequestModelCopyWith<$Res> {
  factory _$VerifyProductIosRequestModelCopyWith(_VerifyProductIosRequestModel value, $Res Function(_VerifyProductIosRequestModel) _then) = __$VerifyProductIosRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String productId, String transactionId
});




}
/// @nodoc
class __$VerifyProductIosRequestModelCopyWithImpl<$Res>
    implements _$VerifyProductIosRequestModelCopyWith<$Res> {
  __$VerifyProductIosRequestModelCopyWithImpl(this._self, this._then);

  final _VerifyProductIosRequestModel _self;
  final $Res Function(_VerifyProductIosRequestModel) _then;

/// Create a copy of VerifyProductIosRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? transactionId = null,}) {
  return _then(_VerifyProductIosRequestModel(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$VerifySubscriptionIosRequestModel {

 String get productId; String get transactionId;
/// Create a copy of VerifySubscriptionIosRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifySubscriptionIosRequestModelCopyWith<VerifySubscriptionIosRequestModel> get copyWith => _$VerifySubscriptionIosRequestModelCopyWithImpl<VerifySubscriptionIosRequestModel>(this as VerifySubscriptionIosRequestModel, _$identity);

  /// Serializes this VerifySubscriptionIosRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifySubscriptionIosRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,transactionId);

@override
String toString() {
  return 'VerifySubscriptionIosRequestModel(productId: $productId, transactionId: $transactionId)';
}


}

/// @nodoc
abstract mixin class $VerifySubscriptionIosRequestModelCopyWith<$Res>  {
  factory $VerifySubscriptionIosRequestModelCopyWith(VerifySubscriptionIosRequestModel value, $Res Function(VerifySubscriptionIosRequestModel) _then) = _$VerifySubscriptionIosRequestModelCopyWithImpl;
@useResult
$Res call({
 String productId, String transactionId
});




}
/// @nodoc
class _$VerifySubscriptionIosRequestModelCopyWithImpl<$Res>
    implements $VerifySubscriptionIosRequestModelCopyWith<$Res> {
  _$VerifySubscriptionIosRequestModelCopyWithImpl(this._self, this._then);

  final VerifySubscriptionIosRequestModel _self;
  final $Res Function(VerifySubscriptionIosRequestModel) _then;

/// Create a copy of VerifySubscriptionIosRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? transactionId = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifySubscriptionIosRequestModel].
extension VerifySubscriptionIosRequestModelPatterns on VerifySubscriptionIosRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifySubscriptionIosRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifySubscriptionIosRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifySubscriptionIosRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _VerifySubscriptionIosRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifySubscriptionIosRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerifySubscriptionIosRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId,  String transactionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifySubscriptionIosRequestModel() when $default != null:
return $default(_that.productId,_that.transactionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId,  String transactionId)  $default,) {final _that = this;
switch (_that) {
case _VerifySubscriptionIosRequestModel():
return $default(_that.productId,_that.transactionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId,  String transactionId)?  $default,) {final _that = this;
switch (_that) {
case _VerifySubscriptionIosRequestModel() when $default != null:
return $default(_that.productId,_that.transactionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifySubscriptionIosRequestModel implements VerifySubscriptionIosRequestModel {
  const _VerifySubscriptionIosRequestModel({required this.productId, required this.transactionId});
  factory _VerifySubscriptionIosRequestModel.fromJson(Map<String, dynamic> json) => _$VerifySubscriptionIosRequestModelFromJson(json);

@override final  String productId;
@override final  String transactionId;

/// Create a copy of VerifySubscriptionIosRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifySubscriptionIosRequestModelCopyWith<_VerifySubscriptionIosRequestModel> get copyWith => __$VerifySubscriptionIosRequestModelCopyWithImpl<_VerifySubscriptionIosRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifySubscriptionIosRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifySubscriptionIosRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,transactionId);

@override
String toString() {
  return 'VerifySubscriptionIosRequestModel(productId: $productId, transactionId: $transactionId)';
}


}

/// @nodoc
abstract mixin class _$VerifySubscriptionIosRequestModelCopyWith<$Res> implements $VerifySubscriptionIosRequestModelCopyWith<$Res> {
  factory _$VerifySubscriptionIosRequestModelCopyWith(_VerifySubscriptionIosRequestModel value, $Res Function(_VerifySubscriptionIosRequestModel) _then) = __$VerifySubscriptionIosRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String productId, String transactionId
});




}
/// @nodoc
class __$VerifySubscriptionIosRequestModelCopyWithImpl<$Res>
    implements _$VerifySubscriptionIosRequestModelCopyWith<$Res> {
  __$VerifySubscriptionIosRequestModelCopyWithImpl(this._self, this._then);

  final _VerifySubscriptionIosRequestModel _self;
  final $Res Function(_VerifySubscriptionIosRequestModel) _then;

/// Create a copy of VerifySubscriptionIosRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? transactionId = null,}) {
  return _then(_VerifySubscriptionIosRequestModel(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RestoreSubscriptionIosRequestModel {

 String get productId; String get transactionId;
/// Create a copy of RestoreSubscriptionIosRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestoreSubscriptionIosRequestModelCopyWith<RestoreSubscriptionIosRequestModel> get copyWith => _$RestoreSubscriptionIosRequestModelCopyWithImpl<RestoreSubscriptionIosRequestModel>(this as RestoreSubscriptionIosRequestModel, _$identity);

  /// Serializes this RestoreSubscriptionIosRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestoreSubscriptionIosRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,transactionId);

@override
String toString() {
  return 'RestoreSubscriptionIosRequestModel(productId: $productId, transactionId: $transactionId)';
}


}

/// @nodoc
abstract mixin class $RestoreSubscriptionIosRequestModelCopyWith<$Res>  {
  factory $RestoreSubscriptionIosRequestModelCopyWith(RestoreSubscriptionIosRequestModel value, $Res Function(RestoreSubscriptionIosRequestModel) _then) = _$RestoreSubscriptionIosRequestModelCopyWithImpl;
@useResult
$Res call({
 String productId, String transactionId
});




}
/// @nodoc
class _$RestoreSubscriptionIosRequestModelCopyWithImpl<$Res>
    implements $RestoreSubscriptionIosRequestModelCopyWith<$Res> {
  _$RestoreSubscriptionIosRequestModelCopyWithImpl(this._self, this._then);

  final RestoreSubscriptionIosRequestModel _self;
  final $Res Function(RestoreSubscriptionIosRequestModel) _then;

/// Create a copy of RestoreSubscriptionIosRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? transactionId = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RestoreSubscriptionIosRequestModel].
extension RestoreSubscriptionIosRequestModelPatterns on RestoreSubscriptionIosRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestoreSubscriptionIosRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestoreSubscriptionIosRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestoreSubscriptionIosRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _RestoreSubscriptionIosRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestoreSubscriptionIosRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _RestoreSubscriptionIosRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId,  String transactionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestoreSubscriptionIosRequestModel() when $default != null:
return $default(_that.productId,_that.transactionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId,  String transactionId)  $default,) {final _that = this;
switch (_that) {
case _RestoreSubscriptionIosRequestModel():
return $default(_that.productId,_that.transactionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId,  String transactionId)?  $default,) {final _that = this;
switch (_that) {
case _RestoreSubscriptionIosRequestModel() when $default != null:
return $default(_that.productId,_that.transactionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RestoreSubscriptionIosRequestModel implements RestoreSubscriptionIosRequestModel {
  const _RestoreSubscriptionIosRequestModel({required this.productId, required this.transactionId});
  factory _RestoreSubscriptionIosRequestModel.fromJson(Map<String, dynamic> json) => _$RestoreSubscriptionIosRequestModelFromJson(json);

@override final  String productId;
@override final  String transactionId;

/// Create a copy of RestoreSubscriptionIosRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestoreSubscriptionIosRequestModelCopyWith<_RestoreSubscriptionIosRequestModel> get copyWith => __$RestoreSubscriptionIosRequestModelCopyWithImpl<_RestoreSubscriptionIosRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestoreSubscriptionIosRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestoreSubscriptionIosRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,transactionId);

@override
String toString() {
  return 'RestoreSubscriptionIosRequestModel(productId: $productId, transactionId: $transactionId)';
}


}

/// @nodoc
abstract mixin class _$RestoreSubscriptionIosRequestModelCopyWith<$Res> implements $RestoreSubscriptionIosRequestModelCopyWith<$Res> {
  factory _$RestoreSubscriptionIosRequestModelCopyWith(_RestoreSubscriptionIosRequestModel value, $Res Function(_RestoreSubscriptionIosRequestModel) _then) = __$RestoreSubscriptionIosRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String productId, String transactionId
});




}
/// @nodoc
class __$RestoreSubscriptionIosRequestModelCopyWithImpl<$Res>
    implements _$RestoreSubscriptionIosRequestModelCopyWith<$Res> {
  __$RestoreSubscriptionIosRequestModelCopyWithImpl(this._self, this._then);

  final _RestoreSubscriptionIosRequestModel _self;
  final $Res Function(_RestoreSubscriptionIosRequestModel) _then;

/// Create a copy of RestoreSubscriptionIosRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? transactionId = null,}) {
  return _then(_RestoreSubscriptionIosRequestModel(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GoogleWebhookRequestModel {

 GoogleWebhookMessageModel get message; String get subscription;
/// Create a copy of GoogleWebhookRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleWebhookRequestModelCopyWith<GoogleWebhookRequestModel> get copyWith => _$GoogleWebhookRequestModelCopyWithImpl<GoogleWebhookRequestModel>(this as GoogleWebhookRequestModel, _$identity);

  /// Serializes this GoogleWebhookRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleWebhookRequestModel&&(identical(other.message, message) || other.message == message)&&(identical(other.subscription, subscription) || other.subscription == subscription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,subscription);

@override
String toString() {
  return 'GoogleWebhookRequestModel(message: $message, subscription: $subscription)';
}


}

/// @nodoc
abstract mixin class $GoogleWebhookRequestModelCopyWith<$Res>  {
  factory $GoogleWebhookRequestModelCopyWith(GoogleWebhookRequestModel value, $Res Function(GoogleWebhookRequestModel) _then) = _$GoogleWebhookRequestModelCopyWithImpl;
@useResult
$Res call({
 GoogleWebhookMessageModel message, String subscription
});


$GoogleWebhookMessageModelCopyWith<$Res> get message;

}
/// @nodoc
class _$GoogleWebhookRequestModelCopyWithImpl<$Res>
    implements $GoogleWebhookRequestModelCopyWith<$Res> {
  _$GoogleWebhookRequestModelCopyWithImpl(this._self, this._then);

  final GoogleWebhookRequestModel _self;
  final $Res Function(GoogleWebhookRequestModel) _then;

/// Create a copy of GoogleWebhookRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? subscription = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as GoogleWebhookMessageModel,subscription: null == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of GoogleWebhookRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoogleWebhookMessageModelCopyWith<$Res> get message {
  
  return $GoogleWebhookMessageModelCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// Adds pattern-matching-related methods to [GoogleWebhookRequestModel].
extension GoogleWebhookRequestModelPatterns on GoogleWebhookRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoogleWebhookRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoogleWebhookRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoogleWebhookRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _GoogleWebhookRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoogleWebhookRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _GoogleWebhookRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GoogleWebhookMessageModel message,  String subscription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleWebhookRequestModel() when $default != null:
return $default(_that.message,_that.subscription);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GoogleWebhookMessageModel message,  String subscription)  $default,) {final _that = this;
switch (_that) {
case _GoogleWebhookRequestModel():
return $default(_that.message,_that.subscription);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GoogleWebhookMessageModel message,  String subscription)?  $default,) {final _that = this;
switch (_that) {
case _GoogleWebhookRequestModel() when $default != null:
return $default(_that.message,_that.subscription);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoogleWebhookRequestModel implements GoogleWebhookRequestModel {
  const _GoogleWebhookRequestModel({required this.message, required this.subscription});
  factory _GoogleWebhookRequestModel.fromJson(Map<String, dynamic> json) => _$GoogleWebhookRequestModelFromJson(json);

@override final  GoogleWebhookMessageModel message;
@override final  String subscription;

/// Create a copy of GoogleWebhookRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoogleWebhookRequestModelCopyWith<_GoogleWebhookRequestModel> get copyWith => __$GoogleWebhookRequestModelCopyWithImpl<_GoogleWebhookRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoogleWebhookRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleWebhookRequestModel&&(identical(other.message, message) || other.message == message)&&(identical(other.subscription, subscription) || other.subscription == subscription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,subscription);

@override
String toString() {
  return 'GoogleWebhookRequestModel(message: $message, subscription: $subscription)';
}


}

/// @nodoc
abstract mixin class _$GoogleWebhookRequestModelCopyWith<$Res> implements $GoogleWebhookRequestModelCopyWith<$Res> {
  factory _$GoogleWebhookRequestModelCopyWith(_GoogleWebhookRequestModel value, $Res Function(_GoogleWebhookRequestModel) _then) = __$GoogleWebhookRequestModelCopyWithImpl;
@override @useResult
$Res call({
 GoogleWebhookMessageModel message, String subscription
});


@override $GoogleWebhookMessageModelCopyWith<$Res> get message;

}
/// @nodoc
class __$GoogleWebhookRequestModelCopyWithImpl<$Res>
    implements _$GoogleWebhookRequestModelCopyWith<$Res> {
  __$GoogleWebhookRequestModelCopyWithImpl(this._self, this._then);

  final _GoogleWebhookRequestModel _self;
  final $Res Function(_GoogleWebhookRequestModel) _then;

/// Create a copy of GoogleWebhookRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? subscription = null,}) {
  return _then(_GoogleWebhookRequestModel(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as GoogleWebhookMessageModel,subscription: null == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of GoogleWebhookRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoogleWebhookMessageModelCopyWith<$Res> get message {
  
  return $GoogleWebhookMessageModelCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// @nodoc
mixin _$GoogleWebhookMessageModel {

 String get data; String get messageId; String get publishTime;
/// Create a copy of GoogleWebhookMessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleWebhookMessageModelCopyWith<GoogleWebhookMessageModel> get copyWith => _$GoogleWebhookMessageModelCopyWithImpl<GoogleWebhookMessageModel>(this as GoogleWebhookMessageModel, _$identity);

  /// Serializes this GoogleWebhookMessageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleWebhookMessageModel&&(identical(other.data, data) || other.data == data)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.publishTime, publishTime) || other.publishTime == publishTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,messageId,publishTime);

@override
String toString() {
  return 'GoogleWebhookMessageModel(data: $data, messageId: $messageId, publishTime: $publishTime)';
}


}

/// @nodoc
abstract mixin class $GoogleWebhookMessageModelCopyWith<$Res>  {
  factory $GoogleWebhookMessageModelCopyWith(GoogleWebhookMessageModel value, $Res Function(GoogleWebhookMessageModel) _then) = _$GoogleWebhookMessageModelCopyWithImpl;
@useResult
$Res call({
 String data, String messageId, String publishTime
});




}
/// @nodoc
class _$GoogleWebhookMessageModelCopyWithImpl<$Res>
    implements $GoogleWebhookMessageModelCopyWith<$Res> {
  _$GoogleWebhookMessageModelCopyWithImpl(this._self, this._then);

  final GoogleWebhookMessageModel _self;
  final $Res Function(GoogleWebhookMessageModel) _then;

/// Create a copy of GoogleWebhookMessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? messageId = null,Object? publishTime = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,publishTime: null == publishTime ? _self.publishTime : publishTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GoogleWebhookMessageModel].
extension GoogleWebhookMessageModelPatterns on GoogleWebhookMessageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoogleWebhookMessageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoogleWebhookMessageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoogleWebhookMessageModel value)  $default,){
final _that = this;
switch (_that) {
case _GoogleWebhookMessageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoogleWebhookMessageModel value)?  $default,){
final _that = this;
switch (_that) {
case _GoogleWebhookMessageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String data,  String messageId,  String publishTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleWebhookMessageModel() when $default != null:
return $default(_that.data,_that.messageId,_that.publishTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String data,  String messageId,  String publishTime)  $default,) {final _that = this;
switch (_that) {
case _GoogleWebhookMessageModel():
return $default(_that.data,_that.messageId,_that.publishTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String data,  String messageId,  String publishTime)?  $default,) {final _that = this;
switch (_that) {
case _GoogleWebhookMessageModel() when $default != null:
return $default(_that.data,_that.messageId,_that.publishTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoogleWebhookMessageModel implements GoogleWebhookMessageModel {
  const _GoogleWebhookMessageModel({required this.data, required this.messageId, required this.publishTime});
  factory _GoogleWebhookMessageModel.fromJson(Map<String, dynamic> json) => _$GoogleWebhookMessageModelFromJson(json);

@override final  String data;
@override final  String messageId;
@override final  String publishTime;

/// Create a copy of GoogleWebhookMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoogleWebhookMessageModelCopyWith<_GoogleWebhookMessageModel> get copyWith => __$GoogleWebhookMessageModelCopyWithImpl<_GoogleWebhookMessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoogleWebhookMessageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleWebhookMessageModel&&(identical(other.data, data) || other.data == data)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.publishTime, publishTime) || other.publishTime == publishTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,messageId,publishTime);

@override
String toString() {
  return 'GoogleWebhookMessageModel(data: $data, messageId: $messageId, publishTime: $publishTime)';
}


}

/// @nodoc
abstract mixin class _$GoogleWebhookMessageModelCopyWith<$Res> implements $GoogleWebhookMessageModelCopyWith<$Res> {
  factory _$GoogleWebhookMessageModelCopyWith(_GoogleWebhookMessageModel value, $Res Function(_GoogleWebhookMessageModel) _then) = __$GoogleWebhookMessageModelCopyWithImpl;
@override @useResult
$Res call({
 String data, String messageId, String publishTime
});




}
/// @nodoc
class __$GoogleWebhookMessageModelCopyWithImpl<$Res>
    implements _$GoogleWebhookMessageModelCopyWith<$Res> {
  __$GoogleWebhookMessageModelCopyWithImpl(this._self, this._then);

  final _GoogleWebhookMessageModel _self;
  final $Res Function(_GoogleWebhookMessageModel) _then;

/// Create a copy of GoogleWebhookMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? messageId = null,Object? publishTime = null,}) {
  return _then(_GoogleWebhookMessageModel(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,publishTime: null == publishTime ? _self.publishTime : publishTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AppleWebhookRequestModel {

 String get signedPayload;
/// Create a copy of AppleWebhookRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppleWebhookRequestModelCopyWith<AppleWebhookRequestModel> get copyWith => _$AppleWebhookRequestModelCopyWithImpl<AppleWebhookRequestModel>(this as AppleWebhookRequestModel, _$identity);

  /// Serializes this AppleWebhookRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppleWebhookRequestModel&&(identical(other.signedPayload, signedPayload) || other.signedPayload == signedPayload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,signedPayload);

@override
String toString() {
  return 'AppleWebhookRequestModel(signedPayload: $signedPayload)';
}


}

/// @nodoc
abstract mixin class $AppleWebhookRequestModelCopyWith<$Res>  {
  factory $AppleWebhookRequestModelCopyWith(AppleWebhookRequestModel value, $Res Function(AppleWebhookRequestModel) _then) = _$AppleWebhookRequestModelCopyWithImpl;
@useResult
$Res call({
 String signedPayload
});




}
/// @nodoc
class _$AppleWebhookRequestModelCopyWithImpl<$Res>
    implements $AppleWebhookRequestModelCopyWith<$Res> {
  _$AppleWebhookRequestModelCopyWithImpl(this._self, this._then);

  final AppleWebhookRequestModel _self;
  final $Res Function(AppleWebhookRequestModel) _then;

/// Create a copy of AppleWebhookRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? signedPayload = null,}) {
  return _then(_self.copyWith(
signedPayload: null == signedPayload ? _self.signedPayload : signedPayload // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppleWebhookRequestModel].
extension AppleWebhookRequestModelPatterns on AppleWebhookRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppleWebhookRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppleWebhookRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppleWebhookRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _AppleWebhookRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppleWebhookRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppleWebhookRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String signedPayload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppleWebhookRequestModel() when $default != null:
return $default(_that.signedPayload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String signedPayload)  $default,) {final _that = this;
switch (_that) {
case _AppleWebhookRequestModel():
return $default(_that.signedPayload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String signedPayload)?  $default,) {final _that = this;
switch (_that) {
case _AppleWebhookRequestModel() when $default != null:
return $default(_that.signedPayload);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppleWebhookRequestModel implements AppleWebhookRequestModel {
  const _AppleWebhookRequestModel({required this.signedPayload});
  factory _AppleWebhookRequestModel.fromJson(Map<String, dynamic> json) => _$AppleWebhookRequestModelFromJson(json);

@override final  String signedPayload;

/// Create a copy of AppleWebhookRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppleWebhookRequestModelCopyWith<_AppleWebhookRequestModel> get copyWith => __$AppleWebhookRequestModelCopyWithImpl<_AppleWebhookRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppleWebhookRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppleWebhookRequestModel&&(identical(other.signedPayload, signedPayload) || other.signedPayload == signedPayload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,signedPayload);

@override
String toString() {
  return 'AppleWebhookRequestModel(signedPayload: $signedPayload)';
}


}

/// @nodoc
abstract mixin class _$AppleWebhookRequestModelCopyWith<$Res> implements $AppleWebhookRequestModelCopyWith<$Res> {
  factory _$AppleWebhookRequestModelCopyWith(_AppleWebhookRequestModel value, $Res Function(_AppleWebhookRequestModel) _then) = __$AppleWebhookRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String signedPayload
});




}
/// @nodoc
class __$AppleWebhookRequestModelCopyWithImpl<$Res>
    implements _$AppleWebhookRequestModelCopyWith<$Res> {
  __$AppleWebhookRequestModelCopyWithImpl(this._self, this._then);

  final _AppleWebhookRequestModel _self;
  final $Res Function(_AppleWebhookRequestModel) _then;

/// Create a copy of AppleWebhookRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? signedPayload = null,}) {
  return _then(_AppleWebhookRequestModel(
signedPayload: null == signedPayload ? _self.signedPayload : signedPayload // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
