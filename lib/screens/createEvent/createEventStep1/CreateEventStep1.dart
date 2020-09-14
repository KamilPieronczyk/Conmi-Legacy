import 'package:conmi/models/CreateEventData.dart';
import 'package:conmi/screens/createEvent/createEventStep2/CreateEventStep2.dart';
import 'package:conmi/screens/createEvent/local_widgets/BottomBar.dart';
import 'package:conmi/screens/createEvent/local_widgets/MainContainer.dart';
import 'package:conmi/screens/createEvent/local_widgets/TopTitle.dart';
import 'package:conmi/utils/Colors.dart';
import 'package:conmi/utils/StringsPL.dart';
import 'package:flutter/material.dart';

class CreateEventStep1 extends StatefulWidget {
  CreateEventStep1({Key key}) : super(key: key);
  @override
  _CreateEventStep1State createState() => _CreateEventStep1State();
}

class _CreateEventStep1State extends State<CreateEventStep1> {
  _CreateEventStep1State();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContainer(
        Column(
          children: <Widget>[
            TopTitle(StringsPL.createEventSetEventName),
            Expanded(
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: StringsPL.createEventTextFieldHint,
                    focusedBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ConmiColor().purple,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BottomBar(step: 1, nextScreen: CreateEventStep2()),
          ],
        ),
      ),
    );
  }
}
