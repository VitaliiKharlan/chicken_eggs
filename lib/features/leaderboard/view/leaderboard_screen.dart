import 'package:auto_route/auto_route.dart';

import 'package:chicken_eggs/features/leaderboard/widgets/leaderboard_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/router/router.dart';
import '../../../core/theme/app_images.dart';
import '../../../core/widgets/bring_back_button_widget.dart';
import '../data/leaderboard_mock_data.dart';


@RoutePage()
class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final leaderboard = mockLeaderboard;

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
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Color(0xCC7A025A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFFF6CD8), width: 4),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      'LEADERBOARD',
                      style: GoogleFonts.rubikMonoOne(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: LeaderboardListWidget(items: leaderboard),
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
