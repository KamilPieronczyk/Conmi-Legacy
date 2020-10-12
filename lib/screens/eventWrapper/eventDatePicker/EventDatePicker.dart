import 'package:conmi/screens/eventWrapper/eventDatePicker/local_widgets/Calendar.dart';
import 'package:conmi/widgets/RectGradientTopBar.dart';
import 'package:flutter/material.dart';

class EventDatePicker extends StatelessWidget {
  const EventDatePicker({Key key}) : super(key: key);

  void goBack() {
    print("goBack pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RectGradientTopBar(
        title: "Terminarz",
        onPressedBack: () => goBack(),
      ),
      body: EventDatePickerBody(),
    );
  }
}

class EventDatePickerBody extends StatelessWidget {
  const EventDatePickerBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Calendar(),
          ),
          Expanded(
            child: Text("Bottom"),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
