import 'package:flutter/material.dart';

import 'core/router/router.dart';

class ChickenEggsApp extends StatelessWidget {
  final _router = AppRouter();

  ChickenEggsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Chicken Eggs',
      routerConfig: _router.config(),
    );
  }
}
