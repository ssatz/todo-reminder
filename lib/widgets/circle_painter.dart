import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final Color color;
  final PaintingStyle style;
  CirclePainter({@required this.color,@required this.style});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = style;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 10.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
