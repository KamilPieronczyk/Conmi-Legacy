import 'package:conmi/screens/eventsList/SingleEventTile.dart';
import 'package:conmi/widgets/Shadow.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
  const EventsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text("EventsList"),
          SingleEventTile()
        ],
      ),
    );
  }
}
