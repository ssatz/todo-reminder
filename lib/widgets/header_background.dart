import 'dart:math';
import 'package:flutter/material.dart';

class HeaderBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    final Gradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.1, 0.5, 0.7, 0.9],
      colors: [
        Colors.lightBlue[800],
        Colors.lightBlue[700],
        Colors.lightBlue[600],
        Colors.lightBlue[400],
      ],
    );
    final Paint ovalPaint = Paint();
    ovalPaint.color = Colors.lightBlue[700];
    final Paint paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);
    Path path = Path();
    path.lineTo(size.width * .2, 0);
    path.quadraticBezierTo(
        size.width * .2, size.height * .3, 0, size.height * 0.35);
    path.close();
    canvas.drawPath(path, ovalPaint);

    final circlePaint = Paint();
    circlePaint.color = Colors.lightBlue[500];
    Offset center = Offset(size.width, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 20;
    canvas.drawCircle(center, radius, circlePaint);
  }

  @override
  bool shouldRepaint(HeaderBackground oldDelegate) {
    return false;
  }
}
