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
import 'package:provider/provider.dart';

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
                child: Container(
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
                        onChanged: (value) => {Provider.of<CreateEventData>(context, listen: false).eventName = value},
                      ),
                    ),
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
                // child: TextFormField(
                //   decoration: InputDecoration(
                //     hintText: StringsPL.createEventTextFieldHint,
                //     focusedBorder: new UnderlineInputBorder(
                //       borderSide: BorderSide(
                //         color: ConmiColor().purple,
                //         style: BorderStyle.solid,
                //       ),
                //     ),
                //   ),
                // ),
              ),
            ),
            BottomBar(step: 1, nextScreen: CreateEventStep2(), previousScreen: CreateEventStep1()),
          ],
        ),
      ),
    );
  }
}
