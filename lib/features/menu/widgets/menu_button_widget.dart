import 'package:chicken_eggs/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuButtonWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final VoidCallback onPressed;

  const MenuButtonWidget({
    super.key,
    required this.text,
    this.fontSize = 22,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 180,
        height: 80,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppImages.menuButton,
              fit: BoxFit.fill,
              width: 180,
              height: 80,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.rubikMonoOne(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
