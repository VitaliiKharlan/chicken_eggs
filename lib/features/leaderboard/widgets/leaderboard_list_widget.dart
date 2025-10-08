import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_images.dart';
import '../model/leaderboard_item.dart';


class LeaderboardListWidget extends StatelessWidget {
  final List<LeaderboardItem> items;

  const LeaderboardListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final rank = index + 1;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: SizedBox(
            height: 60,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 12,
                  top: 4,
                  right: 0,
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: item.isCurrentUser ? Colors.amber : Color(0xFFFF89E2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 54),
                        Expanded(
                          child: Text(
                            item.username,
                            style: GoogleFonts.rubikMonoOne(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Text(
                            '${item.score}',
                            style: GoogleFonts.rubikMonoOne(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    AppImages.leaderboardButton,
                    height: 60,
                    width: 60,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
