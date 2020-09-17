import 'package:conmi/screens/createEvent/createEventStep2/ImageCarousel/SingleImageTile.dart';
import 'package:conmi/utils/CarouselImageList.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatefulWidget {
  ImageCarousel({Key key}) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          height: 300.0,
          enableInfiniteScroll: false,
        ),
        items: CarouselImageList.toMatrix().map(
          (cartOfImages) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(0),
                    children: cartOfImages
                        .map((image) => SingleImageTile(
                              conmiImage: image,
                            ))
                        .toList(),
                  ),
                );
              },
            );
          },
        ).toList());
  }
}
