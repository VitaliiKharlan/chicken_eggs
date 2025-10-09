import 'package:chicken_eggs/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoinCounterWidget extends StatelessWidget {
  final int coins;

  const CoinCounterWidget({
    super.key,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerRight,
      children: [
        Container(
          height: 32,
          width: 120,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.deepOrange,
              width: 3,
            ),
          ),
          child: Text(
            coins.toString(),
            style: GoogleFonts.rubikMonoOne(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Image.asset(
            AppImages.coin,
            width: 56,
            height: 56,
          ),
        ),
      ],
    );
  }
}