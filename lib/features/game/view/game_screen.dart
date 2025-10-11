import 'package:auto_route/auto_route.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/theme/app_images.dart';
import '../../../core/widgets/coin_counter_widget.dart';
import '../chicken_game.dart';
import '../game_bloc/game_bloc.dart';
import '../game_bloc/game_event.dart';
import '../game_bloc/game_state.dart';
import '../widgets/lose_overlay_widget.dart';
import '../widgets/pause_button_widget.dart';
import '../widgets/pause_overlay_widget.dart';
import '../widgets/score_display_widget.dart';
import '../widgets/win_overlay_widget.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final ChickenGame game;
  int coins = 1000;

  @override
  void initState() {
    super.initState();
    game = ChickenGame(context.read<GameBloc>());
    _loadCoins();
  }

  Future<void> _loadCoins() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      coins = prefs.getInt('player_coins') ?? 1000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.backgroundGame),
                fit: BoxFit.fill,
              ),
            ),
          ),

          Positioned.fill(
            child: GameWidget<ChickenGame>.controlled(
              gameFactory: () => game,
              overlayBuilderMap: {
                'ScoreDisplay': (ctx, game) => ScoreDisplayWidget(game: game),
                'PauseMenu': (ctx, game) => PauseOverlayWidget(game: game),
                'LoseOverlay': (ctx, game) {
                  final state = game.bloc.state;
                  final score = state is GameOver ? state.score : 0;
                  return LoseOverlayWidget(game: game, score: score);
                },
                'WinOverlay': (ctx, game) {
                  final state = game.bloc.state;
                  final score = state is GameWon ? state.score : 0;
                  return WinOverlayWidget(game: game, score: score);
                },
              },
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: BlocBuilder<GameBloc, GameState>(
              builder: (context, state) {
                if (state is GameRunning) {
                  return Row(
                    children: [
                      Center(
                        child: Icon(
                          Icons.favorite,
                          size: 48,
                          color: Color(0xFFFF0000),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '${state.missedEggsCount}',
                        style: GoogleFonts.rubikMonoOne(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFF0000),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          Positioned(
            top: 40,
            left: 12,
            right: 12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CoinCounterWidget(coins: coins),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        game.pause();
                        context.read<GameBloc>().add(PausePressed());
                        game.overlays.add('PauseMenu');
                      },
                      child: const PauseButtonWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocListener<GameBloc, GameState>(
            listener: (context, state) {
              if (state is GameOver) {
                game.pause();
                if (!game.overlays.isActive('LoseOverlay')) {
                  game.overlays.add('LoseOverlay');
                }
              } else if (state is GameWon) {
                game.pause();
                if (!game.overlays.isActive('WinOverlay')) {
                  game.overlays.add('WinOverlay');
                }
              }
            },
            child: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
