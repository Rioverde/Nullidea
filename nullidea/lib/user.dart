import 'constants.dart';
import 'handleRequests.dart';



class User {
  static String email;
  static String username = checkUsername(temp);
}

Future<void> returnUsername() async {
  temp = await getUsername(User.email).then((String value) {
    return value;
  });

  User.username = temp;
}

String checkUsername(String username) {
  print(username);
  if (username == '') {
    returnUsername();
    if (username == '') {
      return '';
    }
    return username;
  } else if (username == null) {
    returnUsername();
    return username;
  }
  returnUsername();
  return username;
}
