import 'package:flame/components.dart';

class Chicken extends SpriteComponent {
  Chicken({required Sprite sprite, required Vector2 position})
    : super(sprite: sprite, position: position, size: Vector2(64, 64));

  void moveTo(double x) {
    position.x = x - size.x / 2; // центрируем курицу по X
  }
}
