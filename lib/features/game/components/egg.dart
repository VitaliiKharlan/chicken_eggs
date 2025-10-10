import 'package:flame/components.dart';

class Egg extends SpriteComponent {
  final int value;
  final int? multiplier;

  Egg({
    required Sprite sprite,
    required Vector2 position,
    required this.value,
    this.multiplier,
  }) : super(sprite: sprite, position: position, size: Vector2(40, 56));

  Egg copyWith({
    Sprite? sprite,
    Vector2? position,
    int? value,
    int? multiplier,
  }) {
    return Egg(
      sprite: sprite ?? this.sprite!,
      position: position ?? this.position.clone(),
      value: value ?? this.value,
      multiplier: multiplier ?? this.multiplier,
    );
  }
}
