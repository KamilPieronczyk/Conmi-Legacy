import 'package:conmi/models/ConmiImage.dart';
import 'package:conmi/utils/CarouselImageList.dart';
import 'package:flutter/cupertino.dart';

class CreateEventData extends ChangeNotifier {
  String id;
  String _eventName = "";
  ConmiImage _image = CarouselImageList.images[0];

  String get eventName {
    return _eventName;
  }

  void set eventName(String _eventName) {
    this._eventName = _eventName;
    notifyListeners();
  }

  ConmiImage get image {
    return _image;
  }

  void set image(ConmiImage img) {
    _image = img;
    notifyListeners();
  }
}
