import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nullidea/myCustomIcons.dart';
import 'package:nullidea/theme.dart';

class Idea extends StatefulWidget {
  @override
  _IdeaState createState() => _IdeaState();
}

class _IdeaState extends State<Idea> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  buildInfo("+100", Colors.black, 16),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.black,
                      ),
                      buildInfo("10:09:21", Colors.black, 16),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Main task to do",
                  maxLines: 4,
                  style: GoogleFonts.ubuntu(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              MyCustomIcons.ticket,
                              size: 32,
                              color: primaryColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: buildInfo("150" + '\$', primaryColor, 16),
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
                              child: buildInfo("500" + '\$', Colors.green, 16),
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
                              child: buildInfo("500", primaryColor, 16),
                            ),
                          ],
                        )),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18)),
                  color: Colors.grey.shade900,
                ),
                alignment: Alignment.center,
                width: double.infinity,
              ),
            )
          ]),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ]);
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
