import 'package:flutter/material.dart';

class ConmiColor {
  final _primary = '#5EBDB4';
  final _primaryDark = '#43B0A7';
  final _primaryLight = '#65C9BF';
  final _secondary = '#729AF0';
  final _purple = '#A3467F';
  final _lightPurple = '#BC94F0';
  final _pink = '#F591F2';
  final _pinkDark = '#C272BF';
  final _pinkLight = '#DB81D8';

  Color get primary => fromHex(_primary);
  Color get primaryDark => fromHex(_primaryDark);
  Color get primaryLight => fromHex(_primaryLight);
  Color get secondary => fromHex(_secondary);
  Color get purple => fromHex(_purple);
  Color get lightPurple => fromHex(_lightPurple);
  Color get gradientPink => fromHex(_pink);
  Color get gradientPinkDark => fromHex(_pinkDark);
  Color get gradientPinkLight => fromHex(_pinkLight);
  Color get blackText => Color.fromRGBO(0, 0, 0, 0.87);

  static fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
