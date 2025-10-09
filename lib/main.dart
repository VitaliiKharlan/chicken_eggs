import 'package:flame/flame.dart';
// import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'chicken_eggs_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();

  runApp(ChickenEggsApp());
}
