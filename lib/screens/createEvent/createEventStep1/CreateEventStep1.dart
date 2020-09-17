import 'package:conmi/models/CreateEventData.dart';
import 'package:conmi/screens/createEvent/createEventStep2/CreateEventStep2.dart';
import 'package:conmi/screens/createEvent/local_widgets/BottomBar.dart';
import 'package:conmi/screens/createEvent/local_widgets/MainContainer.dart';
import 'package:conmi/screens/createEvent/local_widgets/TopTitle.dart';
import 'package:conmi/utils/Colors.dart';
import 'package:conmi/utils/StringsPL.dart';
import 'package:conmi/widgets/ConmiFontStyle.dart';
import 'package:conmi/widgets/Shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eventemitter/flutter_eventemitter.dart';
import 'package:provider/provider.dart';

class CreateEventStep1 extends StatelessWidget {
  CreateEventStep1();

  @override
  Widget build(BuildContext context) {
    EventEmitter.subscribe('BottomBarNextScreenButtonClicked', (value) {
      print(value);
    });
    return Scaffold(
      body: MainContainer(
        Column(
          children: <Widget>[
            TopTitle(StringsPL.createEventSetEventName),
            Expanded(
              child: Center(
                child: EventNameTextField(),
              ),
            ),
            BottomBar(step: 1, nextScreen: CreateEventStep2(), previousScreen: CreateEventStep1()),
          ],
        ),
      ),
    );
  }
}

class EventNameTextField extends StatefulWidget {
  const EventNameTextField({
    Key key,
  }) : super(key: key);

  @override
  _EventNameTextFieldState createState() => _EventNameTextFieldState();
}

class _EventNameTextFieldState extends State<EventNameTextField> {
  bool isError = false;

  void listener() {
    EventEmitter.subscribe('BottomBarNextScreenButtonClicked', (step) {
      if (step == 1) validate();
    });
  }

  void validate() {
    final eventName = Provider.of<CreateEventData>(context, listen: false).eventName;
    setState(() {
      isError = eventName == null || eventName.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    listener();
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ConmiColor().blackText,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: StringsPL.createEventTextFieldHint,
            ),
            onChanged: (value) {
              Provider.of<CreateEventData>(context, listen: false).eventName = value;
              validate();
            },
          ),
        ),
      ),
      height: 36,
      width: 210,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isError ? Colors.red : Colors.white,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [Shadow.get()],
      ),
    );
  }
}
