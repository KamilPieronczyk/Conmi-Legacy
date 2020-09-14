import 'package:conmi/widgets/Shadow.dart';
import 'package:flutter/material.dart';

class SingleImageTile extends StatefulWidget {
  SingleImageTile({Key key}) : super(key: key);

  @override
  _SingleImageTileState createState() => _SingleImageTileState();
}

class _SingleImageTileState extends State<SingleImageTile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          child: Image(
            image: AssetImage('assets/images/lake.jpg'),
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
