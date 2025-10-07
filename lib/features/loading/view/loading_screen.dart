import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


import '../../../core/theme/app_images.dart';

import '../widgets/flame_progress_bar.dart';

@RoutePage()
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              AppImages.backgroundLoading,
              fit: BoxFit.fill,
            ),
          ),

          Positioned(
            bottom: -20,
            left: 20,
            right: 0,
            child: Image.asset(
              AppImages.chickenMale,
              // width: 240,
              height: 800,
              fit: BoxFit.fill,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Positioned(
              bottom: 88,
              left: 36,
              right: 36,
              child: FlameProgressBar(progress: 0.85)
          ),

        ],
      ),
    );
  }
}
