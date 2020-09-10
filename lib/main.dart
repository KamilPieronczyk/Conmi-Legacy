import 'package:conmi/screens/createEvent/screateEventStep1/CreateEventStep1.dart';
import 'package:conmi/screens/createEvent/createEventStep3/CreateEventStep3.dart';
import 'package:conmi/utils/Colors.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

FirebaseAnalytics analytics;
void main() {
  analytics = FirebaseAnalytics();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conmi',
      theme: ThemeData(
        primaryColor: ConmiColor().primary,
        secondaryHeaderColor: ConmiColor().secondary,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CreateEventStep3(),
    );
  }
}
