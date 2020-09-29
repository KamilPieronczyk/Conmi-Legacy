import 'package:flutter/material.dart';
import 'package:conmi/widgets/Shadow.dart';

class CircleIcon extends StatelessWidget {
  final Icon icon;
  final Colors color;
  const CircleIcon({Key key, this.icon, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [Shadow.get()],
          color: Colors.lightBlue,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: icon,
          onPressed: null,
        ),
      )
    );
  }
}