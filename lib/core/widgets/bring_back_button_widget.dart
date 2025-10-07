
import 'package:chicken_eggs/core/theme/app_images.dart';
import 'package:flutter/material.dart';

class BringBackButtonWidget extends StatelessWidget {
  // final VoidCallback onPressed;

  const BringBackButtonWidget({
    super.key,
    // required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImages.backButton,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
          ),
          Image.asset(
            AppImages.bringBack,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
