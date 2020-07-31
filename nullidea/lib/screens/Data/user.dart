import 'dart:io';

import 'constants.dart';
import '../Requests/handleRequests.dart';

class User {
  static String email;
  static String username;
  static File profilePhoto;
}

Future<void> returnUsername() async {
  temp = await getUsername(User.email).then((String value) {
    return value;
  });
  User.username = temp;
}

String checkUsername(String username) {
  returnUsername();
  if (username == '' || username == null || username == ' ') {
    return 'Username';
  } else
    return username;
}
