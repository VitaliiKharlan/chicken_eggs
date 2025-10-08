import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/router/router.dart';
import '../../../core/theme/app_images.dart';
import '../../../core/widgets/bring_back_button_widget.dart';
import '../../menu/widgets/menu_button_widget.dart';

import '../widgets/switch_with_prefs_widget.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool soundEnabled = false;
  bool vibrationEnabled = false;
  bool notificationsEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadSwitches();
  }

  Future<void> _loadSwitches() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      soundEnabled = prefs.getBool('sound_enabled') ?? false;
      vibrationEnabled = prefs.getBool('vibration_enabled') ?? false;
      notificationsEnabled = prefs.getBool('notifications_enabled') ?? false;
    });
  }

  Future<void> _saveSwitches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sound_enabled', soundEnabled);
    await prefs.setBool('vibration_enabled', vibrationEnabled);
    await prefs.setBool('notifications_enabled', notificationsEnabled);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Settings saved')));
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
                  SwitchWithPrefsWidget(title: "SOUND", prefsKey: "sound_pref"),
                  SizedBox(height: 24),
                  SwitchWithPrefsWidget(
                    title: "NOTIFICATION",
                    prefsKey: "notifications_pref",
                  ),
                  SizedBox(height: 24),
                  SwitchWithPrefsWidget(
                    title: "VIBRATION",
                    prefsKey: "vibration_pref",
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
              onPressed: _saveSwitches,
            ),
          ),
        ],
      ),
    );
  }
}
