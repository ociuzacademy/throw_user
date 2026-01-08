// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_request_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeliveryRequestDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestDetailsState()';
}


}

/// @nodoc
class $DeliveryRequestDetailsStateCopyWith<$Res>  {
$DeliveryRequestDetailsStateCopyWith(DeliveryRequestDetailsState _, $Res Function(DeliveryRequestDetailsState) __);
}


/// Adds pattern-matching-related methods to [DeliveryRequestDetailsState].
extension DeliveryRequestDetailsStatePatterns on DeliveryRequestDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeliveryRequestDetailsInitial value)?  initial,TResult Function( DeliveryRequestDetailsLoading value)?  loading,TResult Function( DeliveryRequestDetailsSuccess value)?  success,TResult Function( DeliveryRequestDetailsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeliveryRequestDetailsInitial() when initial != null:
return initial(_that);case DeliveryRequestDetailsLoading() when loading != null:
return loading(_that);case DeliveryRequestDetailsSuccess() when success != null:
return success(_that);case DeliveryRequestDetailsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeliveryRequestDetailsInitial value)  initial,required TResult Function( DeliveryRequestDetailsLoading value)  loading,required TResult Function( DeliveryRequestDetailsSuccess value)  success,required TResult Function( DeliveryRequestDetailsError value)  error,}){
final _that = this;
switch (_that) {
case DeliveryRequestDetailsInitial():
return initial(_that);case DeliveryRequestDetailsLoading():
return loading(_that);case DeliveryRequestDetailsSuccess():
return success(_that);case DeliveryRequestDetailsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeliveryRequestDetailsInitial value)?  initial,TResult? Function( DeliveryRequestDetailsLoading value)?  loading,TResult? Function( DeliveryRequestDetailsSuccess value)?  success,TResult? Function( DeliveryRequestDetailsError value)?  error,}){
final _that = this;
switch (_that) {
case DeliveryRequestDetailsInitial() when initial != null:
return initial(_that);case DeliveryRequestDetailsLoading() when loading != null:
return loading(_that);case DeliveryRequestDetailsSuccess() when success != null:
return success(_that);case DeliveryRequestDetailsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DeliveryRequestModel deliveryRequest)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeliveryRequestDetailsInitial() when initial != null:
return initial();case DeliveryRequestDetailsLoading() when loading != null:
return loading();case DeliveryRequestDetailsSuccess() when success != null:
return success(_that.deliveryRequest);case DeliveryRequestDetailsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DeliveryRequestModel deliveryRequest)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case DeliveryRequestDetailsInitial():
return initial();case DeliveryRequestDetailsLoading():
return loading();case DeliveryRequestDetailsSuccess():
return success(_that.deliveryRequest);case DeliveryRequestDetailsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DeliveryRequestModel deliveryRequest)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case DeliveryRequestDetailsInitial() when initial != null:
return initial();case DeliveryRequestDetailsLoading() when loading != null:
return loading();case DeliveryRequestDetailsSuccess() when success != null:
return success(_that.deliveryRequest);case DeliveryRequestDetailsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DeliveryRequestDetailsInitial implements DeliveryRequestDetailsState {
  const DeliveryRequestDetailsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestDetailsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestDetailsState.initial()';
}


}




/// @nodoc


class DeliveryRequestDetailsLoading implements DeliveryRequestDetailsState {
  const DeliveryRequestDetailsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestDetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestDetailsState.loading()';
}


}




/// @nodoc


class DeliveryRequestDetailsSuccess implements DeliveryRequestDetailsState {
  const DeliveryRequestDetailsSuccess(this.deliveryRequest);
  

 final  DeliveryRequestModel deliveryRequest;

/// Create a copy of DeliveryRequestDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryRequestDetailsSuccessCopyWith<DeliveryRequestDetailsSuccess> get copyWith => _$DeliveryRequestDetailsSuccessCopyWithImpl<DeliveryRequestDetailsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestDetailsSuccess&&(identical(other.deliveryRequest, deliveryRequest) || other.deliveryRequest == deliveryRequest));
}


@override
int get hashCode => Object.hash(runtimeType,deliveryRequest);

@override
String toString() {
  return 'DeliveryRequestDetailsState.success(deliveryRequest: $deliveryRequest)';
}


}

/// @nodoc
abstract mixin class $DeliveryRequestDetailsSuccessCopyWith<$Res> implements $DeliveryRequestDetailsStateCopyWith<$Res> {
  factory $DeliveryRequestDetailsSuccessCopyWith(DeliveryRequestDetailsSuccess value, $Res Function(DeliveryRequestDetailsSuccess) _then) = _$DeliveryRequestDetailsSuccessCopyWithImpl;
@useResult
$Res call({
 DeliveryRequestModel deliveryRequest
});




}
/// @nodoc
class _$DeliveryRequestDetailsSuccessCopyWithImpl<$Res>
    implements $DeliveryRequestDetailsSuccessCopyWith<$Res> {
  _$DeliveryRequestDetailsSuccessCopyWithImpl(this._self, this._then);

  final DeliveryRequestDetailsSuccess _self;
  final $Res Function(DeliveryRequestDetailsSuccess) _then;

/// Create a copy of DeliveryRequestDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deliveryRequest = null,}) {
  return _then(DeliveryRequestDetailsSuccess(
null == deliveryRequest ? _self.deliveryRequest : deliveryRequest // ignore: cast_nullable_to_non_nullable
as DeliveryRequestModel,
  ));
}


}

/// @nodoc


class DeliveryRequestDetailsError implements DeliveryRequestDetailsState {
  const DeliveryRequestDetailsError(this.message);
  

 final  String message;

/// Create a copy of DeliveryRequestDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryRequestDetailsErrorCopyWith<DeliveryRequestDetailsError> get copyWith => _$DeliveryRequestDetailsErrorCopyWithImpl<DeliveryRequestDetailsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestDetailsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DeliveryRequestDetailsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DeliveryRequestDetailsErrorCopyWith<$Res> implements $DeliveryRequestDetailsStateCopyWith<$Res> {
  factory $DeliveryRequestDetailsErrorCopyWith(DeliveryRequestDetailsError value, $Res Function(DeliveryRequestDetailsError) _then) = _$DeliveryRequestDetailsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DeliveryRequestDetailsErrorCopyWithImpl<$Res>
    implements $DeliveryRequestDetailsErrorCopyWith<$Res> {
  _$DeliveryRequestDetailsErrorCopyWithImpl(this._self, this._then);

  final DeliveryRequestDetailsError _self;
  final $Res Function(DeliveryRequestDetailsError) _then;

/// Create a copy of DeliveryRequestDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DeliveryRequestDetailsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
