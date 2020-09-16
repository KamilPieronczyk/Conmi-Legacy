import 'package:conmi/models/ConmiImage.dart';
import 'package:quiver/iterables.dart';

class CarouselImageList {
  static List<ConmiImage> images = [
    ConmiImage(id: 'lake', path: 'assets/images/lake.jpg'),
    ConmiImage(id: 'bonfire', path: 'assets/images/bonfire.jpg'),
    ConmiImage(id: 'desert1', path: 'assets/images/desert1.jpg'),
    ConmiImage(id: 'desert2', path: 'assets/images/desert2.jpg'),
    ConmiImage(id: 'camping1', path: 'assets/images/camping1.jpg'),
    ConmiImage(id: 'party1', path: 'assets/images/party1.jpg'),
    ConmiImage(id: 'party2', path: 'assets/images/party2.jpg'),
    ConmiImage(id: 'desert2', path: 'assets/images/desert2.jpg'),
  ];

  static List<List<ConmiImage>> toMatrix() {
    return partition(images, 4).toList();
  }
}
