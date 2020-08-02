import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nullidea/screens/Custom/myCustomIcons.dart';
import 'package:nullidea/screens/Initial/theme.dart';
import '../Data/idea.dart';

class IdeaScreen extends StatefulWidget {
  @override
  _IdeaScreenState createState() => _IdeaScreenState();
}

class _IdeaScreenState extends State<IdeaScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
            children: <Widget>[buildTopInfo(), buildTask(), buildBotInfo()]),
      ),
      enterButton(),
    ]);
  }

//=================================Builders=====================
  Container buildTopInfo() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        color: Colors.grey.shade900,
      ),
      alignment: Alignment.center,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child:
                buildInfo('+' + Idea.ratingBoost.toString(), primaryColor, 16),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.timer,
                  color: primaryColor,
                ),
                buildInfo(Idea.ideaClock, primaryColor, 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildBotInfo() {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    MyCustomIcons.ticket,
                    size: 28,
                    color: primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: buildInfo(
                        Idea.ticketPrice.toString() + ' \$', primaryColor, 16),
                  ),
                ],
              )),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    MyCustomIcons.reward,
                    size: 24,
                    color: Colors.green,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: buildInfo(
                        Idea.reward.toString() + ' \$', Colors.green, 16),
                  ),
                ],
              )),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.group,
                    size: 28,
                    color: primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child:
                        buildInfo(Idea.totalEntry.toString(), primaryColor, 16),
                  ),
                ],
              )),
        ],
      ),
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(18), bottomRight: Radius.circular(18)),
        color: Colors.grey.shade900,
      ),
      alignment: Alignment.center,
      width: double.infinity,
    );
  }

  Container buildTask() {
    return Container(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          Idea.task,
          maxLines: 1000,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.ubuntu(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      width: double.infinity,
    );
  }

  ButtonTheme enterButton() {
    return ButtonTheme(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: RaisedButton(
            color: primaryColor,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10)),
            child: Text(
              "Enter",
              style: GoogleFonts.ubuntu(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            onPressed: () {
              print("Hello");
            }),
      ),
    );
  }

  Text buildInfo(String text, Color color, double size) {
    return Text(
      text,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: GoogleFonts.ubuntu(
          fontSize: size, fontWeight: FontWeight.w600, color: color),
    );
  }
}
