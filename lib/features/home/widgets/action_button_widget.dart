import 'package:chicken_eggs/core/theme/app_images.dart';
import 'package:flutter/material.dart';


class ActionButtonWidget extends StatelessWidget {
  final String iconAsset;
  final double? iconSize;
  final double? height;
  final double? width;
  final VoidCallback onPressed;

  const ActionButtonWidget({
    super.key,
    required this.iconAsset,
    this.iconSize,
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
            Image.asset(
              iconAsset,
              height: iconSize ?? buttonHeight * 0.5,
              width: iconSize ?? buttonHeight * 0.5,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
