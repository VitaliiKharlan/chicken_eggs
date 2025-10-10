import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/app_images.dart';
import '../../../core/theme/app_svg_images.dart';

class AvatarPickerWidget extends StatelessWidget {
  final String currentAvatar;
  final ValueChanged<String> onAvatarChanged;
  final double avatarSize;
  final double buttonSize;
  final double iconSize;

  const AvatarPickerWidget({
    super.key,
    required this.currentAvatar,
    required this.onAvatarChanged,
    this.avatarSize = 112,
    this.buttonSize = 32,
    this.iconSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(currentAvatar, height: avatarSize, width: avatarSize),
        const SizedBox(height: 4),

        InkWell(
          onTap: () async {
            final avatars = [AppImages.chickenMale, AppImages.chickenFemale];

            final selected = await showDialog<String>(
              context: context,
              builder:
                  (context) => SimpleDialog(
                    title: const Text('Choose Avatar'),
                    children:
                        avatars.map((avatar) {
                          return SimpleDialogOption(
                            onPressed: () => Navigator.pop(context, avatar),
                            child: Row(
                              children: [
                                Image.asset(avatar, height: 48, width: 48),
                                const SizedBox(width: 12),
                                Text(avatar.split('/').last.split('.').first),
                              ],
                            ),
                          );
                        }).toList(),
                  ),
            );

            if (selected != null) {
              onAvatarChanged(selected);
            }
          },
          child: Container(
            height: buttonSize,
            width: buttonSize,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1BC440), Color(0xFF43B805)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: SvgPicture.asset(
                AppSvgImages.iconEdit,
                height: iconSize,
                width: iconSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
