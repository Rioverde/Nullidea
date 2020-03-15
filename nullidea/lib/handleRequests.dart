import 'dart:convert';

import 'package:http/http.dart' as http;

// Sending a POST request

String replace(String emailconvert) {
  return emailconvert.replaceAll('@', '%40');
}

//post request
Future<void> postUser(String email, String password) async {
  String body = jsonEncode({"email": email, "password": password});

  var url = 'https://nullidea.herokuapp.com/v1/users/verify';
  final response = await http.post(
    url,
    headers: <String, String>{'Content-Type': 'application/json'},
    body: body,
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  } else {
    // If the server did not return a 200 CREATED response,
    // then throw an exception.
    throw 'Error occured in server or user already exists';
  }

}
