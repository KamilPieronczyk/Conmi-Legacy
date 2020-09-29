import 'package:conmi/utils/Colors.dart';
import 'package:conmi/utils/EventIcons.dart';
import 'package:conmi/widgets/RectGradientTopBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EventsPlaces extends StatelessWidget {
  const EventsPlaces({Key key}) : super(key: key);

  void goBack() {
    print("goBack pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RectGradientTopBar(
        title: "Dodaj miejsce",
        onPressedBack: () => goBack(),
      ),
      body: EventsPlacesBody(),
    );
  }
}

class EventsPlacesBody extends StatefulWidget {
  const EventsPlacesBody({
    Key key,
  }) : super(key: key);

  @override
  _EventsPlacesBodyState createState() => _EventsPlacesBodyState();
}

class _EventsPlacesBodyState extends State<EventsPlacesBody> {
  PageController controller;
  int currentpage = 0;

  @override
  void initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 1.0,
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 380,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentpage = value;
              });
            },
            controller: controller,
            itemCount: 3,
            itemBuilder: (context, index) => buildCard(),
          ),
        ),
        Expanded(
          flex: 275,
          child: Container(),
        )
      ],
    );
  }

  builder(int index) {
    return new AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1.0;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return new Center(
          child: new SizedBox(
            height: Curves.easeOut.transform(value) * 300,
            width: Curves.easeOut.transform(value) * 250,
            child: child,
          ),
        );
      },
      child: buildCard(),
    );
  }

  Widget buildCard() {
    return Transform.scale(
      scale: 0.8,
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ConmiColor().gradients['primary'],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 5,
                            color: Colors.white30,
                          ),
                        ),
                        child: Icon(
                          eventIcons['cake'],
                          size: 85,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'text',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15, right: 15),
                child: Icon(
                  Icons.favorite,
                  size: 36,
                  color: Color.fromRGBO(47, 230, 213, 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
