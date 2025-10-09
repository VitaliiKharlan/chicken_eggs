import 'package:chicken_eggs/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeLevelGridWidget extends StatelessWidget {
  ChangeLevelGridWidget({super.key});

  final List<int> openedLevels = [1, 2, 3, 4, 5, 6];
  final List<int> lockedLevels = [7, 8, 9];

  @override
  Widget build(BuildContext context) {
    const crossAxisCount = 3;
    const horizontalPadding = 0.0;
    const crossAxisSpacing = 12.0;
    const mainAxisSpacing = 20.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth - horizontalPadding * 2;
        final totalSpacing = (crossAxisCount - 1) * crossAxisSpacing;
        final itemWidth = (availableWidth - totalSpacing) / crossAxisCount;


        final imageSize = itemWidth * 0.9;
        final fontSize = (imageSize * 0.28).clamp(18.0, 48.0);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            childAspectRatio: 1,
            children: List.generate(9, (index) {
              final level = index + 1;
              final isOpened = openedLevels.contains(level);

              return Center(
                child: _LevelButton(
                  number: level,
                  opened: isOpened,
                  imageSize: imageSize,
                  fontSize: fontSize,
                  onTap:
                      isOpened ? () => debugPrint("Go to level $level") : null,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

class _LevelButton extends StatelessWidget {
  final int number;
  final bool opened;
  final VoidCallback? onTap;
  final double imageSize;
  final double fontSize;

  const _LevelButton({
    required this.number,
    required this.opened,
    this.onTap,
    required this.imageSize,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: opened ? onTap : null,
      child: SizedBox(
        width: imageSize,
        height: imageSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              opened
                  ? AppImages.changeLevelActive
                  : AppImages.changeLevelInactive,
              width: imageSize,
              height: imageSize,
              fit: BoxFit.contain,
            ),
            Text(
              "$number",
              style: GoogleFonts.rubikMonoOne(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
