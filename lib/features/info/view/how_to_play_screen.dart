import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/router/router.dart';
import '../../../core/theme/app_images.dart';
import '../../../core/widgets/bring_back_button_widget.dart';

@RoutePage()
class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({super.key});

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
                  InkWell(
                    child: BringBackButtonWidget(),
                    onTap: () {
                      context.router.replace(const MenuRoute());
                    },
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 150,
            left: 32,
            right: 32,
            bottom: 40,
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Color(0xCC7A025A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFFF6CD8), width: 5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'HOW TO PLAY',
                      style: GoogleFonts.rubikMonoOne(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Move the chicken left and right and catch the eggs falling from above.',
                      style: GoogleFonts.rubikMonoOne(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'If three eggs fall, the game ends – you lose.',
                      style: GoogleFonts.rubikMonoOne(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'If fewer than three eggs out of 10 fall, you win.',
                      style: GoogleFonts.rubikMonoOne(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
