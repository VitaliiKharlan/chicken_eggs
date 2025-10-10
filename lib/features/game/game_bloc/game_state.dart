import 'package:freezed_annotation/freezed_annotation.dart';

import '../components/egg.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState.running({
    required int score,
    required List<Egg> eggs,
    required double chickenX,
    required bool paused,
    @Default(1) int multiplier,
    @Default(false) bool showMissedIcon,
    @Default(3) int missedEggsCount,
  }) = GameRunning;

  const factory GameState.paused({
    required GameState lastState,
  }) = GamePaused;

  const factory GameState.won({
    required int score,
  }) = GameWon;

  const factory GameState.over({
    required int score,
  }) = GameOver;
}