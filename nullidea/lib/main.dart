import 'package:flutter/material.dart';

void main() {
  runApp(Nullidea());
}

class Nullidea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(children: <Widget>[
          Text(
            'Nullidea',
            style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 60.0,
                color: Color.fromRGBO(255, 203, 50, 1)),
          ),
          Container(
            color: Colors.grey.shade900,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(children: <Widget>[
              Icon(
                Icons.person,
                color: Colors.grey.shade500,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Email",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ]),
          ),
          Container(
            color: Colors.grey.shade900,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(children: <Widget>[
              Icon(
                Icons.lock,
                color: Colors.grey.shade500,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Password",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ]),
          ),
        ]),
      ),
    ));
  }
}
