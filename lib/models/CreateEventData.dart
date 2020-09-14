import 'package:conmi/models/ConmiImage.dart';
import 'package:flutter/cupertino.dart';

class CreateEventData extends ChangeNotifier {
  String id;
  String _eventName;
  ConmiImage image;

  String get eventName {
    return _eventName;
  }

  void set eventName(String _eventName) {
    this._eventName = _eventName;
    notifyListeners();
  }
}
