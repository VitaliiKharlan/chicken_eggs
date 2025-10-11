import 'package:auto_route/auto_route.dart';
import 'package:chicken_eggs/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SystemButtonWidget extends StatelessWidget {
  final String iconAsset;
  final VoidCallback? onPressed;

  const SystemButtonWidget({
    super.key,
    required this.iconAsset,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => context.router.maybePop(),
      child: SizedBox(
        width: 88,
        height: 88,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppImages.systemButton,
              width: 88,
              height: 88,
              fit: BoxFit.cover,
            ),
            SvgPicture.asset(
              iconAsset,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
