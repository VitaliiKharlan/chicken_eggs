import '../components/egg.dart';

abstract class GameState {}

class GameRunning extends GameState {
  final int score;
  final List<Egg> eggs;
  final double chickenX;
  final bool paused;
  final int multiplier;
  final bool showMissedIcon;
  final int missedEggsCount;

  GameRunning({
    required this.score,
    required this.eggs,
    required this.chickenX,
    required this.paused,
    this.multiplier = 1,
    this.showMissedIcon = false,
    this.missedEggsCount = 3,
  });

  GameRunning copyWith({
    int? score,
    List<Egg>? eggs,
    double? chickenX,
    bool? paused,
    int? multiplier,
    bool? showMissedIcon,
    int? missedEggsCount,
  }) {
    return GameRunning(
      score: score ?? this.score,
      eggs: eggs ?? this.eggs,
      chickenX: chickenX ?? this.chickenX,
      paused: paused ?? this.paused,
      multiplier: multiplier ?? this.multiplier,
      showMissedIcon: showMissedIcon ?? this.showMissedIcon,
      missedEggsCount: missedEggsCount ?? this.missedEggsCount,
    );
  }
}

class GamePaused extends GameState {
  final GameState lastState;
  GamePaused({required this.lastState});
}

class GameOver extends GameState {
  final int score;

  GameOver({required this.score});
}
