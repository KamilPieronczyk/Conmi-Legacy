import 'package:conmi/screens/authWrapper/AuthWrapper.dart';
import 'package:conmi/screens/budget/addNewBudget/AddNewBudged.dart';
import 'package:conmi/screens/budget/main/BudgetMain.dart';
import 'package:conmi/screens/createEvent/bloc/CreateEventBloc.dart';
import 'package:conmi/screens/createEvent/createEventStep2/CreateEventStep2.dart';
import 'package:conmi/screens/createEvent/createEventStep1/CreateEventStep1.dart';
import 'package:conmi/screens/createEvent/createEventStep3/CreateEventStep3.dart';
import 'package:conmi/widgets/BottomTabBarLayout.dart';
import 'package:conmi/utils/Colors.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'models/CreateEventData.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(ConmiColor().primary);
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return MaterialApp(
              title: 'Conmi',
              theme: ThemeData(
                primaryColor: ConmiColor().primary,
                secondaryHeaderColor: ConmiColor().secondary,
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: Text(snapshot.error.toString()),
            );
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Conmi',
              theme: ThemeData(
                primaryColor: ConmiColor().primary,
                secondaryHeaderColor: ConmiColor().secondary,
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: AddNewBudget(),
            );
          }
          return MaterialApp(
            title: 'Conmi',
            theme: ThemeData(
              primaryColor: ConmiColor().primary,
              secondaryHeaderColor: ConmiColor().secondary,
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: Text("Loading"),
          );
        });
  }
}
