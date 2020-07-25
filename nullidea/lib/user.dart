import 'dart:io';

import 'constants.dart';
import 'handleRequests.dart';

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
  if (username == '' || username == null) {
    returnUsername();
    if (username == '') {
      return 'Username';
    }
    return username;
  }
  returnUsername();
  return username;
}
