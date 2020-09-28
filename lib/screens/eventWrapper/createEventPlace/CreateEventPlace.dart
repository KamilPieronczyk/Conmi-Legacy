import 'package:conmi/utils/Colors.dart';
import 'package:conmi/widgets/ConmiFontStyle.dart';
import 'package:conmi/widgets/RectGradientTopBar.dart';
import 'package:flutter/material.dart';

class CreateEventPlace extends StatelessWidget {
  const CreateEventPlace({Key key}) : super(key: key);

  void goBack() {
    print("goBack pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RectGradientTopBar(
        title: "Dodaj miejsce",
        onPressedBack: () => {},
      ),
      body: CreateEventPlaceBody(),
      resizeToAvoidBottomPadding: false,
    );
  }
}

class CreateEventPlaceBody extends StatefulWidget {
  const CreateEventPlaceBody({
    Key key,
  }) : super(key: key);

  @override
  _CreateEventPlaceBodyState createState() => _CreateEventPlaceBodyState();
}

class _CreateEventPlaceBodyState extends State<CreateEventPlaceBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 50),
                  child: FittedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [ConmiColor().primary, ConmiColor().secondary],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 50, 40, 10),
                            child: Center(
                              child: Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 5,
                                    color: Colors.white30,
                                  ),
                                ),
                                child: Icon(
                                  Icons.beach_access,
                                  size: 70,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 160,
                            padding: EdgeInsets.only(bottom: 30),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Nazwa",
                                hintStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white38),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white38),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white38),
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              textCapitalization: TextCapitalization.characters,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text("ELo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
