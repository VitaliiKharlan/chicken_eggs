import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
            top: 120,
            left: 20,
            child: Row(
              children: [
                Text(
                  'Score',
                  style: GoogleFonts.rubikMonoOne(
                    color: Color(0xFFFFFF00),
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${state.score}',
                  style: GoogleFonts.rubikMonoOne(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                  ),
                ),
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
