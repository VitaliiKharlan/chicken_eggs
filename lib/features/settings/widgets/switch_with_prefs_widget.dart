import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchWithPrefsWidget extends StatefulWidget {
  final String title;
  final String prefsKey;
  final double width;
  final double height;
  final double toggleSize;
  final Color activeColor;
  final Color inactiveColor;
  final Color toggleColor;

  const SwitchWithPrefsWidget({
    super.key,
    required this.title,
    required this.prefsKey,
    this.width = 60,
    this.height = 30,
    this.toggleSize = 24,
    this.activeColor = const Color(0xFF00C853),
    this.inactiveColor = const Color(0xFFB0BEC5),
    this.toggleColor = Colors.white,
  });

  @override
  State<SwitchWithPrefsWidget> createState() => _SwitchWithPrefsWidgetState();
}

class _SwitchWithPrefsWidgetState extends State<SwitchWithPrefsWidget> {
  bool status = false;

  @override
  void initState() {
    super.initState();
    _loadSwitchState();
  }

  Future<void> _loadSwitchState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      status = prefs.getBool(widget.prefsKey) ?? false;
    });
  }

  Future<void> _saveSwitchState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(widget.prefsKey, value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.rubikMonoOne(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Colors.white,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:
                    status
                        ? const [Color(0xFF1BC431), Color(0xFF007421)]
                        : const [Color(0xFFCDCDCD), Color(0xFF696969)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(widget.height / 2),
            ),
            child: FlutterSwitch(
              width: widget.width,
              height: widget.height,
              toggleSize: widget.toggleSize,
              value: status,
              borderRadius: widget.height / 2,
              padding: 2,
              activeColor: Colors.transparent,
              inactiveColor: Colors.transparent,
              toggleColor: widget.toggleColor,
              onToggle: (val) {
                setState(() => status = val);
                _saveSwitchState(val);
              },
            ),
          ),
        ],
      ),
    );
  }
}
