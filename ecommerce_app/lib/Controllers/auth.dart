import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final email = "".obs;
  final password = "".obs;
  RxnString emailError = RxnString(null);
  RxnString passwordError = RxnString(null);

  void validateEmail() {
    if (!GetUtils.isEmail(emailController.text)) {
      emailError.value = "Email is not valid";
    } else {
      emailError.value = null;
    }
  }

  void validatePassword() {
    if (emailController.text.length < 6) {
      passwordError.value = "Password must be at least 6 characters";
    } else {
      passwordError.value = null;
    }
  }

  void submitForm() {
    validateEmail();
    validatePassword();
    if (emailError.value == null && passwordError.value == null) {
      // Proceed with form submission
    }
  }

   final emailController = TextEditingController();
  final passwordController = TextEditingController();

  updateEmail(String Email) {
    email(Email);
  }

  updatePassword(String Password) {
    password(Password);
  }
}


class RegisterConroller extends LoginController {
    final firstName = "".obs;
    final lastName = "".obs;

    RxnString firstNameError = RxnString(null);
    RxnString lastNameError = RxnString(null);

    void validateFirstName() {
      if (firstNameController.text.length < 6){
        firstNameError.value = "firstname must be at least 6 characters";
      }
    } 
    void validateLastName() {
      if (lastNameController.text.length < 6){
        lastNameError.value = "lastname must be at least 6 characters";
      }
    }


    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
}