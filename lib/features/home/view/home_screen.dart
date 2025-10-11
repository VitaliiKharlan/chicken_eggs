import 'package:auto_route/auto_route.dart';
import 'package:chicken_eggs/features/home/widgets/info_button_widget.dart';
import 'package:chicken_eggs/features/home/widgets/menu_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/router/router.dart';
import '../../../core/theme/app_images.dart';
import '../widgets/action_button_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.backgroundLoading),
                fit: BoxFit.fill,
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: 12,
            right: 12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: InfoButtonWidget(),
                    onTap: () {
                      context.router.push(const HowToPlayRoute());
                    },
                  ),
                  InkWell(
                    child: MenuButtonWidget(),
                    onTap: () {
                      context.router.push(const MenuRoute());
                    },
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 108,
            left: 64,
            right: 32,
            child: Image.asset(
              AppImages.chickenMale,

              height: 648,
              fit: BoxFit.fill,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Positioned(
            bottom: 72,
            left: 40,
            right: 40,
            child: ActionButtonWidget(
              iconAsset: AppImages.actionPlay,
              height: 164,
              width: 256,
              iconSize: 180,
              onPressed: () {
                context.router.replace(const GameRoute());
              },
            ),
          ),
        ],
      ),
    );
  }
}
