import 'package:conmi/screens/createEvent/local_widgets/BottomBar.dart';
import 'package:conmi/screens/createEvent/local_widgets/MainContainer.dart';
import 'package:conmi/screens/createEvent/local_widgets/TopTitle.dart';
import 'package:conmi/utils/Colors.dart';
import 'package:conmi/utils/StringsPL.dart';
import 'package:conmi/widgets/ConmiFontStyle.dart';
import 'package:conmi/widgets/Shadow.dart';
import 'package:flutter/material.dart';

class CreateEventStep3 extends StatefulWidget {
  CreateEventStep3({Key key}) : super(key: key);
  @override
  _CreateEventStep3State createState() => _CreateEventStep3State();
}

class _CreateEventStep3State extends State<CreateEventStep3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContainer(
        Column(
          children: <Widget>[
            TopTitle(StringsPL.createEventInviteFriends),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Container(
                            child: ClipRRect(
                              child: Image(
                                image: AssetImage('assets/images/lake.jpg'),
                                height: 260,
                                fit: BoxFit.fitHeight,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [Shadow.get()]),
                          ),
                        ),
                        Container(
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
                        )
                      ],
                      mainAxisSize: MainAxisSize.max,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          FlatButton(
                            child: Row(
                              children: [
                                Text(
                                  StringsPL.createEventShare,
                                  style: TextStyle(
                                      color: ConmiColor().purple,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                                Icon(
                                  Icons.share,
                                  color: ConmiColor().purple,
                                ),
                              ],
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            onPressed: (){},
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:10),
                            child: FlatButton(
                               child: Row(
                                children: [
                                  Text(
                                    'conmiblabla.app./dupa123',
                                    style: TextStyle(
                                        color: ConmiColor().blackText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(7, 10, 0, 10),
                                    child: Icon(
                                      Icons.content_copy,
                                      color: ConmiColor().blackText,
                                    ),
                                  ),
                                ],
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: ConmiColor().purple,
                                  ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              onPressed: (){},
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            BottomBar(step: 3),
          ],
        ),
      ),
    );
  }
}
