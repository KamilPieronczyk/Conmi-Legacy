import 'dart:ffi';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:conmi/utils/Colors.dart';
import 'package:conmi/widgets/BottomBar.dart';
import 'package:conmi/widgets/ConmiFontStyle.dart';
import 'package:conmi/widgets/Shadow.dart';
import 'package:conmi/widgets/TopBar.dart';
import 'package:conmi/widgets/TopBarWave.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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

PanelController panelController = new PanelController();

class _BottomTabBarLayoutState extends State<BottomTabBarLayout> with SingleTickerProviderStateMixin {
  int activeIndex = 0;
  //PanelController panelController = new PanelController();

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
        //onPressed: widget.floatingActionButtonOnPressed,
        onPressed: panelController.open,
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
      body: SlidingUpPanel(
        backdropEnabled: true,
        controller: panelController,
        snapPoint: .5,
        panel: buildBottomSheet(),
        body: IndexedStack(
          index: activeIndex,
          children: widget.screenList,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(MediaQuery.of(context).size.width / 2, 70),
          topRight: Radius.elliptical(MediaQuery.of(context).size.width / 2, 70),
        ),
        minHeight: 0,
        maxHeight: MediaQuery.of(context).size.height - 150,
      ),
    );
  }

  Widget buildBottomSheet() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: ConmiFontStyle.robotoBold16('Dodaj do Wydarzenia'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Stack(
                children: [
                  Transform(
                    transform: Matrix4.identity()
                      ..scale(2.0, 2.0, 1)
                      ..translate(-40.0, -70.0),
                    child: SvgPicture.asset('assets/images/OvalBackground.svg'),
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    children: [
                      buildIconButton(icon: Icons.event, text: "Ustaw termin"),
                      buildIconButton(icon: Icons.attach_money, text: "Dodaj budżet"),
                      buildIconButton(icon: Icons.message, text: "Napisz post"),
                      buildIconButton(icon: Icons.list, text: "Dodaj listę"),
                      buildIconButton(icon: Icons.question_answer, text: "Dodaj ankietę"),
                      buildIconButton(icon: Icons.location_on, text: "Ustal miejsce"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIconButton({IconData icon, String text, void Function() onPressed}) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [Shadow.get()],
                  color: Colors.white,
                ),
                child: Icon(
                  icon,
                  size: 60,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 5),
            ConmiFontStyle.robotoMedium14(text),
          ],
        ),
      ),
    );
  }
}
