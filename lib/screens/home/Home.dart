import 'package:conmi/screens/home/local_widgets/RoundedImage.dart';
import 'package:conmi/utils/Colors.dart';
import 'package:conmi/widgets/ConmiFontStyle.dart';
import 'package:conmi/widgets/RoundedWhiteContainer.dart';
import 'package:conmi/widgets/Shadow.dart';
import 'package:conmi/widgets/TopBarWave.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TopBarWave(),
          Expanded(
            flex: 350,
            child: EventsCarousel(),
          ),
          Expanded(
            flex: 250,
            child: Container(
              child: ConmiFontStyle.robotoBold16('Notifucation Area'),
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
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

class _EventsCarouselState extends State<EventsCarousel> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 18, 0, 0),
      child: Column(
        children: [
          ConmiFontStyle.robotoBold16("Najbliższe wydarzenia"),
          Stack(
            children: [
              buildEventCard(context),
              GestureDetector(
                onTap: () => print("object"),
                child: AnimatedBuilder(
                  animation: controller,
                  child: buildEventCard(context),
                  builder: (context, child) => Transform(
                    alignment: Alignment.centerRight,
                    transform: new Matrix4.identity()
                      ..scale(0.8 + (0.2 * controller.value.toDouble()))
                      ..translate((MediaQuery.of(context).size.width - 90) * (1 - controller.value.toDouble())),
                    child: child,
                  ),
                ),
              ),
            ],
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget buildEventCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18, bottom: 18),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.32,
            child: AspectRatio(
              aspectRatio: 10 / 9,
              child: RoundedImage(
                imagePath: "assets/images/bonfire.jpg",
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Transform.translate(
                offset: Offset(0, 33),
                child: RoundedWhiteContainer(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 8, 30, 12),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ConmiFontStyle.robotoBold16("Wyjazd"),
                        ),
                        ConmiFontStyle.robotoMedium16("Katowice, Sasanek"),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: RoundedWhiteContainer(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            "Sep",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: ConmiColor().purple,
                            ),
                          ),
                        ),
                        ConmiFontStyle.robotoBold20("19", color: ConmiColor().purple),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                ),
              ),
            ),
          ),
          buildEventCardParticipantsList()
        ],
      ),
    );
  }

  Positioned buildEventCardParticipantsList() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            children: List.generate(
              4,
              (index) => Container(
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [Shadow.get()]),
                child: CircleAvatar(
                  backgroundColor: ConmiColor().primary,
                ),
              ),
            ),
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
