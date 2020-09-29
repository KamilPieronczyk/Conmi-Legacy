import 'package:conmi/screens/budget/main/CircleIcon.dart';
import 'package:conmi/widgets/ConmiFontStyle.dart';
import 'package:conmi/widgets/Shadow.dart';
import 'package:flutter/material.dart';

class BudgetListTile extends StatelessWidget {
  const BudgetListTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CircleIcon(
                icon: Icon(
                  Icons.fastfood,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: ConmiFontStyle.robotoRegular16('Jedzenie'),
              ),
              Expanded(
                child: Align(
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          '5.42 PLN',
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                            icon: Icon(Icons.more_vert, color: Colors.black87),
                            onPressed: null)
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black26,
            height: 20,
            thickness: 2,
            indent: 20,
            endIndent: 0,
          ),
        ],
      ),
    );
  }
}
