import 'package:flutter/material.dart';

class SingleImageTile extends StatefulWidget {
  SingleImageTile({Key key}) : super(key: key);

  @override
  _SingleImageTileState createState() => _SingleImageTileState();
}

class _SingleImageTileState extends State<SingleImageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: AssetImage('assets/images/lake.jpg'),
        height: 110,
        width: 110,
        fit: BoxFit.fitHeight,
      ),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 3)),
    );
  }
}
