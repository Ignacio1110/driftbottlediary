import 'package:flutter/material.dart';

import '../../diary_theme.dart';

class BezierCurve extends StatelessWidget {
  const BezierCurve({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: BezierCurvePainter(),
        child: child,
      ),
    );
  }
}

class BezierCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the start and end points of the curve
    double startX = 0.0;
    double startY = 0.0;
    double endX = size.width;
    double endY = size.height;

    // Define the control points of the curve
    double controlX1 = size.width / 4;
    double controlY1 = size.height + 20;
    double controlX2 = size.width * 3 / 4;
    double controlY2 = size.height - 20;

    // Create a Path object and add the Bezier curve to it
    Path path = Path();
    path.moveTo(startX, startY);
    path.lineTo(startX, size.height);

    path.cubicTo(controlX1, controlY1, controlX2, controlY2, endX, endY);
    path.lineTo(size.width, startY);
    // Set the fill color of the Path object
    Paint paint = Paint();
    paint.color = DiaryTheme.kColor3;

    // Draw the Path object onto the Canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
