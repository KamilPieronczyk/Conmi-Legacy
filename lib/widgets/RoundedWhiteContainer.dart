import 'package:flutter/material.dart';
import 'package:conmi/widgets/Shadow.dart';

class RoundedWhiteContainer extends StatelessWidget {
  Widget child;
  double opacity;
  RoundedWhiteContainer({Key key, @required this.child, this.opacity: 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(opacity),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [Shadow.get()],
      ),
      child: child,
    );
  }
}
