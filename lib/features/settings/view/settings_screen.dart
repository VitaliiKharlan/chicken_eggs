import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/router/router.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../core/theme/app_images.dart';
import '../../../core/widgets/bring_back_button_widget.dart';
import '../../menu/widgets/menu_button_widget.dart';
import '../widgets/custom_snack_bar_widget.dart';
import '../widgets/switch_with_prefs_widget.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = LocalStorageService();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Фон
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.backgroundLoading),
                fit: BoxFit.fill,
              ),
            ),
          ),

          // Кнопка "назад"
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
                    onTap: () => context.router.replace(const MenuRoute()),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 264,
            left: 8,
            right: 8,
            bottom: 292,
            child: Container(
              padding: const EdgeInsets.only(left: 24, top: 12, right: 24),
              decoration: BoxDecoration(
                color: const Color(0xCC7A025A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFF6CD8), width: 4),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'SETTINGS',
                    style: GoogleFonts.rubikMonoOne(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 48),

                  SwitchWithPrefsWidget(
                    title: "SOUND",
                    initialValue: storage.soundEnabled,
                    onChanged: (val) => storage.soundEnabled = val,
                  ),
                  const SizedBox(height: 24),
                  SwitchWithPrefsWidget(
                    title: "NOTIFICATIONS",
                    initialValue: storage.notificationsEnabled,
                    onChanged: (val) => storage.notificationsEnabled = val,
                  ),
                  const SizedBox(height: 24),
                  SwitchWithPrefsWidget(
                    title: "VIBRATION",
                    initialValue: storage.vibrationEnabled,
                    onChanged: (val) => storage.vibrationEnabled = val,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 32,
            right: 32,
            bottom: 72,
            child: MenuButtonWidget(
              text: 'SAVE',
              fontSize: 40,
              height: 140,
              width: 248,
              onPressed: () {
                CustomSnackBar.show(context, 'Settings saved');
              },
            ),
          ),
        ],
      ),
    );
  }
}
