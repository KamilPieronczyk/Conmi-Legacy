import 'package:conmi/utils/Colors.dart';
import 'package:flutter/material.dart';

class ConmiFontStyle {
  static Text robotoBold16(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ConmiColor().blackText,
      ),
    );
  }
}
