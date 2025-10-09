import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/chicken.dart';
import 'components/egg.dart';
import 'game_bloc/game_bloc.dart';
import 'game_bloc/game_event.dart';

class ChickenGame extends FlameGame with TapCallbacks, DragCallbacks {
  final GameBloc bloc;
  Chicken? chicken;
  final Random _random = Random();
  late final List<Sprite> eggSprites;

  ChickenGame(this.bloc);

  bool isPaused = false;

  void pause() => isPaused = true;
  void resume() => isPaused = false;

  @override
  Future<void> onLoad() async {
    final background =
        SpriteComponent()
          ..sprite = await loadSprite('background_game.png')
          ..size = size
          ..position = Vector2.zero();
    add(background);

    final chickenSprite = await loadSprite('chicken_female.png');
    chicken = Chicken(
      sprite: chickenSprite,
      position: Vector2(size.x / 2, size.y - 80),
    );
    add(chicken!);

    eggSprites = [for (int i = 1; i <= 12; i++) await loadSprite('egg_$i.png')];

    _startSpawningEggs();

    overlays.add('ScoreDisplay');
  }

  Future<void> _startSpawningEggs() async {
    for (int i = 0; i < 5; i++) {
      if (isRemoving) break;
      _spawnSingleEgg();
      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }

  void _spawnSingleEgg() {
    debugPrint('Egg spawned at ${DateTime.now()}');
    final double x = _random.nextDouble() * (size.x - 40);
    final int value = _random.nextInt(10) + 1;
    final sprite = eggSprites[_random.nextInt(eggSprites.length)];

    final egg = Egg(sprite: sprite, position: Vector2(x, 0), value: value);

    add(egg);
    bloc.add(EggDropped(egg));
  }

  void spawnEgg() async {
    final double x = _random.nextDouble() * (size.x - 40);

    final int value = _random.nextInt(9) + 1;

    final sprite = await loadSprite('egg_1.png');

    final egg = Egg(sprite: sprite, position: Vector2(x, 0), value: value);

    add(egg);
  }

  @override
  void update(double dt) {
    if (isPaused) return; // ⬅️ пропускаем обновления при паузе
    super.update(dt);

    for (final component in children.whereType<Egg>()) {
      component.position.y += 150 * dt;

      if (component.position.y > size.y) {
        remove(component);
        bloc.add(EggMissed(component));
        continue;
      }

      if (chicken != null) {
        final chickenRect = Rect.fromLTWH(
          chicken!.position.x - chicken!.size.x / 2,
          chicken!.position.y - chicken!.size.y / 2,
          chicken!.size.x,
          chicken!.size.y,
        );

        final eggRect = Rect.fromLTWH(
          component.position.x,
          component.position.y,
          component.size.x,
          component.size.y,
        );

        if (chickenRect.overlaps(eggRect)) {
          remove(component);
          bloc.add(EggCaught(component));
        }
      }
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    final tapX = event.localPosition.x;
    chicken?.moveTo(tapX);
  }
}
