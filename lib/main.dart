import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import 'chicken_eggs_app.dart';
import 'core/services/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = LocalStorageService();
  await storage.init(); // SharedPreferences инициализируется один раз
  await Flame.device.fullScreen();

  runApp(ChickenEggsApp());
}
