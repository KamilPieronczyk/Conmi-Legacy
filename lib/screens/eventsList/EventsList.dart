import 'package:conmi/screens/eventsList/SingleEventTile.dart';
import 'package:conmi/widgets/Shadow.dart';
import 'package:conmi/widgets/TopBarWave.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
  const EventsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TopBarWave(),
          Align(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 0, 8),
              child: Text(
                "Lista wydarzeń",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.left,
              ),
            ),
            alignment: Alignment.topLeft,
          ),
          Expanded(
            child: ListView(
              children: List.generate(4, (index) => SingleEventTile()),
            ),
          ),
        ],
      ),
    );
  }
}
