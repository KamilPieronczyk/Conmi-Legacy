import 'package:flutter/material.dart';
import 'package:conmi/widgets/Shadow.dart';

class RoundedWhiteContainer extends StatelessWidget {
  Widget child;
  RoundedWhiteContainer({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [Shadow.get()],
      ),
      child: child,
    );
  }
}
