import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nullidea/constants.dart';

import 'package:nullidea/user.dart';
import 'package:dio/dio.dart';

var dio = Dio();
Response response;
Map data;
String initPhotolink;
bool registered = false;
bool sendingPin = false;
bool responceState = false;
bool patched = false;

//Post request to send email
Future<void> postUser(String email) async {
  String body =
      jsonEncode({"email": email, "mail_type": "verify_account_email"});
  var url = 'https://nullidea-backend.herokuapp.com/v1/users/temp';
  final response = await http
      .get('https://nullidea-backend.herokuapp.com/v1/users?email=' + email);

  if (response.statusCode == 200) {
    print("User already exists I will not send him verification code");
  } else if (response.statusCode == 400) {
    print(email + ' not exists in DB');
    responceState = false;

    final responce = await http.post(
      url,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: body,
    );

    if (responce.statusCode == 200) {
      sendingPin = true;
      print("So I sent him verification code via email");
    }
  } else {
    throw Exception('Internal server error');
  }
}

//Function to check PIN code
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

  data = json.decode(signInResponce.body);
  responceState = data['success'];
  username.text = data['username'];
  if (responceState) {
    print("Signed In");
  } else {
    print("Email and password is incorrect");
    print(signInResponce.body);
  }
}

//Fuction to send verification code in change password or in register
Future<void> changePasswordSendVerificarion(String email) async {
  String body =
      jsonEncode({"email": email, "mail_type": "change_account_password"});
  var url = 'https://nullidea-backend.herokuapp.com/v1/users/temp';
  final response = await http
      .get('https://nullidea-backend.herokuapp.com/v1/users?email=' + email);

  if (response.statusCode == 200) {
    data = json.decode(response.body);
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
            'User exists, I will send him verification code to change his password');
        registered = false;
      } else if (response.statusCode == 400) {
        print("So user should go and register first");
        registered = true;
      } else
        // If the server returns 500 or 404 error,
        // then throw an exception.
        throw Exception('Internal server error');
    }
  } else if (response.statusCode == 400) {
    print("Bad request");
  } else
    throw Exception("Internal server error");
}

//Checking PinCode to change password
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

//Function to change username
Future<void> changeUsername(String email, String username) async {
  Map<String, String> usernamebody = {"email": email, "username": username};
  Map<String, String> headers = {"Content-type": "application/json"};
  String url = 'https://nullidea-backend.herokuapp.com/v1/users';

  // make PATCH request
  final response =
      await http.patch(url, headers: headers, body: json.encode(usernamebody));

  print(response.body);
  responceState = data['success'];
  if (!responceState) {
    print("Username already exists");
  } else if (responceState) {
    print("username changed");
    data = json.decode(response.body);
    User.username = data['data']['username'];
  } else
    throw Exception("Internal server error");
}

//Function to take Username from Database by email provided
Future<String> getUsername(String email) async {
  final response = await http
      .get('https://nullidea-backend.herokuapp.com/v1/users?email=' + email);

  if (response.statusCode == 200) {
    return data['data']['username'];
  } else if (response.statusCode == 400) {
    return email + ' not exists in DB';
  } else
    return 'Error';
}

//Get profile photo from caamera or gallery to send it to => Database => AWS
Future<void> getPhoto(String email, File photo) async {
  Map<String, dynamic> imageBody = {
    "email": email,
    "image": await MultipartFile.fromFile(photo.path)
  };

  String url =
      'https://nullidea-backend.herokuapp.com/v1/users/image?email=' + email;

  FormData formData = new FormData.fromMap(imageBody);
  response = await dio.patch(url, data: formData);

  if (response.statusCode == 200) {
    print("sended, updated");
  } else if (response.statusCode == 400) {
    print("Error 400");
  } else
    print("Error 500");
  throw Exception("Internal server error");
}

//Function to  take image from amazon cloud directly by providinglink from Database
Future<void> getImageFromAWS(String email) async {
  response = await dio
      .get('https://nullidea-backend.herokuapp.com/v1/users?email=' + email);
  print(response.data.toString());
  String imageURL = response.data['data']['image_url'];
  tempImageUrl = imageURL;
}
