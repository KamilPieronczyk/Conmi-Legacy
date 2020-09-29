import 'package:conmi/utils/Colors.dart';
import 'package:conmi/utils/EventIcons.dart';
import 'package:conmi/widgets/RectGradientTopBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CreateEventPlace extends StatelessWidget {
  const CreateEventPlace({Key key}) : super(key: key);

  void goBack() {
    print("goBack pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RectGradientTopBar(
        title: "Dodaj miejsce",
        onPressedBack: () => goBack(),
      ),
      body: CreateEventPlaceBody(),
    );
  }
}

class CreateEventPlaceBody extends StatefulWidget {
  const CreateEventPlaceBody({
    Key key,
  }) : super(key: key);

  @override
  _CreateEventPlaceBodyState createState() => _CreateEventPlaceBodyState();
}

class _CreateEventPlaceBodyState extends State<CreateEventPlaceBody> {
  String gradient = 'primary';
  String icon = 'beach_access';
  String eventName = "Event Place";
  bool _showErrorLabel = false;

  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: eventName);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 50),
            child: FittedBox(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: ConmiColor().gradients[gradient],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 50, 40, 10),
                      child: Center(
                        child: Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 5,
                              color: Colors.white30,
                            ),
                          ),
                          child: Icon(
                            eventIcons[icon],
                            size: 70,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _showNameDialog,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        alignment: Alignment.center,
                        child: Text(
                          eventName.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white30, width: 3),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
              ),
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
                    children: ConmiColor().gradients.entries.map((entry) => buildGradientButton(entry)).toList(),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 15,
                    children: eventIcons.entries.map((entry) => buildIconButton(entry)).toList(),
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

  bool isNameValid(String name) {
    if (name == null) return false;
    if (name.length <= 0) return false;
    return true;
  }

  Future<void> _showNameDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Podaj nazwę wydarzenia'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Enter an event\'s name',
                    errorText: _showErrorLabel ? "Nazwa nie może być pusta" : null,
                  ),
                  onChanged: (value) => setState(() {
                    this.eventName = value;
                    if (isNameValid(value))
                      _showErrorLabel = false;
                    else
                      _showErrorLabel = true;
                  }),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                if (isNameValid(eventName)) Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
