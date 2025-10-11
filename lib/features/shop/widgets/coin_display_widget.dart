import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_images.dart';

class CoinDisplayWidget extends StatelessWidget {
  final int coins;

  const CoinDisplayWidget({
    super.key,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xCC7A025A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFF6CD8), width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImages.coin,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          Text(
            '$coins',
            style: GoogleFonts.rubikMonoOne(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
