import 'package:flutter/material.dart';

final customPaint = CustomPaint(
  painter: MyPainter(),
  child: Container(),
);

// painter is a instance of the Custompainter class
class MyPainter extends CustomPainter {
  // where drawing occurs
  // all drawing commands should occur
  // within the bounds of the given size
  @override
  void paint(Canvas canvas, Size size) {
    // customize paint
    // draws an unfiled circle of thickness 10
    final myPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawCircle(const Offset(75, 75), 50, myPaint);

    canvas.drawLine(Offset.zero, const Offset(75, 75), Paint());
    canvas.drawRect(
        Rect.fromPoints(Offset.zero, const Offset(50, 500)), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

class SmilyFaceDrawing extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final radius = min(size.width, size.height) / 2;
    // final center = Offset(size.height / 2, size.height / 2);
//
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
