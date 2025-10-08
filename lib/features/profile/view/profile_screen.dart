import 'package:auto_route/auto_route.dart';
import 'package:chicken_eggs/core/theme/app_svg_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/router/router.dart';
import '../../../core/theme/app_images.dart';
import '../../../core/widgets/bring_back_button_widget.dart';
import '../../menu/widgets/menu_button_widget.dart';
import '../widgets/show_profile_choice_dialog.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                    child: BringBackButtonWidget(),
                    onTap: () {
                      context.router.replace(const MenuRoute());
                    },
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 160,
            left: 56,
            right: 56,
            bottom: 196,
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Color(0xCC7A025A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFFF6CD8), width: 5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'PROFILE',
                      style: GoogleFonts.rubikMonoOne(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              AppImages.backButton,
                              height: 132,
                              width: 132,
                            ),
                            Positioned(
                              bottom: -8,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF1BC440),
                                        Color(0xFF43B805),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    color: Color(0xFFFF6CD8),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      AppSvgImages.iconEdit,
                                      height: 18,
                                      width: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),
                    Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6CD8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'USERNAME',
                              style: GoogleFonts.rubikMonoOne(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 1,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SvgPicture.asset(
                              AppSvgImages.iconEdit,
                              height: 18,
                              width: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 28),
                    Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6CD8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'EMAIL',
                              style: GoogleFonts.rubikMonoOne(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 1,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SvgPicture.asset(
                              AppSvgImages.iconEdit,
                              height: 18,
                              width: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            left: 32,
            right: 32,
            bottom: 24,
            child: MenuButtonWidget(
              text: 'SAVE',
              fontSize: 40,
              height: 120,
              width: 240,
              onPressed: () {
                showProfileChoiceDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
