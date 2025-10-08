import 'package:flutter/material.dart';
import '../widgets/profile_choice_dialog.dart';

void showProfileChoiceDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black54,
    builder: (context) => const ProfileChoiceDialog(),
  );
}
