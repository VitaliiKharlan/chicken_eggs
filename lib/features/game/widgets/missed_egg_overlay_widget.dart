import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../game_bloc/game_bloc.dart';
import '../game_bloc/game_state.dart';

class MissedOverlay extends StatelessWidget {
  const MissedOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameRunning && state.showMissedIcon) {
          return Center(
            child: Icon(
              Icons.favorite,
              size: 108,
              color: Colors.red,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
