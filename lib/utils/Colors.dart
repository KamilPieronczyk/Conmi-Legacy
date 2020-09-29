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
  final _graywhite = '#FAFAFA';

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
  Color get graywhite => fromHex(_graywhite);

  final gradients = {
    'primary': [Color.fromRGBO(94, 189, 180, 1), Color.fromRGBO(114, 154, 240, 1)],
    'red': [Color.fromRGBO(255, 153, 102, 1), Color.fromRGBO(255, 94, 98, 1)],
    'pink': [Color.fromRGBO(245, 145, 242, 1), Color.fromRGBO(94, 189, 180, 1)],
    'orange': [Color.fromRGBO(253, 200, 48, 1), Color.fromRGBO(243, 115, 53, 1)],
    'purple': [Color.fromRGBO(60, 16, 83, 1), Color.fromRGBO(173, 83, 137, 1)],
  };

  static fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
