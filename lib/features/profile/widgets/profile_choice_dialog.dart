import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profile_choice_button.dart';

class ProfileChoiceDialog extends StatelessWidget {
  const ProfileChoiceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 280,
        width: screenWidth,
        decoration: const BoxDecoration(
          color: Color(0xFF6B6F7A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        padding: const EdgeInsets.only(top: 32),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "PLEASE MAKE YOUR CHOICE",
              style: GoogleFonts.fredoka(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 1,
              width: screenWidth,
              color: Color(0xFF9E9E9E),
              margin: const EdgeInsets.symmetric(vertical: 8),
            ),
            const SizedBox(height: 20),
            ProfileChoiceButton(
              title: "MAKE A PHOTO",
              onTap: () {
                context.router.maybePop();
              },
            ),
            const SizedBox(height: 8),
            ProfileChoiceButton(
              title: "CHOOSE PHOTO",
              onTap: () {
                context.router.maybePop();
                // Gallery callback
              },
            ),
            const SizedBox(height: 18),
            ProfileChoiceButton(
              title: "CANCEL",
              onTap: () => context.router.maybePop(),
              isCancel: true,
              height: 32,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
