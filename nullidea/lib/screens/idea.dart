import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  Text(
                    "+1000",
                    style: GoogleFonts.ubuntu(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.black,
                      ),
                      Text(
                        "10:06:23",
                        style: GoogleFonts.ubuntu(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
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
                child: Row(),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18), bottomRight: Radius.circular(18)),
                  color: Colors.grey.shade900,
                ),
                alignment: Alignment.bottomCenter,
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
}
