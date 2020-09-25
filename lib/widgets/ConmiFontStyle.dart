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

  static Text robotoMedium16(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }

  static Text robotoBold20(String text, {Color color: Colors.black87}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}
