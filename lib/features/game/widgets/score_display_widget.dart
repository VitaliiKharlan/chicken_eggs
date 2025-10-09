import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../chicken_game.dart';
import '../game_bloc/game_bloc.dart';
import '../game_bloc/game_state.dart';

class ScoreDisplayWidget extends StatelessWidget {
  final ChickenGame game;
  const ScoreDisplayWidget({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameRunning) {
          return Positioned(
            top: 20, left: 20,
            child: Row(
              children: [
                Icon(Icons.egg, color: Colors.yellow, size: 36),
                const SizedBox(width: 10),
                Text('${state.score}', style: const TextStyle(fontSize: 36, color: Colors.white)),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
