import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/egg.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
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
    final state = this.state as GameRunning;
    emit(state.copyWith(eggs: List.from(state.eggs)..add(event.egg)));
  }

  void _onEggMissed(EggMissed event, Emitter<GameState> emit) async {
    final state = this.state as GameRunning;
    if (!state.eggs.contains(event.egg)) return;

    final newEggs = List<Egg>.from(state.eggs)..remove(event.egg);

    final newMissedCount =
        (state.missedEggsCount > 0) ? state.missedEggsCount - 1 : 0;

    if (newMissedCount == 0) {
      emit(GameOver(score: state.score));
      return;
    }

    emit(
      state.copyWith(
        eggs: newEggs,
        missedEggsCount: newMissedCount,
        showMissedIcon: true,
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    final currentState = this.state;
    if (currentState is GameRunning) {
      emit(currentState.copyWith(showMissedIcon: false));
    }
  }

  void _onEggCaught(EggCaught event, Emitter<GameState> emit) {
    final state = this.state as GameRunning;
    int eggScore = event.egg.value;
    if (event.egg.multiplier != null) {
      eggScore *= event.egg.multiplier!;
    }
    emit(
      state.copyWith(
        eggs: List.from(state.eggs)..remove(event.egg),
        score: state.score + eggScore,
      ),
    );
  }

  void _onPausePressed(PausePressed event, Emitter<GameState> emit) {
    emit(GamePaused(lastState: state));
  }

  void _onResumePressed(ResumePressed event, Emitter<GameState> emit) {
    if (state is GamePaused) emit((state as GamePaused).lastState);
  }

  void _onChickenMoved(ChickenMoved event, Emitter<GameState> emit) {
    final state = this.state as GameRunning;
    emit(state.copyWith(chickenX: event.x));
  }

  void _onMultiplierCaught(MultiplierCaught event, Emitter<GameState> emit) {
    final state = this.state as GameRunning;
    emit(state.copyWith(multiplier: event.multiplier));
  }

  void _onRestartPressed(RestartPressed event, Emitter<GameState> emit) {
    emit(GameRunning(score: 0, eggs: [], chickenX: 0.0, paused: false));
  }
}
