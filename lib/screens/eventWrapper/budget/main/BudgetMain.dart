
import 'package:conmi/screens/eventWrapper/budget/main/BudgetSumTopBox.dart';
import 'package:conmi/screens/eventWrapper/budget/main/BudgetsListTile.dart';
import 'package:conmi/widgets/RectGradientTopBar.dart';
import 'package:flutter/material.dart';

class BudgetMain extends StatelessWidget {
  const BudgetMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RectGradientTopBar(
        title: 'Budżet',
        onPressedBack: () {},
      ),
      body: Column(
        children: [
          BudgetSumTopBox(),
          Expanded(
            child: ListView(
              children: List.generate(3, (index) => BudgetListTile()),
              padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
            ),
          ),
        ],
      ),
    );
  }
}
