import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/egg.dart';
import 'game_event.dart';
import 'game_state.dart';


class GameBloc extends Bloc<GameEvent, GameState> {
  int totalDroppedEggs = 0; // <-- общее количество упавших яиц (всего)
  static const int totalEggsToDrop = 5;
  int missedEggsCount = 3;

  GameBloc()
    : super(GameRunning(score: 0, eggs: [], chickenX: 0.0, paused: false)) {
    on<EggDropped>(_onEggDropped);
    on<EggMissed>(_onEggMissed);
    on<EggCaught>(_onEggCaught);
    on<PausePressed>(_onPausePressed);
    on<ResumePressed>(_onResumePressed);
    on<ChickenMoved>(_onChickenMoved);
    on<MultiplierCaught>(_onMultiplierCaught);
    on<RestartPressed>(_onRestartPressed);
  }

  void _onEggDropped(EggDropped event, Emitter<GameState> emit) {
    if (state is! GameRunning) return;
    final current = state as GameRunning;

    totalDroppedEggs++;
    emit(current.copyWith(eggs: List.from(current.eggs)..add(event.egg)));
  }

  void _onEggMissed(EggMissed event, Emitter<GameState> emit) async {
    if (state is! GameRunning) return;
    final current = state as GameRunning;
    if (!current.eggs.contains(event.egg)) return;

    final newEggs = List<Egg>.from(current.eggs)..remove(event.egg);
    final newMissedCount = (current.missedEggsCount > 0) ? current.missedEggsCount - 1 : 0;

    emit(current.copyWith(
      eggs: newEggs,
      missedEggsCount: newMissedCount,
      showMissedIcon: true,
    ));

    await Future.delayed(const Duration(seconds: 1));

    final currentState = state;
    if (currentState is GameRunning) {
      emit(currentState.copyWith(showMissedIcon: false));
    }

    if (newMissedCount == 0) {
      emit(GameOver(score: current.score));
      return;
    }

    if (totalDroppedEggs >= totalEggsToDrop && newMissedCount < 3) {
      emit(GameWon(score: current.score));
    }
  }

  void _onEggCaught(EggCaught event, Emitter<GameState> emit) {
    if (state is! GameRunning) return;
    final current = state as GameRunning;

    int eggScore = event.egg.value;
    if (event.egg.multiplier != null) eggScore *= event.egg.multiplier!;

    final newEggs = List<Egg>.from(current.eggs)..remove(event.egg);
    final newScore = current.score + eggScore;

    emit(current.copyWith(eggs: newEggs, score: newScore));

    if (totalDroppedEggs >= totalEggsToDrop && current.missedEggsCount < 3) {
      emit(GameWon(score: newScore));
    }
  }

  void _onPausePressed(PausePressed event, Emitter<GameState> emit) {
    emit(GamePaused(lastState: state));
  }

  void _onResumePressed(ResumePressed event, Emitter<GameState> emit) {
    if (state is GamePaused) emit((state as GamePaused).lastState);
  }

  void _onChickenMoved(ChickenMoved event, Emitter<GameState> emit) {
    if (state is! GameRunning) return;
    final current = state as GameRunning;
    emit(current.copyWith(chickenX: event.x));
  }

  void _onMultiplierCaught(MultiplierCaught event, Emitter<GameState> emit) {
    if (state is! GameRunning) return;
    final current = state as GameRunning;
    emit(current.copyWith(multiplier: event.multiplier));
  }

  void _onRestartPressed(RestartPressed event, Emitter<GameState> emit) {
    totalDroppedEggs = 0;
    emit(GameRunning(score: 0, eggs: [], chickenX: 0.0, paused: false));
  }
}
