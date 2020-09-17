import 'package:conmi/models/ConmiImage.dart';
import 'package:conmi/models/CreateEventData.dart';
import 'package:conmi/widgets/Shadow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleImageTile extends StatefulWidget {
  final ConmiImage conmiImage;
  SingleImageTile({Key key, this.conmiImage}) : super(key: key);

  @override
  _SingleImageTileState createState() => _SingleImageTileState(conmiImage);
}

class _SingleImageTileState extends State<SingleImageTile> {
  ConmiImage conmiImage;
  _SingleImageTileState(this.conmiImage);

  void onTap(BuildContext context) {
    Provider.of<CreateEventData>(context, listen: false).image = conmiImage;
  }

  bool isSelected(BuildContext context) {
    return Provider.of<CreateEventData>(context, listen: true).image.id == conmiImage.id;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
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
              color: isSelected(context) ? Colors.green : Colors.white,
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
