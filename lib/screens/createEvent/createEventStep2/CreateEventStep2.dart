import 'package:conmi/screens/createEvent/createEventStep1/CreateEventStep1.dart';
import 'package:conmi/screens/createEvent/createEventStep2/ImageCarousel/ImageCarousel.dart';
import 'package:conmi/screens/createEvent/createEventStep3/CreateEventStep3.dart';
import 'package:conmi/screens/createEvent/local_widgets/BottomBar.dart';
import 'package:conmi/screens/createEvent/local_widgets/MainContainer.dart';
import 'package:conmi/screens/createEvent/local_widgets/TopTitle.dart';
import 'package:conmi/utils/StringsPL.dart';
import 'package:conmi/widgets/ConmiFontStyle.dart';
import 'package:conmi/widgets/Shadow.dart';
import 'package:flutter/material.dart';

class CreateEventStep2 extends StatefulWidget {
  CreateEventStep2({Key key}) : super(key: key);
  @override
  _CreateEventStep2State createState() => _CreateEventStep2State();
}

class _CreateEventStep2State extends State<CreateEventStep2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContainer(
        Column(
          children: <Widget>[
            Container(
              child: TopTitle(StringsPL.createEventSetEventImage),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Hero(
                            tag: 'Image',
                            child: Container(
                              child: ClipRRect(
                                child: Image(
                                  image: AssetImage('assets/images/lake.jpg'),
                                  height: 140,
                                  fit: BoxFit.fitHeight,
                                ),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(14), boxShadow: [Shadow.get()]),
                            ),
                          ),
                        ),
                        Hero(
                          tag: 'Text',
                          child: Container(
                            child: Center(
                              child: ConmiFontStyle.robotoBold16("Wyjazd"),
                            ),
                            transform: Matrix4.translationValues(0, -18, 0),
                            height: 36,
                            width: 210,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [Shadow.get()],
                            ),
                          ),
                        )
                      ],
                      alignment: Alignment.topCenter,
                    ),
                    Expanded(
                      child: ImageCarousel(),
                    ),
                  ],
                ),
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
              ),
            ),
            BottomBar(step: 2, previousScreen: CreateEventStep1(), nextScreen: CreateEventStep3()),
          ],
        ),
      ),
    );
  }
}
