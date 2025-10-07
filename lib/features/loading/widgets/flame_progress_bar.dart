import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlameProgressBar extends StatelessWidget {
  final double progress;

  const FlameProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final progressPercent = (progress * 100).toInt();

    return CustomPaint(
      painter: _GradientBorderPainter(),
      child: Container(
        width: 907,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) => Container(
                width: constraints.maxWidth * progress,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFF2B00),
                      Color(0xFFFFE500),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Center(
              child: Text(
                '$progressPercent%',
                style: GoogleFonts.rubikMonoOne(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.black45,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final double strokeWidth = 6.0;
    final RRect outer = RRect.fromRectAndRadius(rect, const Radius.circular(15));
    final RRect inner = outer.deflate(strokeWidth);

    final Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFFF790C),
          Color(0xFFFFE500),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;


    canvas.drawRRect(outer, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}