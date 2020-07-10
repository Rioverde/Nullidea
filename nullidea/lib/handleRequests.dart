import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nullidea/constants.dart';
import 'package:nullidea/screens/profile.dart';

String holder = "";

Map data;
bool registered = false;
bool sendingPin = false;
bool responceState = false;
bool responceStateUsername = false;
bool correctPin = false;
bool patched = false;
//post reques
Future<void> postUser(String email) async {
  String body =
      jsonEncode({"email": email, "mail_type": "verify_account_email"});
  //we send request for temproary user to be reqistered in database
  //if he does not exist we send him verification code
  var url = 'https://nullidea-backend.herokuapp.com/v1/users/temp';
  final response = await http
      .get('https://nullidea-backend.herokuapp.com/v1/users?email=' + email);

  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    print("User already exists I will not send him verification code");
  } else if (response.statusCode == 400) {
    print(email + ' not exists in DB');

    final newresponse = await http.post(
      url,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: body,
    );

    if (newresponse.statusCode == 200) {
      sendingPin = true;
      print("So I sent him verification code via email");
    }
  } else {
    // If the server returns 404,
    // then throw an exception.
    throw Exception('Internal server error');
  }
}

Future<void> checkPin(String email, String pincode, String password) async {
  Map<String, String> registerbody = {"email": email, "password": password};
  //first we check if user email does exist and his pincode is correct
  //if its clear we send to server password and email to reqister user
  var url = 'https://nullidea-backend.herokuapp.com/v1/users/register';

  final pinresponce = await http.get(
      'https://nullidea-backend.herokuapp.com/v1/users/temp/verify?email=' +
          email +
          '&code=' +
          pincode);
  Map data = json.decode(pinresponce.body);
  responceState = data['success'];
  if (responceState) {
    //reqistering user in database
    final response = await http.post(
      url,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(registerbody),
    );
    print(response.body);
    print("User " + email + " Created");
  } else {
    print('Incorrect verification code');
  }
}

//Sighning In User
Future<void> getSignIn(String email, String password, String fcmToken) async {
  final http.Response signInResponce = await http.post(
    'https://nullidea-backend.herokuapp.com/v1/users/login',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
      'fcm_token': fcmToken,
    }),
  );

  Map data = json.decode(signInResponce.body);
  responceState = data['success'];
  username.text = data['username'];
  if (responceState) {
    print("Signed In");
  } else {
    print("Email and password is incorrect");
    print(signInResponce.body);
  }
}

Future<void> changePasswordSendVerificarion(String email) async {
  String body =
      jsonEncode({"email": email, "mail_type": "change_account_password"});
  var url = 'https://nullidea-backend.herokuapp.com/v1/users/temp';
  final response = await http
      .get('https://nullidea-backend.herokuapp.com/v1/users?email=' + email);

  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);
    // Assume the response body is something like: ['foo', { 'bar': 499 }]
    bool state = data['success'];

    if (state) {
      print(email + ' exists in DB');
      final response = await http.post(
        url,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        print(
            "User exists, I will send him verification code to change his password");
        registered = false;
        // If the server did return a 200 CREATED response,
        // then parse the JSON.
      } else if (response.statusCode == 400) {
        print("So user should go and register first");
        registered = true;
      } else
        // If the server returns 404 error,
        // then throw an exception.
        throw Exception('Internal server error');
    }
  } else if (response.statusCode == 400) {
    print("Bad request");
  } else
    throw Exception("Internal server error");
}

Future<void> checkPintoChangePassword(
    String email, String pincode, String password) async {
  Map<String, String> registerbody = {"email": email, "password": password};
  var url = 'https://nullidea-backend.herokuapp.com/v1/users';

  final pinresponce = await http.get(
      'https://nullidea-backend.herokuapp.com/v1/users?email=' +
          email +
          '&code=' +
          pincode);
  Map data = json.decode(pinresponce.body);
  responceState = data['success'];
  if (responceState) {
    // set up PATCH request arguments
    Map<String, String> headers = {"Content-type": "application/json"};

    // make PATCH request
    final response = await http.patch(url,
        headers: headers, body: json.encode(registerbody));
    print(response.body);
    print("Successifully patched");
    patched = true;
  } else {
    print('Incorrect verification code');
  }
}

Future<void> changeUsername(String email, String username) async {
  Map<String, String> usernamebody = {"email": email, "username": username};
  Map<String, String> headers = {"Content-type": "application/json"};
  String url = 'https://nullidea-backend.herokuapp.com/v1/users';

  // make PATCH request
  final response =
      await http.patch(url, headers: headers, body: json.encode(usernamebody));

  print(response.body);
  print(holder);
  Map data = json.decode(response.body);
  responceStateUsername = data['success'];
  if (!responceStateUsername) {
    usernameExist = true;
    print("Username already exists");
  } else if (responceStateUsername) {
    print("username changed");
    data = json.decode(response.body);
    holder = data['data']['username'];
  }
}
