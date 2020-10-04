import 'package:conmi/utils/Colors.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: MonthsPicker(),
          ),
          Expanded(
            flex: 4,
            child: Text(""),
          ),
        ],
      ),
    );
  }
}

class MonthsPicker extends StatefulWidget {
  const MonthsPicker({Key key}) : super(key: key);

  @override
  _MonthsPickerState createState() => _MonthsPickerState();
}

class _MonthsPickerState extends State<MonthsPicker> {
  PageController controller = new PageController();
  int currentpage = 0;

  List<String> months = ['sty', 'lut', 'marz', 'cze', 'lip', 'sie', 'wrz', 'paź', 'lis', 'gru'];

  @override
  void initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.3,
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (value) {
        setState(() {
          currentpage = value;
        });
      },
      controller: this.controller,
      children: List.generate(6, (index) => builder(index)),
    );
  }

  Widget builder(int index) {
    TextStyle style = currentpage == index
        ? TextStyle(
            color: ConmiColor().secondary,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )
        : TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          );
    return new AnimatedBuilder(
      animation: this.controller,
      builder: (context, child) {
        double value = currentpage == index ? 1.0 : 0.5;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }
        return new Center(
          child: Transform(
            transform: Matrix4.identity()..translate(0.0, (1 - value) * -30),
            child: child,
          ),
        );
      },
      child: Container(
        constraints: BoxConstraints.expand(),
        padding: currentpage == index ? EdgeInsets.zero : EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            Text(
              months[index].toUpperCase(),
              style: style,
            ),
            if (currentpage == index)
              Text(
                "2020",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 12,
                ),
              )
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
      ),
    );
  }
}
