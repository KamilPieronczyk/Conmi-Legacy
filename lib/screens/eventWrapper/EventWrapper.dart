import 'package:conmi/models/PickedDates.dart';
import 'package:conmi/screens/eventWrapper/createEventPlace/CreateEventPlace.dart';
import 'package:conmi/screens/eventWrapper/eventDatePicker/EventDatePicker.dart';
import 'package:conmi/screens/eventWrapper/eventHome/EventHome.dart';
import 'package:conmi/screens/eventWrapper/eventParticipants/EventParticipants.dart';
import 'package:conmi/screens/eventWrapper/eventsPlaces/EventsPlaces.dart';
import 'package:conmi/widgets/BottomTabBarLayout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventWrapper extends StatelessWidget {
  EventWrapper({Key key}) : super(key: key);

  final iconList = <IconData>[
    Icons.group,
    Icons.home,
    Icons.notifications,
    Icons.settings,
    //Icons.add_location,
    //Icons.info,
  ];

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => PickedDates(),
      child: BottomTabBarLayout(
        iconList: iconList,
        floatingActionButtonIcon: Icons.add,
        floatingActionButtonOnPressed: () => print("floatingActionButtonOnPressed"),
        screenList: [EventParticipants(), EventHome(), EventsPlaces(), EventDatePicker()],
      ),
    );
  }
}
