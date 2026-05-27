// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Ready value)?  ready,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Ready() when ready != null:
return ready(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Ready value)  ready,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Ready():
return ready(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Ready value)?  ready,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Ready() when ready != null:
return ready(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Resource<List<String>> categoriesState,  String selectedCategory,  Resource<List<String>> trendingVideosState,  Resource<List<String>> newVideosState,  String currentLocale)?  ready,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.categoriesState,_that.selectedCategory,_that.trendingVideosState,_that.newVideosState,_that.currentLocale);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Resource<List<String>> categoriesState,  String selectedCategory,  Resource<List<String>> trendingVideosState,  Resource<List<String>> newVideosState,  String currentLocale)  ready,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Ready():
return ready(_that.categoriesState,_that.selectedCategory,_that.trendingVideosState,_that.newVideosState,_that.currentLocale);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Resource<List<String>> categoriesState,  String selectedCategory,  Resource<List<String>> trendingVideosState,  Resource<List<String>> newVideosState,  String currentLocale)?  ready,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.categoriesState,_that.selectedCategory,_that.trendingVideosState,_that.newVideosState,_that.currentLocale);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements HomeState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.initial()';
}


}




/// @nodoc


class _Loading implements HomeState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.loading()';
}


}




/// @nodoc


class _Ready implements HomeState {
  const _Ready({required this.categoriesState, required this.selectedCategory, required this.trendingVideosState, required this.newVideosState, required this.currentLocale});
  

 final  Resource<List<String>> categoriesState;
 final  String selectedCategory;
 final  Resource<List<String>> trendingVideosState;
 final  Resource<List<String>> newVideosState;
 final  String currentLocale;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&(identical(other.categoriesState, categoriesState) || other.categoriesState == categoriesState)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.trendingVideosState, trendingVideosState) || other.trendingVideosState == trendingVideosState)&&(identical(other.newVideosState, newVideosState) || other.newVideosState == newVideosState)&&(identical(other.currentLocale, currentLocale) || other.currentLocale == currentLocale));
}


@override
int get hashCode => Object.hash(runtimeType,categoriesState,selectedCategory,trendingVideosState,newVideosState,currentLocale);

@override
String toString() {
  return 'HomeState.ready(categoriesState: $categoriesState, selectedCategory: $selectedCategory, trendingVideosState: $trendingVideosState, newVideosState: $newVideosState, currentLocale: $currentLocale)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 Resource<List<String>> categoriesState, String selectedCategory, Resource<List<String>> trendingVideosState, Resource<List<String>> newVideosState, String currentLocale
});


$ResourceCopyWith<List<String>, $Res> get categoriesState;$ResourceCopyWith<List<String>, $Res> get trendingVideosState;$ResourceCopyWith<List<String>, $Res> get newVideosState;

}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoriesState = null,Object? selectedCategory = null,Object? trendingVideosState = null,Object? newVideosState = null,Object? currentLocale = null,}) {
  return _then(_Ready(
categoriesState: null == categoriesState ? _self.categoriesState : categoriesState // ignore: cast_nullable_to_non_nullable
as Resource<List<String>>,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,trendingVideosState: null == trendingVideosState ? _self.trendingVideosState : trendingVideosState // ignore: cast_nullable_to_non_nullable
as Resource<List<String>>,newVideosState: null == newVideosState ? _self.newVideosState : newVideosState // ignore: cast_nullable_to_non_nullable
as Resource<List<String>>,currentLocale: null == currentLocale ? _self.currentLocale : currentLocale // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCopyWith<List<String>, $Res> get categoriesState {
  
  return $ResourceCopyWith<List<String>, $Res>(_self.categoriesState, (value) {
    return _then(_self.copyWith(categoriesState: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCopyWith<List<String>, $Res> get trendingVideosState {
  
  return $ResourceCopyWith<List<String>, $Res>(_self.trendingVideosState, (value) {
    return _then(_self.copyWith(trendingVideosState: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCopyWith<List<String>, $Res> get newVideosState {
  
  return $ResourceCopyWith<List<String>, $Res>(_self.newVideosState, (value) {
    return _then(_self.copyWith(newVideosState: value));
  });
}
}

/// @nodoc


class _Error implements HomeState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
