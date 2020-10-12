import 'package:flutter/cupertino.dart';

class PickedDates extends ChangeNotifier {
  int _year;
  int _month;
  List<DateTime> days;

  int get month => _month;

  void set month(int month) {
    _month = month;
    notifyListeners();
  }
}
