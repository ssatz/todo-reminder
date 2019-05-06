import 'package:flutter/material.dart';

class ClosePainter extends CustomPainter {
 
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;  
    canvas.drawCircle(Offset(size.width/2, -30), 20.0, paint);
    paint = Paint()
    ..color = Colors.blue
    ..strokeWidth=1
    ..style =PaintingStyle.stroke;
    canvas.drawLine(Offset(size.width/2, 0), Offset(size.width/2, -50), paint);  
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
