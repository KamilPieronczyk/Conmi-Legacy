import 'package:conmi/models/ConmiImage.dart';
import 'package:conmi/widgets/Shadow.dart';
import 'package:flutter/material.dart';

class SingleImageTile extends StatefulWidget {
  final ConmiImage conmiImage;
  SingleImageTile({Key key, this.conmiImage}) : super(key: key);

  @override
  _SingleImageTileState createState() => _SingleImageTileState(conmiImage);
}

class _SingleImageTileState extends State<SingleImageTile> {
  ConmiImage conmiImage;
  _SingleImageTileState(this.conmiImage);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          child: Image(
            image: AssetImage(conmiImage.path),
            //height: 140,
            //width: 110,
            fit: BoxFit.fitHeight,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(4),
            boxShadow: [Shadow.get()],
          ),
        ),
      ),
    );
  }
}
