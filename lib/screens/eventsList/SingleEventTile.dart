import 'package:conmi/widgets/Shadow.dart';
import 'package:flutter/material.dart';

class SingleEventTile extends StatelessWidget {
  const SingleEventTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
      child: Stack(
        children: [
          Hero(
            tag: 'Image',
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: Container(
                child: ClipRRect(
                  child: Image(
                    image: AssetImage('assets/images/lake.jpg'),
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [Shadow.get()]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
