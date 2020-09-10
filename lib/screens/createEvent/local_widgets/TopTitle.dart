import 'package:conmi/utils/Colors.dart';
import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  var text;
  TopTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: ConmiColor().blackText,
          fontSize: 30,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
