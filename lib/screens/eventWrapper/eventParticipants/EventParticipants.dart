import 'package:conmi/screens/eventWrapper/eventParticipants/local_widgets/ChoiceChipButton.dart';
import 'package:conmi/utils/Colors.dart';
import 'package:conmi/widgets/ConmiFontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventParticipants extends StatelessWidget {
  const EventParticipants({Key key}) : super(key: key);

  void goBack() {
    print("goBack pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uczestnicy twojego wydarzenia"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => goBack(),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: EventParticipantsBody(),
    );
  }
}

class EventParticipantsBody extends StatefulWidget {
  const EventParticipantsBody({
    Key key,
  }) : super(key: key);

  @override
  _EventParticipantsBodyState createState() => _EventParticipantsBodyState();
}

class _EventParticipantsBodyState extends State<EventParticipantsBody> {
  final controller = PageController(initialPage: 0);
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 18),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  ChoiceChipButton(
                    text: "tak",
                    selected: page == 0,
                    icon: Icons.favorite_border,
                    onPressed: () => animateToPage(0),
                  ),
                  ChoiceChipButton(
                    text: "nie",
                    selected: page == 1,
                    icon: Icons.thumb_down,
                    onPressed: () => animateToPage(1),
                  ),
                  ChoiceChipButton(
                    text: "zaproszeni",
                    selected: page == 2,
                    icon: Icons.group,
                    onPressed: () => animateToPage(2),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Transform(
                    transform: Matrix4.identity()
                      ..scale(1.6, 1.5, 1)
                      ..translate(-20.0, -30.0),
                    child: SvgPicture.asset('assets/images/OvalBackground.svg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: PageView(
                      controller: controller,
                      onPageChanged: (value) => setState(() => {this.page = value}),
                      children: [
                        ListView(children: List.generate(7, (index) => buildListItem())),
                        ListView(children: List.generate(3, (index) => buildListItem())),
                        ListView(children: List.generate(1, (index) => buildListItem())),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  animateToPage(int page) {
    setState(() => {this.page = page});
    //controller.jumpToPage(page);
    controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  Card buildListItem() {
    return Card(
      margin: EdgeInsets.fromLTRB(18, 0, 18, 13),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: ConmiColor().primary),
        title: ConmiFontStyle.robotoMedium16("Janet Wallace"),
        trailing: Icon(
          Icons.more_vert,
          color: Colors.black87,
        ),
      ),
    );
  }
}
