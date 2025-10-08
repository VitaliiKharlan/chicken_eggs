import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileChoiceButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isCancel;
  final double? height;
  final double? width;

  const ProfileChoiceButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isCancel = false,
    this.width,
    this.height,

  });

  @override
  Widget build(BuildContext context) {
    final buttonWidth = width ?? 220;
    final buttonHeight = height ?? (isCancel ? 32 : 44);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(8),
          border: isCancel
              ? null
              : Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: Text(
          title,
          style: GoogleFonts.fredoka(
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
