import 'package:auto_route/auto_route.dart';
import 'package:chicken_eggs/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_images.dart';
import '../../home/widgets/action_button_widget.dart';
import '../chicken_game.dart';
import '../game_bloc/game_bloc.dart';
import '../game_bloc/game_event.dart';

class WinOverlayWidget extends StatelessWidget {
  final ChickenGame game;
  final int score;
  // final int bestScore;

  const WinOverlayWidget({
    super.key,
    required this.game,
    required this.score,
    // required this.bestScore,
  });

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
            child: Container(
              color: Colors.black54,
              child: Column(
                children: [
                  const SizedBox(height: 212),
                  Text(
                    'YOU WIN!',
                    style: GoogleFonts.rubikMonoOne(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Container(
                    height: 56,
                    width: 320,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF43B805),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Color(0xFF006B1E), width: 5),
                    ),
                    child: Text(
                      'SCORE  ${score.toString().padLeft(4, '0')}',
                      style: GoogleFonts.rubikMonoOne(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // BEST SCORE box
                  Container(
                    height: 56,
                    width: 320,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF43B805),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Color(0xFF006B1E), width: 5),
                    ),
                    child: Text(
                      'BEST  ${score.toString().padLeft(4, '0')}',
                      style: GoogleFonts.rubikMonoOne(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.router.replace(HomeRoute());
                        },
                        style: TextButton.styleFrom(
                          textStyle: GoogleFonts.rubikMonoOne(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            decoration: TextDecoration.underline,
                          ),
                          foregroundColor: Color(0xFFFFFFFF),
                        ),
                        child: const Text('HOME'),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          context.read<GameBloc>().add(RestartPressed());
                          game.overlays.remove('PauseMenu');
                        },
                        style: TextButton.styleFrom(
                          textStyle: GoogleFonts.rubikMonoOne(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            decoration: TextDecoration.underline,
                          ),
                          foregroundColor: Color(0xFFFFFFFF),
                        ),
                        child: const Text('RESTART'),
                      ),
                    ],
                  ),

                  SizedBox(height: 92),
                  ActionButtonWidget(
                    iconAsset: AppImages.actionNext,
                    height: 164,
                    width: 256,
                    iconSize: 180,
                    onPressed: () {
                      context.router.replace(const ChangeLevelRoute());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
