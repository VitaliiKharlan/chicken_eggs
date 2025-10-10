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

class PauseOverlayWidget extends StatelessWidget {
  final ChickenGame game;

  const PauseOverlayWidget({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Column(
        children: [
          const SizedBox(height: 348),
          Text(
            'PAUSED',
            style: GoogleFonts.rubikMonoOne(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Color(0xFFFFFFFF),
            ),
          ),
          const SizedBox(height: 48),
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
            iconAsset: AppImages.actionPlay,
            height: 164,
            width: 256,
            iconSize: 180,
            onPressed: () {
              // context.router.replace(const GameRoute());
            },
          ),
        ],
      ),
    );
  }
}
