import 'package:conmi/screens/createEvent/bloc/CreateEventBloc.dart';
import 'package:conmi/screens/createEvent/createEventStep2/CreateEventStep2.dart';
import 'package:conmi/screens/createEvent/createEventStep1/CreateEventStep1.dart';
import 'package:conmi/screens/createEvent/createEventStep3/CreateEventStep3.dart';
import 'package:conmi/utils/Colors.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'models/CreateEventData.dart';

FirebaseAnalytics analytics;
void main() {
  analytics = FirebaseAnalytics();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CreateEventData()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateEventBloc>(
      create: (context) => CreateEventBloc(),
      child: MaterialApp(
        title: 'Conmi',
        theme: ThemeData(
          primaryColor: ConmiColor().primary,
          secondaryHeaderColor: ConmiColor().secondary,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CreateEventStep2(),
      ),
    );
  }
}
