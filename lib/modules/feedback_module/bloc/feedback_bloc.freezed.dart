// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedbackEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbackEvent()';
}


}

/// @nodoc
class $FeedbackEventCopyWith<$Res>  {
$FeedbackEventCopyWith(FeedbackEvent _, $Res Function(FeedbackEvent) __);
}


/// Adds pattern-matching-related methods to [FeedbackEvent].
extension FeedbackEventPatterns on FeedbackEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SubmittingFeedback value)?  submittingFeedback,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SubmittingFeedback() when submittingFeedback != null:
return submittingFeedback(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SubmittingFeedback value)  submittingFeedback,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SubmittingFeedback():
return submittingFeedback(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SubmittingFeedback value)?  submittingFeedback,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SubmittingFeedback() when submittingFeedback != null:
return submittingFeedback(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String deliveryRequestId,  String feedbackText,  int rating)?  submittingFeedback,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SubmittingFeedback() when submittingFeedback != null:
return submittingFeedback(_that.deliveryRequestId,_that.feedbackText,_that.rating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String deliveryRequestId,  String feedbackText,  int rating)  submittingFeedback,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SubmittingFeedback():
return submittingFeedback(_that.deliveryRequestId,_that.feedbackText,_that.rating);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String deliveryRequestId,  String feedbackText,  int rating)?  submittingFeedback,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SubmittingFeedback() when submittingFeedback != null:
return submittingFeedback(_that.deliveryRequestId,_that.feedbackText,_that.rating);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements FeedbackEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbackEvent.started()';
}


}




/// @nodoc


class _SubmittingFeedback implements FeedbackEvent {
  const _SubmittingFeedback({required this.deliveryRequestId, required this.feedbackText, required this.rating});
  

 final  String deliveryRequestId;
 final  String feedbackText;
 final  int rating;

/// Create a copy of FeedbackEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmittingFeedbackCopyWith<_SubmittingFeedback> get copyWith => __$SubmittingFeedbackCopyWithImpl<_SubmittingFeedback>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmittingFeedback&&(identical(other.deliveryRequestId, deliveryRequestId) || other.deliveryRequestId == deliveryRequestId)&&(identical(other.feedbackText, feedbackText) || other.feedbackText == feedbackText)&&(identical(other.rating, rating) || other.rating == rating));
}


@override
int get hashCode => Object.hash(runtimeType,deliveryRequestId,feedbackText,rating);

@override
String toString() {
  return 'FeedbackEvent.submittingFeedback(deliveryRequestId: $deliveryRequestId, feedbackText: $feedbackText, rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$SubmittingFeedbackCopyWith<$Res> implements $FeedbackEventCopyWith<$Res> {
  factory _$SubmittingFeedbackCopyWith(_SubmittingFeedback value, $Res Function(_SubmittingFeedback) _then) = __$SubmittingFeedbackCopyWithImpl;
@useResult
$Res call({
 String deliveryRequestId, String feedbackText, int rating
});




}
/// @nodoc
class __$SubmittingFeedbackCopyWithImpl<$Res>
    implements _$SubmittingFeedbackCopyWith<$Res> {
  __$SubmittingFeedbackCopyWithImpl(this._self, this._then);

  final _SubmittingFeedback _self;
  final $Res Function(_SubmittingFeedback) _then;

/// Create a copy of FeedbackEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deliveryRequestId = null,Object? feedbackText = null,Object? rating = null,}) {
  return _then(_SubmittingFeedback(
deliveryRequestId: null == deliveryRequestId ? _self.deliveryRequestId : deliveryRequestId // ignore: cast_nullable_to_non_nullable
as String,feedbackText: null == feedbackText ? _self.feedbackText : feedbackText // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$FeedbackState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbackState()';
}


}

/// @nodoc
class $FeedbackStateCopyWith<$Res>  {
$FeedbackStateCopyWith(FeedbackState _, $Res Function(FeedbackState) __);
}


/// Adds pattern-matching-related methods to [FeedbackState].
extension FeedbackStatePatterns on FeedbackState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FeedbackInitial value)?  initial,TResult Function( FeedbackLoading value)?  loading,TResult Function( FeedbackSuccess value)?  success,TResult Function( FeedbackError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FeedbackInitial() when initial != null:
return initial(_that);case FeedbackLoading() when loading != null:
return loading(_that);case FeedbackSuccess() when success != null:
return success(_that);case FeedbackError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FeedbackInitial value)  initial,required TResult Function( FeedbackLoading value)  loading,required TResult Function( FeedbackSuccess value)  success,required TResult Function( FeedbackError value)  error,}){
final _that = this;
switch (_that) {
case FeedbackInitial():
return initial(_that);case FeedbackLoading():
return loading(_that);case FeedbackSuccess():
return success(_that);case FeedbackError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FeedbackInitial value)?  initial,TResult? Function( FeedbackLoading value)?  loading,TResult? Function( FeedbackSuccess value)?  success,TResult? Function( FeedbackError value)?  error,}){
final _that = this;
switch (_that) {
case FeedbackInitial() when initial != null:
return initial(_that);case FeedbackLoading() when loading != null:
return loading(_that);case FeedbackSuccess() when success != null:
return success(_that);case FeedbackError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String errorMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FeedbackInitial() when initial != null:
return initial();case FeedbackLoading() when loading != null:
return loading();case FeedbackSuccess() when success != null:
return success();case FeedbackError() when error != null:
return error(_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String errorMessage)  error,}) {final _that = this;
switch (_that) {
case FeedbackInitial():
return initial();case FeedbackLoading():
return loading();case FeedbackSuccess():
return success();case FeedbackError():
return error(_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String errorMessage)?  error,}) {final _that = this;
switch (_that) {
case FeedbackInitial() when initial != null:
return initial();case FeedbackLoading() when loading != null:
return loading();case FeedbackSuccess() when success != null:
return success();case FeedbackError() when error != null:
return error(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class FeedbackInitial implements FeedbackState {
  const FeedbackInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbackState.initial()';
}


}




/// @nodoc


class FeedbackLoading implements FeedbackState {
  const FeedbackLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbackState.loading()';
}


}




/// @nodoc


class FeedbackSuccess implements FeedbackState {
  const FeedbackSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbackState.success()';
}


}




/// @nodoc


class FeedbackError implements FeedbackState {
  const FeedbackError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of FeedbackState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbackErrorCopyWith<FeedbackError> get copyWith => _$FeedbackErrorCopyWithImpl<FeedbackError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'FeedbackState.error(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $FeedbackErrorCopyWith<$Res> implements $FeedbackStateCopyWith<$Res> {
  factory $FeedbackErrorCopyWith(FeedbackError value, $Res Function(FeedbackError) _then) = _$FeedbackErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$FeedbackErrorCopyWithImpl<$Res>
    implements $FeedbackErrorCopyWith<$Res> {
  _$FeedbackErrorCopyWithImpl(this._self, this._then);

  final FeedbackError _self;
  final $Res Function(FeedbackError) _then;

/// Create a copy of FeedbackState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(FeedbackError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
