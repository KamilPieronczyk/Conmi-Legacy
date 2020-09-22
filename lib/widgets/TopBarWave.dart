import 'package:conmi/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TopBarWave extends StatelessWidget {
  const TopBarWave({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 72,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: CurvePainter(),
            ),
          ),
          Transform.translate(
            child: Text("Conmi ", style: TextStyle(fontFamily: 'Pacifico', fontSize: 40, color: Colors.white)),
            offset: Offset(50, -5),
          ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var ovalPaint = Paint();
    var paintShadow = Paint();

    paintShadow.style = PaintingStyle.stroke;

    ovalPaint.style = PaintingStyle.fill;
    ovalPaint.shader = LinearGradient(colors: [ConmiColor().secondary, ConmiColor().primary])
        .createShader(Rect.fromPoints(Offset(0, 0), Offset(size.width * (30 / 45), size.height * (8 / 9))));

    paint.shader = LinearGradient(colors: [ConmiColor().secondary, ConmiColor().primary])
        .createShader(Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)));

    final p1x = size.width * (4 / 45);
    final p1y = size.height * (8.5 / 9);

    final p2x = size.width * (10 / 45);
    final p2y = size.height;

    final p3x = size.width * (20.5 / 45);
    final p3y = size.height * (8 / 9);

    final p4x = size.width * (36 / 45);
    final p4y = size.height * (3.5 / 9);

    final p5x = size.width * (43 / 45);
    final p5y = size.height * (2 / 9);

    final p6x = size.width;
    final p6y = size.height * (3 / 9);

    var path = Path();
    path.lineTo(0, size.height * (6 / 9));
    path.cubicTo(p1x, p1y, p2x, p2y, size.width * (15 / 45), size.height * (8.5 / 9));
    path.quadraticBezierTo(p3x, p3y, p4x, p4y);
    path.quadraticBezierTo(p5x, p5y, p6x, p6y);
    path.lineTo(size.width, 0);

    var oval = Path();
    oval.moveTo(-20, -20);
    oval.lineTo(-20, size.height * (3.0 / 9));
    oval.quadraticBezierTo(size.width * (16 / 45), size.height * 1.6, size.width * (30 / 45), -20);

    var pathShadow = Path();
    pathShadow.moveTo(0, size.height * (6 / 9));
    pathShadow.cubicTo(p1x, p1y, p2x, p2y, size.width * (15 / 45), size.height * (8.5 / 9));
    pathShadow.quadraticBezierTo(p3x, p3y, p4x, p4y);
    pathShadow.quadraticBezierTo(p5x, p5y, p6x, p6y);

    canvas.drawShadow(pathShadow, Colors.black, 6.0, true);
    canvas.drawPath(path, paint);
    canvas.drawPath(oval, ovalPaint);
    canvas.drawShadow(oval, Colors.black, 6.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
