import 'package:conmi/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter/animation.dart';

class BottomBar extends StatefulWidget {
  int step = 0;
  BottomBar({this.step = 0, Key key}) : super(key: key);

  _BottomBarState createState() => _BottomBarState(this.step);
}

class _BottomBarState extends State<BottomBar> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  int step = 0;
  _BottomBarState(this.step);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    final Animation curve = CurvedAnimation(parent: controller, curve: Curves.easeOutQuart);
    animation = Tween<double>(begin: (step-1)*90.0, end: step*90.0).animate(curve);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back, color: ConmiColor().purple, size: 36.0),
                onPressed: () {
                  controller.reverse();
                },
              ),
              Center(
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Color.fromRGBO(163, 70, 127, 1),
                    shape: CircleBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, .16),
                        spreadRadius: 3,
                        blurRadius: 6,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.done),
                    color: Colors.white,
                    onPressed: () {
                      controller.forward();
                    },
                  ),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 40),
            child: StepProgressIndicatorAnimated(animation: animation),
          ),
        ],
      ),
    );
  }
}

class StepProgressIndicatorAnimated extends AnimatedWidget {
  StepProgressIndicatorAnimated({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return StepProgressIndicator(
      totalSteps: 270,
      currentStep: animation.value.toInt(),
      padding: 0,
      size: 6,
      selectedColor: ConmiColor().purple,
      unselectedColor: ConmiColor().lightPurple,
      roundedEdges: Radius.circular(3),
    );
  }
}
