import 'package:conmi/widgets/TopBar.dart';
import 'package:conmi/widgets/TopBarWave.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: TopBarWave(),
        ),
      ),
    );
  }
}
