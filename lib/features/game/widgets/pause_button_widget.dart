import 'package:chicken_eggs/core/theme/app_images.dart';
import 'package:flutter/material.dart';

class PauseButtonWidget extends StatelessWidget {
  const PauseButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImages.pauseButton,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          // Image.asset(
          //   AppImages.rectangleButton,
          //   width: 80,
          //   height: 80,
          //   fit: BoxFit.cover,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 4),
          //   child: SvgPicture.asset(
          //     AppSvgImages.iconInfo,
          //     width: 24,
          //     height: 24,
          //     fit: BoxFit.contain,
          //   ),
          // ),
        ],
      ),
    );
  }
}
