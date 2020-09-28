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
      body: SafeArea(
        child: CreateEventPlaceBody(),
      ),
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
    return Column(
      children: [
        Expanded(
          child: Container(
            child: Text("CreateEventPlace"),
          ),
        ),
        Expanded(
          child: Text("Icons"),
        )
      ],
    );
  }
}
