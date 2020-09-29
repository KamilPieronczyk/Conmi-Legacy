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
        onPressedBack: () => {},
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
                    Container(
                      width: 160,
                      padding: EdgeInsets.only(bottom: 30),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Nazwa",
                          hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white38),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white38),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white38),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        textCapitalization: TextCapitalization.characters,
                      ),
                    )
                  ],
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
}
