import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/router/router.dart';
import '../../../core/theme/app_images.dart';
import '../../../core/widgets/coin_counter_widget.dart';
import '../widgets/pause_button_widget.dart';

@RoutePage()
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  final int coins = 1000;

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
                        context.router.replace(const MenuRoute());
                      },
                      child: const PauseButtonWidget(),
                    ),
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
