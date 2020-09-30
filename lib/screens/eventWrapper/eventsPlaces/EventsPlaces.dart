import 'package:conmi/utils/Colors.dart';
import 'package:conmi/utils/EventIcons.dart';
import 'package:conmi/widgets/ConmiFontStyle.dart';
import 'package:conmi/widgets/RectGradientTopBar.dart';
import 'package:conmi/widgets/RoundedWhiteContainer.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 6,
            child: EventsCarousel(),
          ),
          Expanded(
            flex: 6,
            child: TopLocalizations(),
          )
        ],
      ),
    );
  }
}

class TopLocalizations extends StatelessWidget {
  const TopLocalizations({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
          child: Row(
            children: [
              buildTopLocalizationCard(),
              buildTopLocalizationCard(offset: Offset(0, -30)),
              buildTopLocalizationCard(offset: Offset(0, 20)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopLocalizationCard(
      {String icon: 'cake',
      String name = 'name',
      String gradient: 'primary',
      bool selected: false,
      Offset offset: Offset.zero}) {
    return Expanded(
      child: Transform.translate(
        offset: offset,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: AspectRatio(
            aspectRatio: 90 / 120,
            child: Container(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: ConmiColor().gradients[gradient],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 20),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 5,
                                  color: Colors.white30,
                                ),
                              ),
                              child: Icon(
                                eventIcons[icon],
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            name.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Transform.translate(
                        offset: Offset(0, -20),
                        child: RoundedWhiteContainer(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Icon(Icons.group),
                                ),
                                ConmiFontStyle.robotoMedium16('4'),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EventsCarousel extends StatefulWidget {
  const EventsCarousel({
    Key key,
  }) : super(key: key);

  @override
  _EventsCarouselState createState() => _EventsCarouselState();
}

class _EventsCarouselState extends State<EventsCarousel> {
  PageController controller;
  int currentpage = 1;

  @override
  void initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.5,
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (value) {
        setState(() {
          currentpage = value;
        });
      },
      controller: controller,
      children: List.generate(3, (index) => builder(index)),
    );
  }

  builder(int index, {String icon: 'cake', String name = '', String gradient: 'primary', bool selected: false}) {
    return new AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = currentpage == index ? 1.0 : 0.5;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }
        return new Center(
          child: Transform.scale(
            scale: value,
            child: child,
          ),
        );
      },
      child: buildCard(icon: icon, name: name, gradient: gradient, selected: selected),
    );
  }

  Widget buildCard({String icon: 'cake', String name = '', String gradient: 'primary', bool selected: false}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: ConmiColor().gradients[gradient],
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
                    padding: EdgeInsets.only(top: 30),
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
                        eventIcons[icon],
                        size: 85,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    name.toUpperCase(),
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
                selected ? Icons.favorite : Icons.favorite_border,
                size: 36,
                color: selected ? Color.fromRGBO(47, 230, 213, 1) : Colors.white30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
