// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_delivery_requests_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserDeliveryRequestsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDeliveryRequestsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserDeliveryRequestsState()';
}


}

/// @nodoc
class $UserDeliveryRequestsStateCopyWith<$Res>  {
$UserDeliveryRequestsStateCopyWith(UserDeliveryRequestsState _, $Res Function(UserDeliveryRequestsState) __);
}


/// Adds pattern-matching-related methods to [UserDeliveryRequestsState].
extension UserDeliveryRequestsStatePatterns on UserDeliveryRequestsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserDeliveryRequestsInitial value)?  initial,TResult Function( UserDeliveryRequestsLoading value)?  loading,TResult Function( UserDeliveryRequestsLoaded value)?  loaded,TResult Function( UserDeliveryRequestsEmpty value)?  empty,TResult Function( UserDeliveryRequestsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserDeliveryRequestsInitial() when initial != null:
return initial(_that);case UserDeliveryRequestsLoading() when loading != null:
return loading(_that);case UserDeliveryRequestsLoaded() when loaded != null:
return loaded(_that);case UserDeliveryRequestsEmpty() when empty != null:
return empty(_that);case UserDeliveryRequestsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserDeliveryRequestsInitial value)  initial,required TResult Function( UserDeliveryRequestsLoading value)  loading,required TResult Function( UserDeliveryRequestsLoaded value)  loaded,required TResult Function( UserDeliveryRequestsEmpty value)  empty,required TResult Function( UserDeliveryRequestsError value)  error,}){
final _that = this;
switch (_that) {
case UserDeliveryRequestsInitial():
return initial(_that);case UserDeliveryRequestsLoading():
return loading(_that);case UserDeliveryRequestsLoaded():
return loaded(_that);case UserDeliveryRequestsEmpty():
return empty(_that);case UserDeliveryRequestsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserDeliveryRequestsInitial value)?  initial,TResult? Function( UserDeliveryRequestsLoading value)?  loading,TResult? Function( UserDeliveryRequestsLoaded value)?  loaded,TResult? Function( UserDeliveryRequestsEmpty value)?  empty,TResult? Function( UserDeliveryRequestsError value)?  error,}){
final _that = this;
switch (_that) {
case UserDeliveryRequestsInitial() when initial != null:
return initial(_that);case UserDeliveryRequestsLoading() when loading != null:
return loading(_that);case UserDeliveryRequestsLoaded() when loaded != null:
return loaded(_that);case UserDeliveryRequestsEmpty() when empty != null:
return empty(_that);case UserDeliveryRequestsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DeliveryRequestModel> deliveryRequests)?  loaded,TResult Function()?  empty,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserDeliveryRequestsInitial() when initial != null:
return initial();case UserDeliveryRequestsLoading() when loading != null:
return loading();case UserDeliveryRequestsLoaded() when loaded != null:
return loaded(_that.deliveryRequests);case UserDeliveryRequestsEmpty() when empty != null:
return empty();case UserDeliveryRequestsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DeliveryRequestModel> deliveryRequests)  loaded,required TResult Function()  empty,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case UserDeliveryRequestsInitial():
return initial();case UserDeliveryRequestsLoading():
return loading();case UserDeliveryRequestsLoaded():
return loaded(_that.deliveryRequests);case UserDeliveryRequestsEmpty():
return empty();case UserDeliveryRequestsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DeliveryRequestModel> deliveryRequests)?  loaded,TResult? Function()?  empty,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case UserDeliveryRequestsInitial() when initial != null:
return initial();case UserDeliveryRequestsLoading() when loading != null:
return loading();case UserDeliveryRequestsLoaded() when loaded != null:
return loaded(_that.deliveryRequests);case UserDeliveryRequestsEmpty() when empty != null:
return empty();case UserDeliveryRequestsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class UserDeliveryRequestsInitial implements UserDeliveryRequestsState {
  const UserDeliveryRequestsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDeliveryRequestsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserDeliveryRequestsState.initial()';
}


}




/// @nodoc


class UserDeliveryRequestsLoading implements UserDeliveryRequestsState {
  const UserDeliveryRequestsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDeliveryRequestsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserDeliveryRequestsState.loading()';
}


}




/// @nodoc


class UserDeliveryRequestsLoaded implements UserDeliveryRequestsState {
  const UserDeliveryRequestsLoaded(final  List<DeliveryRequestModel> deliveryRequests): _deliveryRequests = deliveryRequests;
  

 final  List<DeliveryRequestModel> _deliveryRequests;
 List<DeliveryRequestModel> get deliveryRequests {
  if (_deliveryRequests is EqualUnmodifiableListView) return _deliveryRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deliveryRequests);
}


/// Create a copy of UserDeliveryRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDeliveryRequestsLoadedCopyWith<UserDeliveryRequestsLoaded> get copyWith => _$UserDeliveryRequestsLoadedCopyWithImpl<UserDeliveryRequestsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDeliveryRequestsLoaded&&const DeepCollectionEquality().equals(other._deliveryRequests, _deliveryRequests));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_deliveryRequests));

@override
String toString() {
  return 'UserDeliveryRequestsState.loaded(deliveryRequests: $deliveryRequests)';
}


}

/// @nodoc
abstract mixin class $UserDeliveryRequestsLoadedCopyWith<$Res> implements $UserDeliveryRequestsStateCopyWith<$Res> {
  factory $UserDeliveryRequestsLoadedCopyWith(UserDeliveryRequestsLoaded value, $Res Function(UserDeliveryRequestsLoaded) _then) = _$UserDeliveryRequestsLoadedCopyWithImpl;
@useResult
$Res call({
 List<DeliveryRequestModel> deliveryRequests
});




}
/// @nodoc
class _$UserDeliveryRequestsLoadedCopyWithImpl<$Res>
    implements $UserDeliveryRequestsLoadedCopyWith<$Res> {
  _$UserDeliveryRequestsLoadedCopyWithImpl(this._self, this._then);

  final UserDeliveryRequestsLoaded _self;
  final $Res Function(UserDeliveryRequestsLoaded) _then;

/// Create a copy of UserDeliveryRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deliveryRequests = null,}) {
  return _then(UserDeliveryRequestsLoaded(
null == deliveryRequests ? _self._deliveryRequests : deliveryRequests // ignore: cast_nullable_to_non_nullable
as List<DeliveryRequestModel>,
  ));
}


}

/// @nodoc


class UserDeliveryRequestsEmpty implements UserDeliveryRequestsState {
  const UserDeliveryRequestsEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDeliveryRequestsEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserDeliveryRequestsState.empty()';
}


}




/// @nodoc


class UserDeliveryRequestsError implements UserDeliveryRequestsState {
  const UserDeliveryRequestsError(this.message);
  

 final  String message;

/// Create a copy of UserDeliveryRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDeliveryRequestsErrorCopyWith<UserDeliveryRequestsError> get copyWith => _$UserDeliveryRequestsErrorCopyWithImpl<UserDeliveryRequestsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDeliveryRequestsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UserDeliveryRequestsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $UserDeliveryRequestsErrorCopyWith<$Res> implements $UserDeliveryRequestsStateCopyWith<$Res> {
  factory $UserDeliveryRequestsErrorCopyWith(UserDeliveryRequestsError value, $Res Function(UserDeliveryRequestsError) _then) = _$UserDeliveryRequestsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UserDeliveryRequestsErrorCopyWithImpl<$Res>
    implements $UserDeliveryRequestsErrorCopyWith<$Res> {
  _$UserDeliveryRequestsErrorCopyWithImpl(this._self, this._then);

  final UserDeliveryRequestsError _self;
  final $Res Function(UserDeliveryRequestsError) _then;

/// Create a copy of UserDeliveryRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UserDeliveryRequestsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
