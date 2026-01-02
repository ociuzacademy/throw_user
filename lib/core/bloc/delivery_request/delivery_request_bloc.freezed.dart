// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_request_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeliveryRequestEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestEvent()';
}


}

/// @nodoc
class $DeliveryRequestEventCopyWith<$Res>  {
$DeliveryRequestEventCopyWith(DeliveryRequestEvent _, $Res Function(DeliveryRequestEvent) __);
}


/// Adds pattern-matching-related methods to [DeliveryRequestEvent].
extension DeliveryRequestEventPatterns on DeliveryRequestEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _CreateDeliveryRequest value)?  createDeliveryRequest,TResult Function( _CancelRequest value)?  cancelRequest,TResult Function( _AcceptRequest value)?  acceptRequest,TResult Function( _PayEscrowAmount value)?  payEscrowAmount,TResult Function( _SetDeliveryOnTheWay value)?  setDeliveryOnTheWay,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CreateDeliveryRequest() when createDeliveryRequest != null:
return createDeliveryRequest(_that);case _CancelRequest() when cancelRequest != null:
return cancelRequest(_that);case _AcceptRequest() when acceptRequest != null:
return acceptRequest(_that);case _PayEscrowAmount() when payEscrowAmount != null:
return payEscrowAmount(_that);case _SetDeliveryOnTheWay() when setDeliveryOnTheWay != null:
return setDeliveryOnTheWay(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _CreateDeliveryRequest value)  createDeliveryRequest,required TResult Function( _CancelRequest value)  cancelRequest,required TResult Function( _AcceptRequest value)  acceptRequest,required TResult Function( _PayEscrowAmount value)  payEscrowAmount,required TResult Function( _SetDeliveryOnTheWay value)  setDeliveryOnTheWay,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _CreateDeliveryRequest():
return createDeliveryRequest(_that);case _CancelRequest():
return cancelRequest(_that);case _AcceptRequest():
return acceptRequest(_that);case _PayEscrowAmount():
return payEscrowAmount(_that);case _SetDeliveryOnTheWay():
return setDeliveryOnTheWay(_that);case _Reset():
return reset(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _CreateDeliveryRequest value)?  createDeliveryRequest,TResult? Function( _CancelRequest value)?  cancelRequest,TResult? Function( _AcceptRequest value)?  acceptRequest,TResult? Function( _PayEscrowAmount value)?  payEscrowAmount,TResult? Function( _SetDeliveryOnTheWay value)?  setDeliveryOnTheWay,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CreateDeliveryRequest() when createDeliveryRequest != null:
return createDeliveryRequest(_that);case _CancelRequest() when cancelRequest != null:
return cancelRequest(_that);case _AcceptRequest() when acceptRequest != null:
return acceptRequest(_that);case _PayEscrowAmount() when payEscrowAmount != null:
return payEscrowAmount(_that);case _SetDeliveryOnTheWay() when setDeliveryOnTheWay != null:
return setDeliveryOnTheWay(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( DeliveryRequestData deliveryRequestData)?  createDeliveryRequest,TResult Function( String requestId)?  cancelRequest,TResult Function( String requestId,  String deliveryAgentId,  double agreedDeliveryCharge)?  acceptRequest,TResult Function( String requestId)?  payEscrowAmount,TResult Function( String requestId)?  setDeliveryOnTheWay,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CreateDeliveryRequest() when createDeliveryRequest != null:
return createDeliveryRequest(_that.deliveryRequestData);case _CancelRequest() when cancelRequest != null:
return cancelRequest(_that.requestId);case _AcceptRequest() when acceptRequest != null:
return acceptRequest(_that.requestId,_that.deliveryAgentId,_that.agreedDeliveryCharge);case _PayEscrowAmount() when payEscrowAmount != null:
return payEscrowAmount(_that.requestId);case _SetDeliveryOnTheWay() when setDeliveryOnTheWay != null:
return setDeliveryOnTheWay(_that.requestId);case _Reset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( DeliveryRequestData deliveryRequestData)  createDeliveryRequest,required TResult Function( String requestId)  cancelRequest,required TResult Function( String requestId,  String deliveryAgentId,  double agreedDeliveryCharge)  acceptRequest,required TResult Function( String requestId)  payEscrowAmount,required TResult Function( String requestId)  setDeliveryOnTheWay,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _CreateDeliveryRequest():
return createDeliveryRequest(_that.deliveryRequestData);case _CancelRequest():
return cancelRequest(_that.requestId);case _AcceptRequest():
return acceptRequest(_that.requestId,_that.deliveryAgentId,_that.agreedDeliveryCharge);case _PayEscrowAmount():
return payEscrowAmount(_that.requestId);case _SetDeliveryOnTheWay():
return setDeliveryOnTheWay(_that.requestId);case _Reset():
return reset();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( DeliveryRequestData deliveryRequestData)?  createDeliveryRequest,TResult? Function( String requestId)?  cancelRequest,TResult? Function( String requestId,  String deliveryAgentId,  double agreedDeliveryCharge)?  acceptRequest,TResult? Function( String requestId)?  payEscrowAmount,TResult? Function( String requestId)?  setDeliveryOnTheWay,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CreateDeliveryRequest() when createDeliveryRequest != null:
return createDeliveryRequest(_that.deliveryRequestData);case _CancelRequest() when cancelRequest != null:
return cancelRequest(_that.requestId);case _AcceptRequest() when acceptRequest != null:
return acceptRequest(_that.requestId,_that.deliveryAgentId,_that.agreedDeliveryCharge);case _PayEscrowAmount() when payEscrowAmount != null:
return payEscrowAmount(_that.requestId);case _SetDeliveryOnTheWay() when setDeliveryOnTheWay != null:
return setDeliveryOnTheWay(_that.requestId);case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements DeliveryRequestEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestEvent.started()';
}


}




/// @nodoc


class _CreateDeliveryRequest implements DeliveryRequestEvent {
  const _CreateDeliveryRequest(this.deliveryRequestData);
  

 final  DeliveryRequestData deliveryRequestData;

/// Create a copy of DeliveryRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDeliveryRequestCopyWith<_CreateDeliveryRequest> get copyWith => __$CreateDeliveryRequestCopyWithImpl<_CreateDeliveryRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDeliveryRequest&&(identical(other.deliveryRequestData, deliveryRequestData) || other.deliveryRequestData == deliveryRequestData));
}


@override
int get hashCode => Object.hash(runtimeType,deliveryRequestData);

@override
String toString() {
  return 'DeliveryRequestEvent.createDeliveryRequest(deliveryRequestData: $deliveryRequestData)';
}


}

/// @nodoc
abstract mixin class _$CreateDeliveryRequestCopyWith<$Res> implements $DeliveryRequestEventCopyWith<$Res> {
  factory _$CreateDeliveryRequestCopyWith(_CreateDeliveryRequest value, $Res Function(_CreateDeliveryRequest) _then) = __$CreateDeliveryRequestCopyWithImpl;
@useResult
$Res call({
 DeliveryRequestData deliveryRequestData
});




}
/// @nodoc
class __$CreateDeliveryRequestCopyWithImpl<$Res>
    implements _$CreateDeliveryRequestCopyWith<$Res> {
  __$CreateDeliveryRequestCopyWithImpl(this._self, this._then);

  final _CreateDeliveryRequest _self;
  final $Res Function(_CreateDeliveryRequest) _then;

/// Create a copy of DeliveryRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deliveryRequestData = null,}) {
  return _then(_CreateDeliveryRequest(
null == deliveryRequestData ? _self.deliveryRequestData : deliveryRequestData // ignore: cast_nullable_to_non_nullable
as DeliveryRequestData,
  ));
}


}

/// @nodoc


class _CancelRequest implements DeliveryRequestEvent {
  const _CancelRequest(this.requestId);
  

 final  String requestId;

/// Create a copy of DeliveryRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelRequestCopyWith<_CancelRequest> get copyWith => __$CancelRequestCopyWithImpl<_CancelRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelRequest&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'DeliveryRequestEvent.cancelRequest(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$CancelRequestCopyWith<$Res> implements $DeliveryRequestEventCopyWith<$Res> {
  factory _$CancelRequestCopyWith(_CancelRequest value, $Res Function(_CancelRequest) _then) = __$CancelRequestCopyWithImpl;
@useResult
$Res call({
 String requestId
});




}
/// @nodoc
class __$CancelRequestCopyWithImpl<$Res>
    implements _$CancelRequestCopyWith<$Res> {
  __$CancelRequestCopyWithImpl(this._self, this._then);

  final _CancelRequest _self;
  final $Res Function(_CancelRequest) _then;

/// Create a copy of DeliveryRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,}) {
  return _then(_CancelRequest(
null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AcceptRequest implements DeliveryRequestEvent {
  const _AcceptRequest(this.requestId, this.deliveryAgentId, this.agreedDeliveryCharge);
  

 final  String requestId;
 final  String deliveryAgentId;
 final  double agreedDeliveryCharge;

/// Create a copy of DeliveryRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AcceptRequestCopyWith<_AcceptRequest> get copyWith => __$AcceptRequestCopyWithImpl<_AcceptRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AcceptRequest&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.deliveryAgentId, deliveryAgentId) || other.deliveryAgentId == deliveryAgentId)&&(identical(other.agreedDeliveryCharge, agreedDeliveryCharge) || other.agreedDeliveryCharge == agreedDeliveryCharge));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,deliveryAgentId,agreedDeliveryCharge);

@override
String toString() {
  return 'DeliveryRequestEvent.acceptRequest(requestId: $requestId, deliveryAgentId: $deliveryAgentId, agreedDeliveryCharge: $agreedDeliveryCharge)';
}


}

/// @nodoc
abstract mixin class _$AcceptRequestCopyWith<$Res> implements $DeliveryRequestEventCopyWith<$Res> {
  factory _$AcceptRequestCopyWith(_AcceptRequest value, $Res Function(_AcceptRequest) _then) = __$AcceptRequestCopyWithImpl;
@useResult
$Res call({
 String requestId, String deliveryAgentId, double agreedDeliveryCharge
});




}
/// @nodoc
class __$AcceptRequestCopyWithImpl<$Res>
    implements _$AcceptRequestCopyWith<$Res> {
  __$AcceptRequestCopyWithImpl(this._self, this._then);

  final _AcceptRequest _self;
  final $Res Function(_AcceptRequest) _then;

/// Create a copy of DeliveryRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? deliveryAgentId = null,Object? agreedDeliveryCharge = null,}) {
  return _then(_AcceptRequest(
null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,null == deliveryAgentId ? _self.deliveryAgentId : deliveryAgentId // ignore: cast_nullable_to_non_nullable
as String,null == agreedDeliveryCharge ? _self.agreedDeliveryCharge : agreedDeliveryCharge // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _PayEscrowAmount implements DeliveryRequestEvent {
  const _PayEscrowAmount(this.requestId);
  

 final  String requestId;

/// Create a copy of DeliveryRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayEscrowAmountCopyWith<_PayEscrowAmount> get copyWith => __$PayEscrowAmountCopyWithImpl<_PayEscrowAmount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayEscrowAmount&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'DeliveryRequestEvent.payEscrowAmount(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$PayEscrowAmountCopyWith<$Res> implements $DeliveryRequestEventCopyWith<$Res> {
  factory _$PayEscrowAmountCopyWith(_PayEscrowAmount value, $Res Function(_PayEscrowAmount) _then) = __$PayEscrowAmountCopyWithImpl;
@useResult
$Res call({
 String requestId
});




}
/// @nodoc
class __$PayEscrowAmountCopyWithImpl<$Res>
    implements _$PayEscrowAmountCopyWith<$Res> {
  __$PayEscrowAmountCopyWithImpl(this._self, this._then);

  final _PayEscrowAmount _self;
  final $Res Function(_PayEscrowAmount) _then;

/// Create a copy of DeliveryRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,}) {
  return _then(_PayEscrowAmount(
null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SetDeliveryOnTheWay implements DeliveryRequestEvent {
  const _SetDeliveryOnTheWay(this.requestId);
  

 final  String requestId;

/// Create a copy of DeliveryRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetDeliveryOnTheWayCopyWith<_SetDeliveryOnTheWay> get copyWith => __$SetDeliveryOnTheWayCopyWithImpl<_SetDeliveryOnTheWay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetDeliveryOnTheWay&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'DeliveryRequestEvent.setDeliveryOnTheWay(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$SetDeliveryOnTheWayCopyWith<$Res> implements $DeliveryRequestEventCopyWith<$Res> {
  factory _$SetDeliveryOnTheWayCopyWith(_SetDeliveryOnTheWay value, $Res Function(_SetDeliveryOnTheWay) _then) = __$SetDeliveryOnTheWayCopyWithImpl;
@useResult
$Res call({
 String requestId
});




}
/// @nodoc
class __$SetDeliveryOnTheWayCopyWithImpl<$Res>
    implements _$SetDeliveryOnTheWayCopyWith<$Res> {
  __$SetDeliveryOnTheWayCopyWithImpl(this._self, this._then);

  final _SetDeliveryOnTheWay _self;
  final $Res Function(_SetDeliveryOnTheWay) _then;

/// Create a copy of DeliveryRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,}) {
  return _then(_SetDeliveryOnTheWay(
null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Reset implements DeliveryRequestEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestEvent.reset()';
}


}




/// @nodoc
mixin _$DeliveryRequestState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestState()';
}


}

/// @nodoc
class $DeliveryRequestStateCopyWith<$Res>  {
$DeliveryRequestStateCopyWith(DeliveryRequestState _, $Res Function(DeliveryRequestState) __);
}


/// Adds pattern-matching-related methods to [DeliveryRequestState].
extension DeliveryRequestStatePatterns on DeliveryRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeliveryRequestInitial value)?  initial,TResult Function( DeliveryRequestLoading value)?  loading,TResult Function( CreateDeliveryRequestSuccess value)?  createDeliveryRequestSuccess,TResult Function( CancelRequestSuccess value)?  cancelRequestSuccess,TResult Function( AcceptRequestSuccess value)?  acceptRequestSuccess,TResult Function( PayEscrowAmountSuccess value)?  payEscrowAmountSuccess,TResult Function( SetDeliveryOnTheWaySuccess value)?  setDeliveryOnTheWaySuccess,TResult Function( DeliveryRequestError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeliveryRequestInitial() when initial != null:
return initial(_that);case DeliveryRequestLoading() when loading != null:
return loading(_that);case CreateDeliveryRequestSuccess() when createDeliveryRequestSuccess != null:
return createDeliveryRequestSuccess(_that);case CancelRequestSuccess() when cancelRequestSuccess != null:
return cancelRequestSuccess(_that);case AcceptRequestSuccess() when acceptRequestSuccess != null:
return acceptRequestSuccess(_that);case PayEscrowAmountSuccess() when payEscrowAmountSuccess != null:
return payEscrowAmountSuccess(_that);case SetDeliveryOnTheWaySuccess() when setDeliveryOnTheWaySuccess != null:
return setDeliveryOnTheWaySuccess(_that);case DeliveryRequestError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeliveryRequestInitial value)  initial,required TResult Function( DeliveryRequestLoading value)  loading,required TResult Function( CreateDeliveryRequestSuccess value)  createDeliveryRequestSuccess,required TResult Function( CancelRequestSuccess value)  cancelRequestSuccess,required TResult Function( AcceptRequestSuccess value)  acceptRequestSuccess,required TResult Function( PayEscrowAmountSuccess value)  payEscrowAmountSuccess,required TResult Function( SetDeliveryOnTheWaySuccess value)  setDeliveryOnTheWaySuccess,required TResult Function( DeliveryRequestError value)  error,}){
final _that = this;
switch (_that) {
case DeliveryRequestInitial():
return initial(_that);case DeliveryRequestLoading():
return loading(_that);case CreateDeliveryRequestSuccess():
return createDeliveryRequestSuccess(_that);case CancelRequestSuccess():
return cancelRequestSuccess(_that);case AcceptRequestSuccess():
return acceptRequestSuccess(_that);case PayEscrowAmountSuccess():
return payEscrowAmountSuccess(_that);case SetDeliveryOnTheWaySuccess():
return setDeliveryOnTheWaySuccess(_that);case DeliveryRequestError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeliveryRequestInitial value)?  initial,TResult? Function( DeliveryRequestLoading value)?  loading,TResult? Function( CreateDeliveryRequestSuccess value)?  createDeliveryRequestSuccess,TResult? Function( CancelRequestSuccess value)?  cancelRequestSuccess,TResult? Function( AcceptRequestSuccess value)?  acceptRequestSuccess,TResult? Function( PayEscrowAmountSuccess value)?  payEscrowAmountSuccess,TResult? Function( SetDeliveryOnTheWaySuccess value)?  setDeliveryOnTheWaySuccess,TResult? Function( DeliveryRequestError value)?  error,}){
final _that = this;
switch (_that) {
case DeliveryRequestInitial() when initial != null:
return initial(_that);case DeliveryRequestLoading() when loading != null:
return loading(_that);case CreateDeliveryRequestSuccess() when createDeliveryRequestSuccess != null:
return createDeliveryRequestSuccess(_that);case CancelRequestSuccess() when cancelRequestSuccess != null:
return cancelRequestSuccess(_that);case AcceptRequestSuccess() when acceptRequestSuccess != null:
return acceptRequestSuccess(_that);case PayEscrowAmountSuccess() when payEscrowAmountSuccess != null:
return payEscrowAmountSuccess(_that);case SetDeliveryOnTheWaySuccess() when setDeliveryOnTheWaySuccess != null:
return setDeliveryOnTheWaySuccess(_that);case DeliveryRequestError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String requestId)?  createDeliveryRequestSuccess,TResult Function( String requestId)?  cancelRequestSuccess,TResult Function( String requestId)?  acceptRequestSuccess,TResult Function( String requestId)?  payEscrowAmountSuccess,TResult Function( String requestId)?  setDeliveryOnTheWaySuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeliveryRequestInitial() when initial != null:
return initial();case DeliveryRequestLoading() when loading != null:
return loading();case CreateDeliveryRequestSuccess() when createDeliveryRequestSuccess != null:
return createDeliveryRequestSuccess(_that.requestId);case CancelRequestSuccess() when cancelRequestSuccess != null:
return cancelRequestSuccess(_that.requestId);case AcceptRequestSuccess() when acceptRequestSuccess != null:
return acceptRequestSuccess(_that.requestId);case PayEscrowAmountSuccess() when payEscrowAmountSuccess != null:
return payEscrowAmountSuccess(_that.requestId);case SetDeliveryOnTheWaySuccess() when setDeliveryOnTheWaySuccess != null:
return setDeliveryOnTheWaySuccess(_that.requestId);case DeliveryRequestError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String requestId)  createDeliveryRequestSuccess,required TResult Function( String requestId)  cancelRequestSuccess,required TResult Function( String requestId)  acceptRequestSuccess,required TResult Function( String requestId)  payEscrowAmountSuccess,required TResult Function( String requestId)  setDeliveryOnTheWaySuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case DeliveryRequestInitial():
return initial();case DeliveryRequestLoading():
return loading();case CreateDeliveryRequestSuccess():
return createDeliveryRequestSuccess(_that.requestId);case CancelRequestSuccess():
return cancelRequestSuccess(_that.requestId);case AcceptRequestSuccess():
return acceptRequestSuccess(_that.requestId);case PayEscrowAmountSuccess():
return payEscrowAmountSuccess(_that.requestId);case SetDeliveryOnTheWaySuccess():
return setDeliveryOnTheWaySuccess(_that.requestId);case DeliveryRequestError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String requestId)?  createDeliveryRequestSuccess,TResult? Function( String requestId)?  cancelRequestSuccess,TResult? Function( String requestId)?  acceptRequestSuccess,TResult? Function( String requestId)?  payEscrowAmountSuccess,TResult? Function( String requestId)?  setDeliveryOnTheWaySuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case DeliveryRequestInitial() when initial != null:
return initial();case DeliveryRequestLoading() when loading != null:
return loading();case CreateDeliveryRequestSuccess() when createDeliveryRequestSuccess != null:
return createDeliveryRequestSuccess(_that.requestId);case CancelRequestSuccess() when cancelRequestSuccess != null:
return cancelRequestSuccess(_that.requestId);case AcceptRequestSuccess() when acceptRequestSuccess != null:
return acceptRequestSuccess(_that.requestId);case PayEscrowAmountSuccess() when payEscrowAmountSuccess != null:
return payEscrowAmountSuccess(_that.requestId);case SetDeliveryOnTheWaySuccess() when setDeliveryOnTheWaySuccess != null:
return setDeliveryOnTheWaySuccess(_that.requestId);case DeliveryRequestError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DeliveryRequestInitial implements DeliveryRequestState {
  const DeliveryRequestInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestState.initial()';
}


}




/// @nodoc


class DeliveryRequestLoading implements DeliveryRequestState {
  const DeliveryRequestLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestState.loading()';
}


}




/// @nodoc


class CreateDeliveryRequestSuccess implements DeliveryRequestState {
  const CreateDeliveryRequestSuccess({required this.requestId});
  

 final  String requestId;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDeliveryRequestSuccessCopyWith<CreateDeliveryRequestSuccess> get copyWith => _$CreateDeliveryRequestSuccessCopyWithImpl<CreateDeliveryRequestSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDeliveryRequestSuccess&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'DeliveryRequestState.createDeliveryRequestSuccess(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $CreateDeliveryRequestSuccessCopyWith<$Res> implements $DeliveryRequestStateCopyWith<$Res> {
  factory $CreateDeliveryRequestSuccessCopyWith(CreateDeliveryRequestSuccess value, $Res Function(CreateDeliveryRequestSuccess) _then) = _$CreateDeliveryRequestSuccessCopyWithImpl;
@useResult
$Res call({
 String requestId
});




}
/// @nodoc
class _$CreateDeliveryRequestSuccessCopyWithImpl<$Res>
    implements $CreateDeliveryRequestSuccessCopyWith<$Res> {
  _$CreateDeliveryRequestSuccessCopyWithImpl(this._self, this._then);

  final CreateDeliveryRequestSuccess _self;
  final $Res Function(CreateDeliveryRequestSuccess) _then;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,}) {
  return _then(CreateDeliveryRequestSuccess(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CancelRequestSuccess implements DeliveryRequestState {
  const CancelRequestSuccess({required this.requestId});
  

 final  String requestId;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelRequestSuccessCopyWith<CancelRequestSuccess> get copyWith => _$CancelRequestSuccessCopyWithImpl<CancelRequestSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelRequestSuccess&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'DeliveryRequestState.cancelRequestSuccess(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $CancelRequestSuccessCopyWith<$Res> implements $DeliveryRequestStateCopyWith<$Res> {
  factory $CancelRequestSuccessCopyWith(CancelRequestSuccess value, $Res Function(CancelRequestSuccess) _then) = _$CancelRequestSuccessCopyWithImpl;
@useResult
$Res call({
 String requestId
});




}
/// @nodoc
class _$CancelRequestSuccessCopyWithImpl<$Res>
    implements $CancelRequestSuccessCopyWith<$Res> {
  _$CancelRequestSuccessCopyWithImpl(this._self, this._then);

  final CancelRequestSuccess _self;
  final $Res Function(CancelRequestSuccess) _then;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,}) {
  return _then(CancelRequestSuccess(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AcceptRequestSuccess implements DeliveryRequestState {
  const AcceptRequestSuccess({required this.requestId});
  

 final  String requestId;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AcceptRequestSuccessCopyWith<AcceptRequestSuccess> get copyWith => _$AcceptRequestSuccessCopyWithImpl<AcceptRequestSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AcceptRequestSuccess&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'DeliveryRequestState.acceptRequestSuccess(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $AcceptRequestSuccessCopyWith<$Res> implements $DeliveryRequestStateCopyWith<$Res> {
  factory $AcceptRequestSuccessCopyWith(AcceptRequestSuccess value, $Res Function(AcceptRequestSuccess) _then) = _$AcceptRequestSuccessCopyWithImpl;
@useResult
$Res call({
 String requestId
});




}
/// @nodoc
class _$AcceptRequestSuccessCopyWithImpl<$Res>
    implements $AcceptRequestSuccessCopyWith<$Res> {
  _$AcceptRequestSuccessCopyWithImpl(this._self, this._then);

  final AcceptRequestSuccess _self;
  final $Res Function(AcceptRequestSuccess) _then;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,}) {
  return _then(AcceptRequestSuccess(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PayEscrowAmountSuccess implements DeliveryRequestState {
  const PayEscrowAmountSuccess({required this.requestId});
  

 final  String requestId;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayEscrowAmountSuccessCopyWith<PayEscrowAmountSuccess> get copyWith => _$PayEscrowAmountSuccessCopyWithImpl<PayEscrowAmountSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayEscrowAmountSuccess&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'DeliveryRequestState.payEscrowAmountSuccess(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $PayEscrowAmountSuccessCopyWith<$Res> implements $DeliveryRequestStateCopyWith<$Res> {
  factory $PayEscrowAmountSuccessCopyWith(PayEscrowAmountSuccess value, $Res Function(PayEscrowAmountSuccess) _then) = _$PayEscrowAmountSuccessCopyWithImpl;
@useResult
$Res call({
 String requestId
});




}
/// @nodoc
class _$PayEscrowAmountSuccessCopyWithImpl<$Res>
    implements $PayEscrowAmountSuccessCopyWith<$Res> {
  _$PayEscrowAmountSuccessCopyWithImpl(this._self, this._then);

  final PayEscrowAmountSuccess _self;
  final $Res Function(PayEscrowAmountSuccess) _then;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,}) {
  return _then(PayEscrowAmountSuccess(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SetDeliveryOnTheWaySuccess implements DeliveryRequestState {
  const SetDeliveryOnTheWaySuccess({required this.requestId});
  

 final  String requestId;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetDeliveryOnTheWaySuccessCopyWith<SetDeliveryOnTheWaySuccess> get copyWith => _$SetDeliveryOnTheWaySuccessCopyWithImpl<SetDeliveryOnTheWaySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetDeliveryOnTheWaySuccess&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'DeliveryRequestState.setDeliveryOnTheWaySuccess(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $SetDeliveryOnTheWaySuccessCopyWith<$Res> implements $DeliveryRequestStateCopyWith<$Res> {
  factory $SetDeliveryOnTheWaySuccessCopyWith(SetDeliveryOnTheWaySuccess value, $Res Function(SetDeliveryOnTheWaySuccess) _then) = _$SetDeliveryOnTheWaySuccessCopyWithImpl;
@useResult
$Res call({
 String requestId
});




}
/// @nodoc
class _$SetDeliveryOnTheWaySuccessCopyWithImpl<$Res>
    implements $SetDeliveryOnTheWaySuccessCopyWith<$Res> {
  _$SetDeliveryOnTheWaySuccessCopyWithImpl(this._self, this._then);

  final SetDeliveryOnTheWaySuccess _self;
  final $Res Function(SetDeliveryOnTheWaySuccess) _then;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,}) {
  return _then(SetDeliveryOnTheWaySuccess(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeliveryRequestError implements DeliveryRequestState {
  const DeliveryRequestError({required this.message});
  

 final  String message;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryRequestErrorCopyWith<DeliveryRequestError> get copyWith => _$DeliveryRequestErrorCopyWithImpl<DeliveryRequestError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DeliveryRequestState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DeliveryRequestErrorCopyWith<$Res> implements $DeliveryRequestStateCopyWith<$Res> {
  factory $DeliveryRequestErrorCopyWith(DeliveryRequestError value, $Res Function(DeliveryRequestError) _then) = _$DeliveryRequestErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DeliveryRequestErrorCopyWithImpl<$Res>
    implements $DeliveryRequestErrorCopyWith<$Res> {
  _$DeliveryRequestErrorCopyWithImpl(this._self, this._then);

  final DeliveryRequestError _self;
  final $Res Function(DeliveryRequestError) _then;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DeliveryRequestError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
