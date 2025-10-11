import 'package:auto_route/auto_route.dart';
import 'package:chicken_eggs/core/theme/app_svg_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/router/router.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../core/theme/app_images.dart';
import '../../../core/widgets/system_button_widget.dart';
import '../../menu/widgets/menu_button_widget.dart';
import '../widgets/avater_picker_widget.dart';
import '../widgets/show_profile_choice_dialog.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final storage = LocalStorageService();

  late TextEditingController usernameController;
  late TextEditingController emailController;
  late String selectedAvatar;

  bool isEditingUsername = false;
  bool isEditingEmail = false;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: storage.playerName);
    emailController = TextEditingController(text: storage.playerEmail);
    selectedAvatar = storage.playerAvatar;
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    super.dispose();
  }

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
                    child: SystemButtonWidget(
                      iconAsset: AppSvgImages.iconBack,
                      onPressed: () {
                        context.router.push(const MenuRoute());
                      },
                    ),
                    // onTap: () {
                    //   context.router.replace(const MenuRoute());
                    // },
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
                              AppImages.systemButton,
                              height: 132,
                              width: 132,
                            ),
                            Positioned(
                              left: 4,
                              right: 4,
                              child: AvatarPickerWidget(
                                currentAvatar: selectedAvatar,
                                onAvatarChanged: (newAvatar) {
                                  setState(() {
                                    selectedAvatar = newAvatar;
                                  });
                                },
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
                            child: TextField(
                              controller: usernameController,
                              readOnly: !isEditingUsername,
                              style: GoogleFonts.rubikMonoOne(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 1,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFFF6CD8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'USERNAME',
                                hintStyle: GoogleFonts.rubikMonoOne(
                                  color: Color(0x8AFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isEditingUsername = true;
                                });
                              },
                              child: SvgPicture.asset(
                                AppSvgImages.iconEdit,
                                height: 18,
                                width: 18,
                              ),
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
                            child: TextField(
                              controller: emailController,
                              readOnly: !isEditingEmail,
                              style: GoogleFonts.rubikMonoOne(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 1,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFFF6CD8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'EMAIL',
                                hintStyle: GoogleFonts.rubikMonoOne(
                                  color: Color(0x8AFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: InkWell(
                              child: SvgPicture.asset(
                                AppSvgImages.iconEdit,
                                height: 18,
                                width: 18,
                              ),
                              onTap: () {
                                setState(() {
                                  isEditingEmail = true;
                                });
                              },
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
                storage.playerAvatar = selectedAvatar;
                storage.playerName = usernameController.text.trim();
                storage.playerEmail = emailController.text.trim();
                showProfileChoiceDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
