import 'package:chicken_eggs/core/theme/app_images.dart';
import 'package:flutter/material.dart';


class MenuButtonWidget extends StatelessWidget {
  const MenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImages.menuHomeButton,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          // Image.asset(
          //   AppImages.rectangleButton,
          //   width: 56,
          //   height: 56,
          //   fit: BoxFit.cover,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 4),
          //   child: SvgPicture.asset(
          //     AppSvgImages.iconMenu,
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
