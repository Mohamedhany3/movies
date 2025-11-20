class Validator {
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please,enter your name";
    }
    return null;
  }

  String? validateEmail(String? value) {
    var regEx = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (value == null || value.trim().isEmpty) {
      return "Please,enter your email";
    }
    if (!regEx.hasMatch(value)) {
      return "Email bad format";
    }
    return null;
  }

  String? validatePassword(String? value) {
    var regEx = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (value == null || value.trim().isEmpty) {
      return "Please,enter password";
    }
    if (!regEx.hasMatch(value)) {
      return "Enter valid Password";
    }
    return null;
  }

  String? validateRePassword(String? rePassword, String? password) {
    if (rePassword == null || rePassword.trim().isEmpty) {
      return "Please,enter password again";
    }
    if (rePassword != password) {
      return "Password doesn't match";
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please,enter Phone Number";
    }
    if (value.length != 11) {
      return "Phone Number must be 11 digits";
    }
    return null;
  }
}
