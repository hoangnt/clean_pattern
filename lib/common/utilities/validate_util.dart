class ValidateUtil {
  static final ValidateUtil instance = ValidateUtil._();
  ValidateUtil._();

  String? validateEmail(String? email) {
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (email == null || email.isEmpty) {
      return "Put your email here !";
    }

    if (!regex.hasMatch(email)) {
      return "Email incorrect !";
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Put your password here !";
    }

    if (password.length < 6) {
      return "Your password too short !";
    }

    return null;
  }
}
