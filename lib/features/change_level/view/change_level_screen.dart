import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/router/router.dart';
import '../../../core/theme/app_images.dart';
import '../../../core/widgets/coin_counter_widget.dart';
import '../../../core/widgets/system_button_widget.dart';
import '../widgets/change_level_grid_widget.dart';

@RoutePage()
class ChangeLevelScreen extends StatelessWidget {
  const ChangeLevelScreen({super.key});

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
                image: AssetImage(AppImages.backgroundLoading),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SystemButtonWidget(
                    iconAsset: AppImages.bringBack,
                    onPressed: () {
                      context.router.push(MenuRoute());
                    },
                  ),
                  // context.router.push(const HowToPlayRoute());
                  CoinCounterWidget(coins: coins),
                ],
              ),
            ),
          ),

          Positioned(
            top: 150,
            left: 32,
            right: 32,
            child: Text(
              'CHANGE LEVEL',
              style: GoogleFonts.rubikMonoOne(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Positioned(
            top: 320,
            left: 32,
            right: 32,
            child: ChangeLevelGridWidget(),
          ),
        ],
      ),
    );
  }
}
