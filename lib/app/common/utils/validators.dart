


import 'package:base_application/app/common/utils/utils.dart';

import '../data/strings/strings.dart';



abstract class Validators {
  static String? validateEmpty(String? v) {
    if (v!.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else {
      return null;
    }
  }

  static String? validateTEmpty<T>(T? v) {
    if (v == null) {
      return Strings.fieldCantBeEmpty;
    } else {
      return null;
    }
  }

  static String? validateEmail(String? v) {
    if (v!.isEmpty) {
      return Strings.emailCantBeEmpty;
    } else if (!BasicUtils.isEmail(v)) {
      return Strings.enterValidEmail;
    } else {
      return null;
    }
  }

  static String? validatePhone(String? v) {
    if (v!.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else if (v.length != 10) {
      return Strings.enterValidNumber;
    } else {
      return null;
    }
  }

  static String? validateEmailPhone(String? v) {
    if (v!.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else if (BasicUtils.isNumericOnly(v)) {
      return validatePhone(v);
    } else {
      return validateEmail(v);
    }
  }

  static String? validatePassword(String? v) {
    if (v!.isEmpty) {
      return Strings.passwordCantBeEmpty;
    } else if (v.length < 4) {
      return Strings.passwordValidation;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? v, String password) {
    if (v!.isEmpty || password.isEmpty) {
      return Strings.passwordCantBeEmpty;
    } else if (v.length < 8 || password.length < 8 || v != password) {
      return Strings.confirmPasswordValidation;
    } else {
      return null;
    }
  }


  static String? validateOTPCode(String? v) {
    if (v!.isEmpty) {
      return Strings.otpValidation;
    } else if (v.length < 6) {
      return Strings.otpValidation;
    } else {
      return null;
    }
  }

  static String? validateCheckbox({
    bool v = false,
    String error = Strings.checkboxValidation,
  }) {
    if (!v) {
      return error;
    } else {
      return null;
    }
  }
}
