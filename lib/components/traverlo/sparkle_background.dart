import 'package:flutter/material.dart';

import '../../theme/traverlo_colors.dart';

/// Night-blue gradient with a few soft four-point stars in the top-left.
class SparkleBackground extends StatelessWidget {
  const SparkleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            TraverloColors.gradientTop,
            TraverloColors.gradientMid,
            TraverloColors.gradientBottom,
          ],
          stops: [0.0, 0.45, 1.0],
        ),
      ),
      child: CustomPaint(painter: _SparklePainter()),
    );
  }
}

class _SparklePainter extends CustomPainter {
  const _SparklePainter();

  @override
  void paint(Canvas canvas, Size size) {
    // (x, y, radius, opacity), x/y as fractions of the width.
    for (final (x, y, r, a) in const [
      (0.08, 0.06, 9.0, 0.35),
      (0.22, 0.04, 6.0, 0.25),
      (0.3, 0.1, 11.0, 0.3),
      (0.12, 0.16, 7.0, 0.2),
      (0.26, 0.2, 5.0, 0.18),
      (0.04, 0.26, 6.0, 0.15),
      (0.18, 0.3, 4.0, 0.12),
    ]) {
      final c = Offset(size.width * x, size.width * y);
      final paint = Paint()..color = Colors.white.withValues(alpha: a);
      final pinch = r * 0.18;
      canvas.drawPath(
        Path()
          ..moveTo(c.dx, c.dy - r)
          ..quadraticBezierTo(c.dx + pinch, c.dy - pinch, c.dx + r, c.dy)
          ..quadraticBezierTo(c.dx + pinch, c.dy + pinch, c.dx, c.dy + r)
          ..quadraticBezierTo(c.dx - pinch, c.dy + pinch, c.dx - r, c.dy)
          ..quadraticBezierTo(c.dx - pinch, c.dy - pinch, c.dx, c.dy - r)
          ..close(),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
