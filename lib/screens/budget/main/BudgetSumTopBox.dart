import 'package:conmi/widgets/ConmiFontStyle.dart';
import 'package:conmi/widgets/RoundedWhiteContainer.dart';
import 'package:conmi/widgets/Shadow.dart';
import 'package:flutter/material.dart';

class BudgetSumTopBox extends StatelessWidget {
  const BudgetSumTopBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(45, 30, 45, 0),
              child: RoundedWhiteContainer(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                      child: Column(
                        children: [
                          ConmiFontStyle.robotoMedium14('SUMA'),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Text(
                              '16.46 PLN',
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Row(
                              children: [
                                ConmiFontStyle.robotoMedium14('na osobę:'),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    '5.23',
                                    style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [Shadow.get()],
                              color: Colors.lightBlue,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: null,
                            ),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }
}