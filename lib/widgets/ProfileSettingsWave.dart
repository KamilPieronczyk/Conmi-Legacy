import 'package:conmi/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProfileSettingsWave extends StatelessWidget {
  const ProfileSettingsWave({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //width: double.infinity,
        //height: 72,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width,
              //color: ConmiColor().gradientPink,
              child: CustomPaint(
                painter: CurvePainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint();
    var paint2 = Paint();
    var ovalPaint = Paint();
    var paintShadow = Paint();
    var whitepaint = Paint();

    paintShadow.style = PaintingStyle.stroke;

    ovalPaint.style = PaintingStyle.fill;
    ovalPaint.shader = LinearGradient(colors: [ConmiColor().secondary, ConmiColor().primary])
        .createShader(Rect.fromPoints(Offset(0, 0), Offset(size.width * (30 / 45), size.height * (8 / 9))));
    whitepaint.color = Colors.white;
    paint1.shader = LinearGradient(colors: [ConmiColor().secondary, ConmiColor().primary])
        .createShader(Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)));
    paint2.shader = LinearGradient(colors: [ConmiColor().primary, ConmiColor().secondary])
        .createShader(Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)));
    final p1x = size.width * (14 / 45);
    final p1y = size.height * 1.05;

    final p2x = size.width;
    final p2y = size.height * (12 / 15);

    var path1 = Path();
    path1.lineTo(0, size.height * (14 / 15));
    path1.quadraticBezierTo(p1x, p1y, p2x, p2y);
    path1.lineTo(size.width, size.height * (2 / 3));
    path1.lineTo(0.0, size.height * (2 / 3));

    final p3x = size.width * 0.5;
    final p3y = size.height;
    var path2 = Path();
    path2.lineTo(0, size.height * (10 / 15));
    path2.quadraticBezierTo(p3x, p3y, p2x, size.height * (43 / 45));
    path2.lineTo(size.width, size.height * (2 / 3));
    path2.lineTo(0.0, size.height * (2 / 3));

    final p4x = size.width * 0.5;
    final p4y = size.height * 1.1;
    var path3 = Path();
    path3.lineTo(0, size.height * (32 / 45));
    path3.quadraticBezierTo(p4x, p4y, p2x * 0.8, size.height * (30 / 45));
    path3.lineTo(size.width, size.height * (2 / 3));
    path3.lineTo(0.0, size.height * (2 / 3));

    var whitepath = Path();
    whitepath.lineTo(0, size.height * (10 / 15));
    whitepath.quadraticBezierTo(size.width * (1 / 2), size.height * 1.1, size.width, size.height * (10 / 15));
    //whitepath.lineTo(0, size.height * (10 / 15));
    whitepath.lineTo(size.width, 0);
    canvas.drawShadow(path2, Colors.black, 6.0, false);
    canvas.drawPath(path2, paint2);
    canvas.drawShadow(path1, Colors.black, 6.0, false);
    canvas.drawPath(path1, paint1);
    canvas.drawPath(path3, paint2);
    canvas.drawPath(whitepath, whitepaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
