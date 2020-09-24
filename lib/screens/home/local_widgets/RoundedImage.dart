import 'package:flutter/material.dart';
import 'package:conmi/widgets/Shadow.dart';

class RoundedImage extends StatelessWidget {
  var imagePath;
  RoundedImage({Key key, @required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        child: Image(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), boxShadow: [Shadow.get()]),
    );
  }
}
