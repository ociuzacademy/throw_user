// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SendOtpEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOtpEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SendOtpEvent()';
}


}

/// @nodoc
class $SendOtpEventCopyWith<$Res>  {
$SendOtpEventCopyWith(SendOtpEvent _, $Res Function(SendOtpEvent) __);
}


/// Adds pattern-matching-related methods to [SendOtpEvent].
extension SendOtpEventPatterns on SendOtpEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SendingOtp value)?  sendingOtp,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SendingOtp() when sendingOtp != null:
return sendingOtp(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SendingOtp value)  sendingOtp,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SendingOtp():
return sendingOtp(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SendingOtp value)?  sendingOtp,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SendingOtp() when sendingOtp != null:
return sendingOtp(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String phoneNumber,  String otp)?  sendingOtp,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SendingOtp() when sendingOtp != null:
return sendingOtp(_that.phoneNumber,_that.otp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String phoneNumber,  String otp)  sendingOtp,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SendingOtp():
return sendingOtp(_that.phoneNumber,_that.otp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String phoneNumber,  String otp)?  sendingOtp,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SendingOtp() when sendingOtp != null:
return sendingOtp(_that.phoneNumber,_that.otp);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements SendOtpEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SendOtpEvent.started()';
}


}




/// @nodoc


class _SendingOtp implements SendOtpEvent {
  const _SendingOtp(this.phoneNumber, this.otp);
  

 final  String phoneNumber;
 final  String otp;

/// Create a copy of SendOtpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendingOtpCopyWith<_SendingOtp> get copyWith => __$SendingOtpCopyWithImpl<_SendingOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendingOtp&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber,otp);

@override
String toString() {
  return 'SendOtpEvent.sendingOtp(phoneNumber: $phoneNumber, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$SendingOtpCopyWith<$Res> implements $SendOtpEventCopyWith<$Res> {
  factory _$SendingOtpCopyWith(_SendingOtp value, $Res Function(_SendingOtp) _then) = __$SendingOtpCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String otp
});




}
/// @nodoc
class __$SendingOtpCopyWithImpl<$Res>
    implements _$SendingOtpCopyWith<$Res> {
  __$SendingOtpCopyWithImpl(this._self, this._then);

  final _SendingOtp _self;
  final $Res Function(_SendingOtp) _then;

/// Create a copy of SendOtpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? otp = null,}) {
  return _then(_SendingOtp(
null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SendOtpState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOtpState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SendOtpState()';
}


}

/// @nodoc
class $SendOtpStateCopyWith<$Res>  {
$SendOtpStateCopyWith(SendOtpState _, $Res Function(SendOtpState) __);
}


/// Adds pattern-matching-related methods to [SendOtpState].
extension SendOtpStatePatterns on SendOtpState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SendOtpInitial value)?  initial,TResult Function( SendOtpLoading value)?  loading,TResult Function( SendOtpSuccess value)?  success,TResult Function( SendOtpError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SendOtpInitial() when initial != null:
return initial(_that);case SendOtpLoading() when loading != null:
return loading(_that);case SendOtpSuccess() when success != null:
return success(_that);case SendOtpError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SendOtpInitial value)  initial,required TResult Function( SendOtpLoading value)  loading,required TResult Function( SendOtpSuccess value)  success,required TResult Function( SendOtpError value)  error,}){
final _that = this;
switch (_that) {
case SendOtpInitial():
return initial(_that);case SendOtpLoading():
return loading(_that);case SendOtpSuccess():
return success(_that);case SendOtpError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SendOtpInitial value)?  initial,TResult? Function( SendOtpLoading value)?  loading,TResult? Function( SendOtpSuccess value)?  success,TResult? Function( SendOtpError value)?  error,}){
final _that = this;
switch (_that) {
case SendOtpInitial() when initial != null:
return initial(_that);case SendOtpLoading() when loading != null:
return loading(_that);case SendOtpSuccess() when success != null:
return success(_that);case SendOtpError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SendOtpInitial() when initial != null:
return initial();case SendOtpLoading() when loading != null:
return loading();case SendOtpSuccess() when success != null:
return success();case SendOtpError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case SendOtpInitial():
return initial();case SendOtpLoading():
return loading();case SendOtpSuccess():
return success();case SendOtpError():
return error(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case SendOtpInitial() when initial != null:
return initial();case SendOtpLoading() when loading != null:
return loading();case SendOtpSuccess() when success != null:
return success();case SendOtpError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class SendOtpInitial implements SendOtpState {
  const SendOtpInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOtpInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SendOtpState.initial()';
}


}




/// @nodoc


class SendOtpLoading implements SendOtpState {
  const SendOtpLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOtpLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SendOtpState.loading()';
}


}




/// @nodoc


class SendOtpSuccess implements SendOtpState {
  const SendOtpSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOtpSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SendOtpState.success()';
}


}




/// @nodoc


class SendOtpError implements SendOtpState {
  const SendOtpError(this.error);
  

 final  String error;

/// Create a copy of SendOtpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendOtpErrorCopyWith<SendOtpError> get copyWith => _$SendOtpErrorCopyWithImpl<SendOtpError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOtpError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SendOtpState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $SendOtpErrorCopyWith<$Res> implements $SendOtpStateCopyWith<$Res> {
  factory $SendOtpErrorCopyWith(SendOtpError value, $Res Function(SendOtpError) _then) = _$SendOtpErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$SendOtpErrorCopyWithImpl<$Res>
    implements $SendOtpErrorCopyWith<$Res> {
  _$SendOtpErrorCopyWithImpl(this._self, this._then);

  final SendOtpError _self;
  final $Res Function(SendOtpError) _then;

/// Create a copy of SendOtpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SendOtpError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
