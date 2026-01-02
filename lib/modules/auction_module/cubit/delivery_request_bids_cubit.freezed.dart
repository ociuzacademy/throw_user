// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_request_bids_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeliveryRequestBidsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestBidsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestBidsState()';
}


}

/// @nodoc
class $DeliveryRequestBidsStateCopyWith<$Res>  {
$DeliveryRequestBidsStateCopyWith(DeliveryRequestBidsState _, $Res Function(DeliveryRequestBidsState) __);
}


/// Adds pattern-matching-related methods to [DeliveryRequestBidsState].
extension DeliveryRequestBidsStatePatterns on DeliveryRequestBidsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeliveryRequestBidsInitial value)?  initial,TResult Function( DeliveryRequestBidsLoading value)?  loading,TResult Function( DeliveryRequestBidsLoaded value)?  loaded,TResult Function( DeliveryRequestBidsEmpty value)?  empty,TResult Function( DeliveryRequestBidsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeliveryRequestBidsInitial() when initial != null:
return initial(_that);case DeliveryRequestBidsLoading() when loading != null:
return loading(_that);case DeliveryRequestBidsLoaded() when loaded != null:
return loaded(_that);case DeliveryRequestBidsEmpty() when empty != null:
return empty(_that);case DeliveryRequestBidsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeliveryRequestBidsInitial value)  initial,required TResult Function( DeliveryRequestBidsLoading value)  loading,required TResult Function( DeliveryRequestBidsLoaded value)  loaded,required TResult Function( DeliveryRequestBidsEmpty value)  empty,required TResult Function( DeliveryRequestBidsError value)  error,}){
final _that = this;
switch (_that) {
case DeliveryRequestBidsInitial():
return initial(_that);case DeliveryRequestBidsLoading():
return loading(_that);case DeliveryRequestBidsLoaded():
return loaded(_that);case DeliveryRequestBidsEmpty():
return empty(_that);case DeliveryRequestBidsError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeliveryRequestBidsInitial value)?  initial,TResult? Function( DeliveryRequestBidsLoading value)?  loading,TResult? Function( DeliveryRequestBidsLoaded value)?  loaded,TResult? Function( DeliveryRequestBidsEmpty value)?  empty,TResult? Function( DeliveryRequestBidsError value)?  error,}){
final _that = this;
switch (_that) {
case DeliveryRequestBidsInitial() when initial != null:
return initial(_that);case DeliveryRequestBidsLoading() when loading != null:
return loading(_that);case DeliveryRequestBidsLoaded() when loaded != null:
return loaded(_that);case DeliveryRequestBidsEmpty() when empty != null:
return empty(_that);case DeliveryRequestBidsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<BidModel> bids)?  loaded,TResult Function()?  empty,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeliveryRequestBidsInitial() when initial != null:
return initial();case DeliveryRequestBidsLoading() when loading != null:
return loading();case DeliveryRequestBidsLoaded() when loaded != null:
return loaded(_that.bids);case DeliveryRequestBidsEmpty() when empty != null:
return empty();case DeliveryRequestBidsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<BidModel> bids)  loaded,required TResult Function()  empty,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case DeliveryRequestBidsInitial():
return initial();case DeliveryRequestBidsLoading():
return loading();case DeliveryRequestBidsLoaded():
return loaded(_that.bids);case DeliveryRequestBidsEmpty():
return empty();case DeliveryRequestBidsError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<BidModel> bids)?  loaded,TResult? Function()?  empty,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case DeliveryRequestBidsInitial() when initial != null:
return initial();case DeliveryRequestBidsLoading() when loading != null:
return loading();case DeliveryRequestBidsLoaded() when loaded != null:
return loaded(_that.bids);case DeliveryRequestBidsEmpty() when empty != null:
return empty();case DeliveryRequestBidsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DeliveryRequestBidsInitial implements DeliveryRequestBidsState {
  const DeliveryRequestBidsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestBidsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestBidsState.initial()';
}


}




/// @nodoc


class DeliveryRequestBidsLoading implements DeliveryRequestBidsState {
  const DeliveryRequestBidsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestBidsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestBidsState.loading()';
}


}




/// @nodoc


class DeliveryRequestBidsLoaded implements DeliveryRequestBidsState {
  const DeliveryRequestBidsLoaded(final  List<BidModel> bids): _bids = bids;
  

 final  List<BidModel> _bids;
 List<BidModel> get bids {
  if (_bids is EqualUnmodifiableListView) return _bids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bids);
}


/// Create a copy of DeliveryRequestBidsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryRequestBidsLoadedCopyWith<DeliveryRequestBidsLoaded> get copyWith => _$DeliveryRequestBidsLoadedCopyWithImpl<DeliveryRequestBidsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestBidsLoaded&&const DeepCollectionEquality().equals(other._bids, _bids));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bids));

@override
String toString() {
  return 'DeliveryRequestBidsState.loaded(bids: $bids)';
}


}

/// @nodoc
abstract mixin class $DeliveryRequestBidsLoadedCopyWith<$Res> implements $DeliveryRequestBidsStateCopyWith<$Res> {
  factory $DeliveryRequestBidsLoadedCopyWith(DeliveryRequestBidsLoaded value, $Res Function(DeliveryRequestBidsLoaded) _then) = _$DeliveryRequestBidsLoadedCopyWithImpl;
@useResult
$Res call({
 List<BidModel> bids
});




}
/// @nodoc
class _$DeliveryRequestBidsLoadedCopyWithImpl<$Res>
    implements $DeliveryRequestBidsLoadedCopyWith<$Res> {
  _$DeliveryRequestBidsLoadedCopyWithImpl(this._self, this._then);

  final DeliveryRequestBidsLoaded _self;
  final $Res Function(DeliveryRequestBidsLoaded) _then;

/// Create a copy of DeliveryRequestBidsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bids = null,}) {
  return _then(DeliveryRequestBidsLoaded(
null == bids ? _self._bids : bids // ignore: cast_nullable_to_non_nullable
as List<BidModel>,
  ));
}


}

/// @nodoc


class DeliveryRequestBidsEmpty implements DeliveryRequestBidsState {
  const DeliveryRequestBidsEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestBidsEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestBidsState.empty()';
}


}




/// @nodoc


class DeliveryRequestBidsError implements DeliveryRequestBidsState {
  const DeliveryRequestBidsError(this.message);
  

 final  String message;

/// Create a copy of DeliveryRequestBidsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryRequestBidsErrorCopyWith<DeliveryRequestBidsError> get copyWith => _$DeliveryRequestBidsErrorCopyWithImpl<DeliveryRequestBidsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestBidsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DeliveryRequestBidsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DeliveryRequestBidsErrorCopyWith<$Res> implements $DeliveryRequestBidsStateCopyWith<$Res> {
  factory $DeliveryRequestBidsErrorCopyWith(DeliveryRequestBidsError value, $Res Function(DeliveryRequestBidsError) _then) = _$DeliveryRequestBidsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DeliveryRequestBidsErrorCopyWithImpl<$Res>
    implements $DeliveryRequestBidsErrorCopyWith<$Res> {
  _$DeliveryRequestBidsErrorCopyWithImpl(this._self, this._then);

  final DeliveryRequestBidsError _self;
  final $Res Function(DeliveryRequestBidsError) _then;

/// Create a copy of DeliveryRequestBidsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DeliveryRequestBidsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
