import 'package:conmi/models/PickedDates.dart';
import 'package:conmi/utils/Colors.dart';
import 'package:conmi/widgets/ConmiFontStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int _month = 1;

  void setMonth(int month) {
    setState(() => _month = month);
  }

  int get month => _month;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: MonthsPicker(
              setMonth: setMonth,
            ),
          ),
          Expanded(
            flex: 4,
            child: DatePicker(month: month),
          ),
        ],
      ),
    );
  }
}

class DatePicker extends StatelessWidget {
  DatePicker({
    Key key,
    this.month,
  }) : super(key: key);

  final month;

  List<String> days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];

  @override
  Widget build(BuildContext context) {
    print(month);
    return Container(
      child: Consumer<PickedDates>(
        builder: (context, value, child) => child,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 0,
            crossAxisSpacing: 9.0,
          ),
          itemCount: 7 * 7,
          itemBuilder: (context, index) => _buildCalendar(context, index),
        ),
      ),
    );
  }

  _buildCalendar(context, index) {
    if (index < 7) return _getWeekDay(index);
    return _getMonthDay(context, index - 7);
  }

  _getWeekDay(index) {
    return Container(
      alignment: Alignment.center,
      child: ConmiFontStyle.robotoMedium14(days[index].toUpperCase()),
    );
  }

  _getMonthDay(context, number) {
    var startDate = DateTime(2020, month, 1).subtract(Duration(days: DateTime(2020, month, 1).weekday - 1));
    var day = startDate.add(Duration(days: number));
    return Container(
      alignment: Alignment.center,
      child: ConmiFontStyle.robotoMedium14(day.day.toString()),
    );
  }
}

class MonthsPicker extends StatefulWidget {
  MonthsPicker({Key key, this.setMonth}) : super(key: key);

  final ValueChanged<int> setMonth;
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
          widget.setMonth(value);
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
