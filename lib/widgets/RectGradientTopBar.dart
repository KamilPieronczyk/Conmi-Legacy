import 'package:conmi/utils/Colors.dart';
import 'package:flutter/material.dart';

import 'ConmiFontStyle.dart';

class RectGradientTopBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Icon iconRight;
  void Function() iconRightOnClick;

  void Function() onPressedBack;
  String title;
  RectGradientTopBar({
    Key key,
    @required this.onPressedBack,
    @required this.title,
    this.iconRightOnClick,
    this.iconRight = const Icon(null),
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
      actions: [IconButton(icon: iconRight, onPressed: iconRightOnClick)],
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

