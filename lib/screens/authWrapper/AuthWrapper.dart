import 'package:conmi/screens/eventsList/EventsList.dart';
import 'package:conmi/screens/home/Home.dart';
import 'package:conmi/widgets/BottomTabBarLayout.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  AuthWrapper({Key key}) : super(key: key);
  final iconList = <IconData>[
    Icons.home,
    Icons.event,
    //Icons.add_location,
    //Icons.info,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomTabBarLayout(
      iconList: iconList,
      floatingActionButtonIcon: Icons.add,
      floatingActionButtonOnPressed: () => print("floatingActionButtonOnPressed"),
      screenList: [Home(), EventsList()],
    );
  }
}
