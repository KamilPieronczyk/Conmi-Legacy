import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  Widget child;
  MainContainer(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: EdgeInsets.fromLTRB(18, 56, 18, 0),
    );
  }
}
