import 'package:chicken_eggs/features/game/game_bloc/game_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/router.dart';

class ChickenEggsApp extends StatelessWidget {
  final _router = AppRouter();

  ChickenEggsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Chicken Eggs',
        routerConfig: _router.config(),
      ),
    );
  }
}
