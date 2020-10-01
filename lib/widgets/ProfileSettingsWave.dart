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
            Stack(
              children: [
                Positioned.fill(child: Container(color: Colors.pink)),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width,
                  //color: ConmiColor().gradientPink,
                  child: CustomPaint(
                    painter: CurvePainter(),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: ConmiColor().primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            child: Text("Imie Nazwisko",
                                style: TextStyle(fontFamily: 'Roboto', fontSize: 16, color: Colors.black)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            child: Text("Adres",
                                style: TextStyle(fontFamily: 'Roboto', fontSize: 16, color: Colors.black87)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  buildRow(icon: Icons.person_outline, text: "Profil ", onPressed: () => {}),
                  buildRow(icon: Icons.notifications_none, text: "Powiadomienia ", onPressed: () => {}),
                  buildRow(icon: Icons.location_on, text: "Lokalizacja ", onPressed: () => {}),
                  buildRow(icon: Icons.settings, text: "Ustawienia ", onPressed: () => {}),
                ],
              ),
            ),
            Expanded(child: Container()),
            Container(
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(width: 1, color: Colors.black26)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Text(
                    "Wyloguj się ",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow({IconData icon, String text, void Function() onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 18, 30, 18),
            child: Icon(
              icon,
              size: 24,
            ),
          ),
          Text(text, style: TextStyle(fontFamily: 'Roboto', fontSize: 16, color: Colors.black)),
        ],
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
    whitepaint.color = Colors.pink;
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
    path1.quadraticBezierTo(size.width * 0.5, size.height * 1.08, 0, size.height * (2 / 3));
    path1.lineTo(0.0, size.height * (2 / 3));

    final p3x = size.width * 0.5;
    final p3y = size.height;
    var path2 = Path();
    path2.moveTo(size.width, size.height * (12 / 15));
    path2.lineTo(size.width, size.height);
    path2.quadraticBezierTo(size.width * 0.75, size.height * 1, size.width * 0.5, size.height * 0.9);
    path2.lineTo(size.width, size.height * (12 / 15));

    path2.lineTo(0.0, size.height * (2 / 3));

    var path3 = Path();
    path3.lineTo(0, size.height * (30 / 45));
    // path3.quadraticBezierTo(size.width * 0.5, size.height * 1, p2x * 0.5, size.height * (37.5 / 45));
    // path3.quadraticBezierTo(size.width * 0.25, size.height * 0.85, 0, size.height * (33 / 45));
    path3.quadraticBezierTo(size.width * 0.25, size.height * 0.87, p2x * 0.5, size.height * (40 / 45));
    path3.quadraticBezierTo(size.width * 0.25, size.height * 0.88, 0, size.height * (33 / 45));
    path3.lineTo(0, size.height * (2 / 3));
    //path3.lineTo(0.0, size.height * (2 / 3));

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
    //canvas.drawPath(whitepath, whitepaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
