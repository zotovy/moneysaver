import 'package:flutter/material.dart';
import '../main.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double height = 200.0;
    Path path = Path();
    Paint paint = Paint();

    path.lineTo(0, height * 0.75);
    path.quadraticBezierTo(size.width / 2, height, size.width, height * 0.75);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = HexColor('7966FE');
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

// CustomPaint(
//   child: Container(height: 100.0),
//   painter: CurvePainter(),
// ),
