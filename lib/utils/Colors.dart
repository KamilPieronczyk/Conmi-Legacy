import 'package:flutter/material.dart';

class ConmiColor {
  final _primary = '#5EBDB4';
  final _secondary = '#729AF0';
  final _purple = '#A3467F';
  final _lightPurple = '#BC94F0';

  Color get primary => fromHex(_primary);
  Color get secondary => fromHex(_secondary);
  Color get purple => fromHex(_purple);
  Color get lightPurple => fromHex(_lightPurple);
  Color get blackText => Color.fromRGBO(0, 0, 0, 0.87);

  static fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
