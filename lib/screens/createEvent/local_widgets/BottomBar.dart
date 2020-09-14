import 'package:conmi/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter/animation.dart';

class BottomBar extends StatefulWidget {
  int step = 0;
  Widget previousScreen;
  Widget nextScreen;
  BottomBar({this.step = 0, this.nextScreen, this.previousScreen, Key key}) : super(key: key);

  _BottomBarState createState() => _BottomBarState(this.step, this.nextScreen, this.previousScreen);
}

class _BottomBarState extends State<BottomBar> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Widget previousScreen;
  Widget nextScreen;
  int step = 0;
  _BottomBarState(this.step, this.nextScreen, this.previousScreen);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    final Animation curve = CurvedAnimation(parent: controller, curve: Curves.easeOutQuart);
    animation = Tween<double>(begin: (step - 1) * 90.0, end: step * 90.0).animate(curve);
  }

  void navigateToNextScreen(BuildContext context) {
    controller.forward().then((value) => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => nextScreen,
            ),
          )
        });
  }

  void navigateToPreviousScreen(BuildContext context) {
    controller.reverse().then((value) => {Navigator.pop(context)});
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
                onPressed: () => this.navigateToPreviousScreen(context),
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
                    onPressed: () => this.navigateToNextScreen(context),
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
