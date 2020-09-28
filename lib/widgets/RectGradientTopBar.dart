import 'package:conmi/utils/Colors.dart';
import 'package:flutter/material.dart';

import 'ConmiFontStyle.dart';

class RectGradientTopBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  void Function() onPressedBack;
  String title;
  RectGradientTopBar({
    Key key,
    @required this.onPressedBack,
    @required this.title,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: ConmiFontStyle.appBarText(title.toUpperCase()),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () => onPressedBack,
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [ConmiColor().primary, ConmiColor().secondary],
          ),
        ),
      ),
    );
  }
}
