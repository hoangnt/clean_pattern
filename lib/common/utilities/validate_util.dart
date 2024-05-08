import 'package:get/get.dart';

class ValidateUtil {
  static String? validateEmail(String? email) {
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (email == null || email.isEmpty) {
      return "Put your email here !".tr;
    }

    if (!regex.hasMatch(email)) {
      return "Email incorrect !".tr;
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Put your password here !".tr;
    }

    if (password.length < 6) {
      return "Your password too short !".tr;
    }

    return null;
  }

  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "This is empty !".tr;
    }

    return null;
  }
}
