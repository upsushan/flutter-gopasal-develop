import 'dart:math';
import 'package:flutter/material.dart';

class MyArc extends StatelessWidget {
  const MyArc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(Theme.of(context).canvasColor),
      size: Size(200.0, 200.0),
    );
  }
}

class MyPainter extends CustomPainter {
  final Color color;
  MyPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 1.97, size.width / 2 +4),
        height: 50.0,
        width: size.width+20,
      ),
      pi,
      pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
