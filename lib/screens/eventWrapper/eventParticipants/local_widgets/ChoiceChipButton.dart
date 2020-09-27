import 'package:conmi/utils/Colors.dart';
import 'package:conmi/widgets/Shadow.dart';
import 'package:flutter/material.dart';

class ChoiceChipButton extends StatelessWidget {
  String text = "";
  bool selected = false;
  IconData icon;
  Color color;
  void Function() onPressed;
  List<Color> backgroundColor = [ConmiColor().primary, ConmiColor().secondary];
  ChoiceChipButton({Key key, this.text, this.selected, this.icon, this.onPressed}) : super(key: key) {
    color = selected ? Colors.white : Colors.black87;
    if (selected)
      backgroundColor = [ConmiColor().primary, ConmiColor().secondary];
    else
      backgroundColor = [Colors.white, Colors.white];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: backgroundColor,
          ),
          boxShadow: [Shadow.get()],
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: Row(
            children: [
              Icon(
                icon,
                color: color,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                text.toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
