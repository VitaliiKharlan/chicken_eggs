import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:chicken_eggs/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/router/router.dart';
import '../../../core/widgets/bring_back_button_widget.dart';
import '../../../core/widgets/coin_counter_widget.dart';
import '../widgets/menu_button_widget.dart';

@RoutePage()
class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final int coins = 1000;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              int alphaValue =
                  ((0.2 + 0.4 * sin(_controller.value * 2 * pi)).clamp(
                            0.0,
                            1.0,
                          ) *
                          255)
                      .round();

              return ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.transparent,
                      Colors.orange.withAlpha(alphaValue),
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.backgroundLoading),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
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
                    child: BringBackButtonWidget(),
                    onTap: () {
                      context.router.replace(const HowToPlayRoute());
                    },
                  ),

                  CoinCounterWidget(coins: coins),
                ],
              ),
            ),
          ),

          Positioned(
            top: 150,
            left: 32,
            right: 32,
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Color(0xCC7A025A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFFF6CD8), width: 5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'MENU',
                      style: GoogleFonts.rubikMonoOne(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 24),
                    MenuButtonWidget(
                      text: 'PlAY',
                      onPressed: () {
                        context.router.replace(const HowToPlayRoute());
                      },
                    ),
                    const SizedBox(height: 12),
                    MenuButtonWidget(
                      text: 'PROFILE',
                      onPressed: () {
                        context.router.push(const ProfileRoute());
                      },
                    ),
                    const SizedBox(height: 12),
                    MenuButtonWidget(
                      text: 'SETTINGS',
                      onPressed: () {
                        context.router.push(const SettingsRoute());
                      },
                    ),
                    const SizedBox(height: 12),
                    MenuButtonWidget(
                      text: 'LEADERBOARD',
                      fontSize: 16,
                      onPressed: () {
                        context.router.push(const LeaderboardRoute());
                      },
                    ),
                    const SizedBox(height: 12),
                    MenuButtonWidget(
                      text: 'PRIVACY \nPOLICY',
                      onPressed: () {
                        context.router.push(const HomeRoute());
                      },
                    ),
                    const SizedBox(height: 12),
                    MenuButtonWidget(
                      text: 'TERM \nOF USE',
                      onPressed: () {
                        context.router.push(const LevelRoute());
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
