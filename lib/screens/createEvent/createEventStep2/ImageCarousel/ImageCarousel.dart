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
        ),
        items: [1].map((image) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SingleImageTile(conmiImage: CarouselImageList.images[0]),
                          SingleImageTile(conmiImage: CarouselImageList.images[1])
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SingleImageTile(conmiImage: CarouselImageList.images[2]),
                          SingleImageTile(conmiImage: CarouselImageList.images[3])
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                      ),
                    )
                  ],
                ),
                height: 150,
              );
            },
          );
        }).toList());
  }
}
