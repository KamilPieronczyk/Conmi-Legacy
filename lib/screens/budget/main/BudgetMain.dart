import 'package:conmi/screens/budget/main/BudgetSumTopBox.dart';
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
          Text('test'),
        ],
      ),
    );
  }
}
