import 'dart:convert';
import 'package:http/http.dart' as http;


bool pin = false;
//post request
Future<void> postUser(String email, String password) async {


  String body = jsonEncode({"email": email});
  var url = 'https://nullidea.herokuapp.com/v1/users/verify';
  final response =
      await http.get('https://nullidea.herokuapp.com/v1/users/?email=' + email);

  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);
    // Assume the response body is something like: ['foo', { 'bar': 499 }]
    bool state = data['success'];
    

    if (state == false) {
        pin = false;

      print(email + ' not exists in DB');
      final response = await http.post(
        url,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        pin = true;
        print("So I sent him verification code via email");
        // If the server did return a 200 CREATED response,
        // then parse the JSON.
      } else {
        
        // If the server did not return a 200 CREATED response,
        // then throw an exception.

        throw Exception('Internal server error');
      }
    } else if (state == true) {
      print("User already exists I will not send him verification code");
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Internal server error');
  }
}
