import 'package:conmi/screens/eventWrapper/budget/main/BudgetSumTopBox.dart';
import 'package:conmi/utils/Colors.dart';
import 'package:conmi/utils/EventIcons.dart';
import 'package:conmi/widgets/ConmiFontStyle.dart';
import 'package:conmi/widgets/RectGradientTopBar.dart';
import 'package:conmi/widgets/RoundedWhiteContainer.dart';
import 'package:conmi/widgets/Shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      body: AddNewBudgetBody(),
    );
  }
}

class AddNewBudgetBody extends StatefulWidget {
  const AddNewBudgetBody({
    Key key,
  }) : super(key: key);

  @override
  _AddNewBudgetBodyState createState() => _AddNewBudgetBodyState();
}

class _AddNewBudgetBodyState extends State<AddNewBudgetBody> {
  String gradient = 'primary';
  String icon = 'beach_access';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 50),
            child: Stack(
              children: [
                Column(
                  children: [
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(45, 30, 45, 0),
                        child: RoundedWhiteContainer(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
                            child: Column(
                              children: [
                                Container(
                                  width: 160,
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: "Nazwa budżetu",
                                      hintStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  child: Text(
                                    '16.46 PLN',
                                    style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FittedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [Shadow.get()],
                      gradient: LinearGradient(
                        colors: ConmiColor().gradients[gradient],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              eventIcons[icon],
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: ConmiColor()
                        .gradients
                        .entries
                        .map((entry) => buildGradientButton(entry))
                        .toList(),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 15,
                    children: eventIcons.entries
                        .map((entry) => buildIconButton(entry))
                        .toList(),
                  ),
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ),
      ],
    );
  }

  void setGradient(String gradient) {
    setState(() {
      this.gradient = gradient;
    });
  }

  Widget buildGradientButton(entry) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () => setGradient(entry.key),
        child: Container(
          height: 60,
          width: 60,
          alignment: Alignment.center,
          child: AnimatedOpacity(
            opacity: entry.key == gradient ? 1.0 : 0.0,
            duration: Duration(milliseconds: 200),
            child: Icon(
              Icons.check_circle_outline,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: entry.value,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  void setIcon(String icon) {
    setState(() {
      this.icon = icon;
    });
  }

  Widget buildIconButton(entry) {
    return GestureDetector(
      onTap: () => setIcon(entry.key),
      child: Container(
        height: 60,
        width: 60,
        alignment: Alignment.center,
        child: Icon(
          entry.value,
          size: 35.0,
          color: entry.key == icon ? ConmiColor().primary : Colors.black87,
        ),
      ),
    );
  }
}
