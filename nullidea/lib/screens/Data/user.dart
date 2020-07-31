import 'dart:io';

import 'constants.dart';
import '../Requests/handleRequests.dart';

class User {
  static String email;
  static String username;
  static File profilePhoto;
  static int entries = 0;
  static int rating = 0;
  static int earned = 0;
}

//Take data about Username from server first take to temp variable
Future<void> returnUsername() async {
  temp = await getUsername(User.email).then((String value) {
    return value;
  });
  //Store the Username in User.username
  User.username = temp;
}

//In case if by initial conditions the Username is empty we check to avoid null
String checkUsername(String username) {
  returnUsername();
  if (username == '' || username == null || username == ' ') {
    returnUsername();
    return 'Username';
  } else
    return username;
}
