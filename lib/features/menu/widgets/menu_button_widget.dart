import 'package:chicken_eggs/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuButtonWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? height;
  final double? width;
  final VoidCallback onPressed;

  const MenuButtonWidget({
    super.key,
    required this.text,
    this.fontSize = 21,
    this.height,
    this.width,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final buttonWidth = width ?? 180;
    final buttonHeight = height ?? 80;
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: buttonHeight,
        width: buttonWidth,

        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppImages.menuButton,
              fit: BoxFit.fill,
              height: buttonHeight,
              width: buttonWidth,

            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.rubikMonoOne(
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1
                  ..color = Color(0xFF8C0231),
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.rubikMonoOne(
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
