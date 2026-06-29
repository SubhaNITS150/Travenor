import 'package:flutter/material.dart';

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final BorderRadius borderRadius;
  final Color borderColor;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final EdgeInsets padding;

  const DashedBorderContainer({
    super.key,
    required this.child,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(24),
    ),
    this.borderColor = const Color(0xffC4B5FD),
    this.strokeWidth = 2,
    this.dashWidth = 8,
    this.dashSpace = 6,
    this.padding = const EdgeInsets.all(18),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        borderRadius: borderRadius,
        borderColor: borderColor,
        strokeWidth: strokeWidth,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final BorderRadius borderRadius;
  final Color borderColor;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DashedBorderPainter({
    required this.borderRadius,
    required this.borderColor,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final RRect rRect = borderRadius.toRRect(
      Offset.zero & size,
    );

    final Paint paint = Paint()
      ..color = borderColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()..addRRect(rRect);

    for (final metric in path.computeMetrics()) {
      double distance = 0;

      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(
            distance,
            distance + dashWidth,
          ),
          paint,
        );

        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}