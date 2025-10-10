// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loading_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoadingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadingState()';
}


}

/// @nodoc
class $LoadingStateCopyWith<$Res>  {
$LoadingStateCopyWith(LoadingState _, $Res Function(LoadingState) __);
}


/// Adds pattern-matching-related methods to [LoadingState].
extension LoadingStatePatterns on LoadingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingInitial value)?  initial,TResult Function( LoadingInProgress value)?  inProgress,TResult Function( LoadingCompleted value)?  completed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingInitial() when initial != null:
return initial(_that);case LoadingInProgress() when inProgress != null:
return inProgress(_that);case LoadingCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingInitial value)  initial,required TResult Function( LoadingInProgress value)  inProgress,required TResult Function( LoadingCompleted value)  completed,}){
final _that = this;
switch (_that) {
case LoadingInitial():
return initial(_that);case LoadingInProgress():
return inProgress(_that);case LoadingCompleted():
return completed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingInitial value)?  initial,TResult? Function( LoadingInProgress value)?  inProgress,TResult? Function( LoadingCompleted value)?  completed,}){
final _that = this;
switch (_that) {
case LoadingInitial() when initial != null:
return initial(_that);case LoadingInProgress() when inProgress != null:
return inProgress(_that);case LoadingCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( double progress)?  inProgress,TResult Function()?  completed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingInitial() when initial != null:
return initial();case LoadingInProgress() when inProgress != null:
return inProgress(_that.progress);case LoadingCompleted() when completed != null:
return completed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( double progress)  inProgress,required TResult Function()  completed,}) {final _that = this;
switch (_that) {
case LoadingInitial():
return initial();case LoadingInProgress():
return inProgress(_that.progress);case LoadingCompleted():
return completed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( double progress)?  inProgress,TResult? Function()?  completed,}) {final _that = this;
switch (_that) {
case LoadingInitial() when initial != null:
return initial();case LoadingInProgress() when inProgress != null:
return inProgress(_that.progress);case LoadingCompleted() when completed != null:
return completed();case _:
  return null;

}
}

}

/// @nodoc


class LoadingInitial implements LoadingState {
  const LoadingInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadingState.initial()';
}


}




/// @nodoc


class LoadingInProgress implements LoadingState {
  const LoadingInProgress(this.progress);
  

 final  double progress;

/// Create a copy of LoadingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingInProgressCopyWith<LoadingInProgress> get copyWith => _$LoadingInProgressCopyWithImpl<LoadingInProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingInProgress&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,progress);

@override
String toString() {
  return 'LoadingState.inProgress(progress: $progress)';
}


}

/// @nodoc
abstract mixin class $LoadingInProgressCopyWith<$Res> implements $LoadingStateCopyWith<$Res> {
  factory $LoadingInProgressCopyWith(LoadingInProgress value, $Res Function(LoadingInProgress) _then) = _$LoadingInProgressCopyWithImpl;
@useResult
$Res call({
 double progress
});




}
/// @nodoc
class _$LoadingInProgressCopyWithImpl<$Res>
    implements $LoadingInProgressCopyWith<$Res> {
  _$LoadingInProgressCopyWithImpl(this._self, this._then);

  final LoadingInProgress _self;
  final $Res Function(LoadingInProgress) _then;

/// Create a copy of LoadingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,}) {
  return _then(LoadingInProgress(
null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class LoadingCompleted implements LoadingState {
  const LoadingCompleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadingState.completed()';
}


}




// dart format on
