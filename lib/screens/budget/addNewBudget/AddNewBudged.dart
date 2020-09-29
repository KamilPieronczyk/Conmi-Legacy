import 'package:conmi/screens/budget/addNewBudget/RectTopBarWithDelete.dart';
import 'package:conmi/screens/budget/main/BudgetSumTopBox.dart';
import 'package:conmi/screens/budget/main/BudgetsListTile.dart';
import 'package:conmi/widgets/RectGradientTopBar.dart';
import 'package:flutter/material.dart';

class AddNewBudget extends StatelessWidget {
  const AddNewBudget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RectGradientTopBar(
        title: 'Budżet',
        onPressedBack: () {},
        iconRight: Icon(Icons.delete, color: Colors.white),
      ),
      body: Column(
        children: [
          BudgetSumTopBox(),
         
        ],
      ),
    );
  }
}
