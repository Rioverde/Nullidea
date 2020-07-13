import 'constants.dart';

String validatePasswordCases(String value) {
  Pattern pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = new RegExp(pattern);
  if (value.isEmpty) {
    return "Password field should not be empty";
  } else if (value.length < 8) {
    return "Password should have at least 8 characters";
  } else if (value.contains(" ")) {
    return "Password should not have spaces";
  } else if (!regex.hasMatch(value)) {
    return "Invalid password, try eg: Test123*!";
  } else
    return null;
}

String validateEmailCases(String value) {
  Pattern pattern = r'(?=.*?[@])';
  RegExp regex = new RegExp(pattern);
  if (value.isEmpty) {
    return "Email field should not be empty";
  } else if (!regex.hasMatch(value)) {
    return "Email should have '@' character";
  } else if (value.contains(" ")) {
    return "Email should not have spaces";
  } else
    return null;
}

String authUserEmail(String value) {
  Pattern pattern =
      r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
  if (value == pattern) {
    return null;
  } else {
    return "Email does not exists";
  }
}

String authUserPassword(String value) {
  if (value == password) {
    return null;
  } else {
    return "Password is incorrect";
  }
}

String validateUsername(String value) {
  Pattern pattern =
      r'^[a-zA-Z0-9]+([._\s\-]?[a-zA-Z0-9])*$';
  RegExp regex = new RegExp(pattern);
  if (value.isEmpty) {
    return "Username should not be empty";
  } else if (value.length > 15) {
    return "Should be less than 15 characters";
  }else if (value == holder) {
    return "Username already exists";
  } else if (value.contains(" ")) {
    return "Password should not have spaces";
  } else if (!regex.hasMatch(value)) {
    return "Invalid username";
  } else if(value == pattern){
    return null;
  }
  else 
  return null;
}
