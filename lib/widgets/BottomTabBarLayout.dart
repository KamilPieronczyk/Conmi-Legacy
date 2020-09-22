import 'dart:ffi';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:conmi/utils/Colors.dart';
import 'package:conmi/widgets/BottomBar.dart';
import 'package:conmi/widgets/TopBar.dart';
import 'package:conmi/widgets/TopBarWave.dart';
import 'package:flutter/material.dart';

class BottomTabBarLayout extends StatefulWidget {
  var iconList = <IconData>[];
  var screenList = <Widget>[];
  IconData floatingActionButtonIcon;
  void Function() floatingActionButtonOnPressed;
  BottomTabBarLayout(
      {Key key,
      @required this.iconList,
      @required this.screenList,
      @required this.floatingActionButtonIcon,
      @required this.floatingActionButtonOnPressed})
      : super(key: key);

  @override
  _BottomTabBarLayoutState createState() => _BottomTabBarLayoutState();
}

class _BottomTabBarLayoutState extends State<BottomTabBarLayout> with SingleTickerProviderStateMixin {
  int activeIndex = 0;

  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            widget.floatingActionButtonIcon,
            size: 40,
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle, gradient: LinearGradient(colors: [ConmiColor().secondary, ConmiColor().primary])),
        ),
        onPressed: widget.floatingActionButtonOnPressed,
        //icon: Icons.brightness_5,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: widget.iconList,
        activeIndex: activeIndex,
        gapLocation: GapLocation.center,
        activeColor: ConmiColor().primary,
        splashColor: ConmiColor().primary,
        inactiveColor: ConmiColor().blackText,
        notchAndCornersAnimation: animation,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) => setState(() => activeIndex = index),
      ),
      body: SafeArea(
        child: Container(
          child: TopBarWave(),
        ),
      ),
    );
  }
}
