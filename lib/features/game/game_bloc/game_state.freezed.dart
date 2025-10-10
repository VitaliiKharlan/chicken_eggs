// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameState()';
}


}

/// @nodoc
class $GameStateCopyWith<$Res>  {
$GameStateCopyWith(GameState _, $Res Function(GameState) __);
}


/// Adds pattern-matching-related methods to [GameState].
extension GameStatePatterns on GameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GameRunning value)?  running,TResult Function( GamePaused value)?  paused,TResult Function( GameWon value)?  won,TResult Function( GameOver value)?  over,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GameRunning() when running != null:
return running(_that);case GamePaused() when paused != null:
return paused(_that);case GameWon() when won != null:
return won(_that);case GameOver() when over != null:
return over(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GameRunning value)  running,required TResult Function( GamePaused value)  paused,required TResult Function( GameWon value)  won,required TResult Function( GameOver value)  over,}){
final _that = this;
switch (_that) {
case GameRunning():
return running(_that);case GamePaused():
return paused(_that);case GameWon():
return won(_that);case GameOver():
return over(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GameRunning value)?  running,TResult? Function( GamePaused value)?  paused,TResult? Function( GameWon value)?  won,TResult? Function( GameOver value)?  over,}){
final _that = this;
switch (_that) {
case GameRunning() when running != null:
return running(_that);case GamePaused() when paused != null:
return paused(_that);case GameWon() when won != null:
return won(_that);case GameOver() when over != null:
return over(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int score,  List<Egg> eggs,  double chickenX,  bool paused,  int multiplier,  bool showMissedIcon,  int missedEggsCount)?  running,TResult Function( GameState lastState)?  paused,TResult Function( int score)?  won,TResult Function( int score)?  over,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GameRunning() when running != null:
return running(_that.score,_that.eggs,_that.chickenX,_that.paused,_that.multiplier,_that.showMissedIcon,_that.missedEggsCount);case GamePaused() when paused != null:
return paused(_that.lastState);case GameWon() when won != null:
return won(_that.score);case GameOver() when over != null:
return over(_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int score,  List<Egg> eggs,  double chickenX,  bool paused,  int multiplier,  bool showMissedIcon,  int missedEggsCount)  running,required TResult Function( GameState lastState)  paused,required TResult Function( int score)  won,required TResult Function( int score)  over,}) {final _that = this;
switch (_that) {
case GameRunning():
return running(_that.score,_that.eggs,_that.chickenX,_that.paused,_that.multiplier,_that.showMissedIcon,_that.missedEggsCount);case GamePaused():
return paused(_that.lastState);case GameWon():
return won(_that.score);case GameOver():
return over(_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int score,  List<Egg> eggs,  double chickenX,  bool paused,  int multiplier,  bool showMissedIcon,  int missedEggsCount)?  running,TResult? Function( GameState lastState)?  paused,TResult? Function( int score)?  won,TResult? Function( int score)?  over,}) {final _that = this;
switch (_that) {
case GameRunning() when running != null:
return running(_that.score,_that.eggs,_that.chickenX,_that.paused,_that.multiplier,_that.showMissedIcon,_that.missedEggsCount);case GamePaused() when paused != null:
return paused(_that.lastState);case GameWon() when won != null:
return won(_that.score);case GameOver() when over != null:
return over(_that.score);case _:
  return null;

}
}

}

/// @nodoc


class GameRunning implements GameState {
  const GameRunning({required this.score, required final  List<Egg> eggs, required this.chickenX, required this.paused, this.multiplier = 1, this.showMissedIcon = false, this.missedEggsCount = 3}): _eggs = eggs;
  

 final  int score;
 final  List<Egg> _eggs;
 List<Egg> get eggs {
  if (_eggs is EqualUnmodifiableListView) return _eggs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_eggs);
}

 final  double chickenX;
 final  bool paused;
@JsonKey() final  int multiplier;
@JsonKey() final  bool showMissedIcon;
@JsonKey() final  int missedEggsCount;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameRunningCopyWith<GameRunning> get copyWith => _$GameRunningCopyWithImpl<GameRunning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameRunning&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other._eggs, _eggs)&&(identical(other.chickenX, chickenX) || other.chickenX == chickenX)&&(identical(other.paused, paused) || other.paused == paused)&&(identical(other.multiplier, multiplier) || other.multiplier == multiplier)&&(identical(other.showMissedIcon, showMissedIcon) || other.showMissedIcon == showMissedIcon)&&(identical(other.missedEggsCount, missedEggsCount) || other.missedEggsCount == missedEggsCount));
}


@override
int get hashCode => Object.hash(runtimeType,score,const DeepCollectionEquality().hash(_eggs),chickenX,paused,multiplier,showMissedIcon,missedEggsCount);

@override
String toString() {
  return 'GameState.running(score: $score, eggs: $eggs, chickenX: $chickenX, paused: $paused, multiplier: $multiplier, showMissedIcon: $showMissedIcon, missedEggsCount: $missedEggsCount)';
}


}

/// @nodoc
abstract mixin class $GameRunningCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory $GameRunningCopyWith(GameRunning value, $Res Function(GameRunning) _then) = _$GameRunningCopyWithImpl;
@useResult
$Res call({
 int score, List<Egg> eggs, double chickenX, bool paused, int multiplier, bool showMissedIcon, int missedEggsCount
});




}
/// @nodoc
class _$GameRunningCopyWithImpl<$Res>
    implements $GameRunningCopyWith<$Res> {
  _$GameRunningCopyWithImpl(this._self, this._then);

  final GameRunning _self;
  final $Res Function(GameRunning) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? score = null,Object? eggs = null,Object? chickenX = null,Object? paused = null,Object? multiplier = null,Object? showMissedIcon = null,Object? missedEggsCount = null,}) {
  return _then(GameRunning(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,eggs: null == eggs ? _self._eggs : eggs // ignore: cast_nullable_to_non_nullable
as List<Egg>,chickenX: null == chickenX ? _self.chickenX : chickenX // ignore: cast_nullable_to_non_nullable
as double,paused: null == paused ? _self.paused : paused // ignore: cast_nullable_to_non_nullable
as bool,multiplier: null == multiplier ? _self.multiplier : multiplier // ignore: cast_nullable_to_non_nullable
as int,showMissedIcon: null == showMissedIcon ? _self.showMissedIcon : showMissedIcon // ignore: cast_nullable_to_non_nullable
as bool,missedEggsCount: null == missedEggsCount ? _self.missedEggsCount : missedEggsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GamePaused implements GameState {
  const GamePaused({required this.lastState});
  

 final  GameState lastState;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GamePausedCopyWith<GamePaused> get copyWith => _$GamePausedCopyWithImpl<GamePaused>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamePaused&&(identical(other.lastState, lastState) || other.lastState == lastState));
}


@override
int get hashCode => Object.hash(runtimeType,lastState);

@override
String toString() {
  return 'GameState.paused(lastState: $lastState)';
}


}

/// @nodoc
abstract mixin class $GamePausedCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory $GamePausedCopyWith(GamePaused value, $Res Function(GamePaused) _then) = _$GamePausedCopyWithImpl;
@useResult
$Res call({
 GameState lastState
});


$GameStateCopyWith<$Res> get lastState;

}
/// @nodoc
class _$GamePausedCopyWithImpl<$Res>
    implements $GamePausedCopyWith<$Res> {
  _$GamePausedCopyWithImpl(this._self, this._then);

  final GamePaused _self;
  final $Res Function(GamePaused) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lastState = null,}) {
  return _then(GamePaused(
lastState: null == lastState ? _self.lastState : lastState // ignore: cast_nullable_to_non_nullable
as GameState,
  ));
}

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameStateCopyWith<$Res> get lastState {
  
  return $GameStateCopyWith<$Res>(_self.lastState, (value) {
    return _then(_self.copyWith(lastState: value));
  });
}
}

/// @nodoc


class GameWon implements GameState {
  const GameWon({required this.score});
  

 final  int score;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameWonCopyWith<GameWon> get copyWith => _$GameWonCopyWithImpl<GameWon>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameWon&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,score);

@override
String toString() {
  return 'GameState.won(score: $score)';
}


}

/// @nodoc
abstract mixin class $GameWonCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory $GameWonCopyWith(GameWon value, $Res Function(GameWon) _then) = _$GameWonCopyWithImpl;
@useResult
$Res call({
 int score
});




}
/// @nodoc
class _$GameWonCopyWithImpl<$Res>
    implements $GameWonCopyWith<$Res> {
  _$GameWonCopyWithImpl(this._self, this._then);

  final GameWon _self;
  final $Res Function(GameWon) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? score = null,}) {
  return _then(GameWon(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GameOver implements GameState {
  const GameOver({required this.score});
  

 final  int score;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameOverCopyWith<GameOver> get copyWith => _$GameOverCopyWithImpl<GameOver>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameOver&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,score);

@override
String toString() {
  return 'GameState.over(score: $score)';
}


}

/// @nodoc
abstract mixin class $GameOverCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory $GameOverCopyWith(GameOver value, $Res Function(GameOver) _then) = _$GameOverCopyWithImpl;
@useResult
$Res call({
 int score
});




}
/// @nodoc
class _$GameOverCopyWithImpl<$Res>
    implements $GameOverCopyWith<$Res> {
  _$GameOverCopyWithImpl(this._self, this._then);

  final GameOver _self;
  final $Res Function(GameOver) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? score = null,}) {
  return _then(GameOver(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
