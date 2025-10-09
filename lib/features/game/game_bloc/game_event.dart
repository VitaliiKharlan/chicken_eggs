import '../components/egg.dart';

abstract class GameEvent {}

class EggDropped extends GameEvent {
  final Egg egg;
  EggDropped(this.egg);
}

class EggMissed extends GameEvent {
  final Egg egg;
  EggMissed(this.egg);
}

class EggCaught extends GameEvent {
  final Egg egg;
  EggCaught(this.egg);
}

class PausePressed extends GameEvent {}

class ResumePressed extends GameEvent {}

class HomePressed extends GameEvent {}

class RestartPressed extends GameEvent {}

class ChickenMoved extends GameEvent {
  final double x;
  ChickenMoved(this.x);
}

class MultiplierCaught extends GameEvent {
  final int multiplier;
  MultiplierCaught(this.multiplier);
}
